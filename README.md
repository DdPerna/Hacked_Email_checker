# Hacked_Email_checker
a bash script for checking if your email has been involved in a possible leak. 

## Getting started

First, clone the repository using git (recommended):

```bash
git clone https://github.com/DdPerna/Hacked_Email_checker.git
```
Then give the execution permission to the script to run it:

```bash
 $chmod +x email_checker.sh
 $./email_checker.sh example_email.txt
```

## Setup

This script reads a text file containing a list of emails then makes an API call to https://hacked-emails.com/

Look at the example_emails.txt file and edit the emails you want to check. Make sure to keep the format the same.
There is a limit on API calls per day so checking hundreds of email will require a different solution. 

The template.txt file is a generic email response sent to the affected email account, customize if you like. 

## Future Plans

Since there is a limit on the number of API calls per day, checking hundreds of emails is not possible. One solution to this problem would be to maintain your own database of the leaked information, then re-write the bash script. Most of this information is publically available and can be found through a simple google search. 

There are two sites that are great sources for checking your email and have live feeds of leaks.

https://hacked-emails.com/

https://haveibeenpwned.com/
