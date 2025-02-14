#!/bin/bash


#Source environment variables and helper functions
source "$(dirname "$0")/../config/config.env"
source "$(dirname "$0")/../modules/functions.sh"

# Path to the submissions file
submissions_file="submission_reminder_Tiffany/assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "$submissions.file"
