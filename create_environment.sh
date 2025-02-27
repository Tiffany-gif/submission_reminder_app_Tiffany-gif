#!/bin/bash

echo "Creating Environment..."

# Get the directory where the script is located
dir="$(dirname "$0")"

#prompt user for their name
echo -n "Enter Your name:"
read user_name

#Define the base directory
base_dir="$dir/submission_reminder_${user_name}"

#Create the main directory
mkdir -p "$base_dir"

#Create subdirectories
mkdir -p "$base_dir/app"
mkdir -p "$base_dir/modules"
mkdir -p "$base_dir/assets"
mkdir -p "$base_dir/config"

echo "Directories are well  created!"

touch "$base_dir/app/reminder.sh"
touch "$base_dir/modules/functions.sh"
touch "$base_dir/assets/submissions.txt"
touch "$base_dir/config/config.env"
touch "$base_dir/startup.sh"

echo "Files are also created!"

echo 'ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2' > "$base_dir/config/config.env"

echo '#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"

echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file' > "$base_dir/app/reminder.sh"


echo '#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is "not submitted"
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}' > "$base_dir/modules/functions.sh"
echo '#!/bin/bash

# Step 1: Make sure we are in the correct directory
cd "$(dirname "$0")"

# Step 2: Start the reminder app
echo "Starting the Reminder App..."

# Execute the reminder script
bash ./app/reminder.sh

echo "Reminder App has been executed successfully!"' > "$base_dir/startup.sh"

cat <<EOL >> $base_dir/assets/submissions.txt
Student Name, Assignment, Status
Ashelia, Shell Navigation, not submitted
Emma, Shell Navigation, submitted
Dylan, Shell Navigation, not submitted
Nelly, Shell Navigation, submitted
Amelia, Shell Navigation, not submitted
EOL

echo "Environment setup complete! Run ./startup to start the application"

chmod +x "$base_dir/startup.sh"
