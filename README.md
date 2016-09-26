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

