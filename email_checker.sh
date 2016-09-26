#!/bin/bash

# Safety feature: exit script if error is returned, or if variables not set.
# Exit if a pipeline results in an error.
set -ue
set -o pipefail

# set variables
FILE=$1
COUNT=0

# read file line by line
while IFS= read -r line || [[ -n "$line" ]];
do
        # keep track of line number
        let COUNT=$COUNT+1

        # skip empty lines
        if [ ! -z "$line" ]; then

                # grab data and make api call then save formatted output
                EMAIL=$( echo "$line" | cut -d\, -f1)

                RESULTS=$( echo "$line" | cut -d\= -f2)

                OUTPUT=$(curl -s https://hacked-emails.com/api?q="$EMAIL" | python -m json.tool)

                OUTPUT_RESULTS=$( echo "$OUTPUT" | grep results | cut -d ' ' -f6 | cut -d\, -f1)


                # check if the number of hits for an email is different
               if [ ! $RESULTS -eq $OUTPUT_RESULTS ]; then

                        #ignore hits from pastebin and dns. Others may be added in the future
                        if [[ ! $OUTPUT == *"pastebin"* && ! $OUTPUT == *"dns"* ]]; then

                                # format output
                                OUTPUT_DETAILS=$( echo "$OUTPUT" | grep details | cut -d\" -f4)

                                echo "email: $EMAIL file results: $RESULTS web results: $OUTPUT_RESULTS Details: $OUTPUT_DETAILS"

                                sed -i -e ''"$COUNT"'s/'"$RESULTS"'/'"$OUTPUT_RESULTS"'/g' $FILE

                                # grab template for email and save with output included
                                cat template.txt > message.txt

                                echo "$OUTPUT_DETAILS" >> message.txt

                                # send an email notification to the user
                                cat message.txt | mail -r "example@blah.com" -s "Email Checker" $EMAIL >/var/log/check_maillog 2>&1
                        fi
               fi
        fi
done < "$FILE"
