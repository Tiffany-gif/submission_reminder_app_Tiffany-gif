#!/bin/bash

# Prompt user for their name
echo -n "Enter your name: "
read user_name

# Define the base directory
base_dir="submission_reminder_${user_name}"

# Create the main directory
mkdir -p "$base_dir"

# Create subdirectories
mkdir -p "$base_dir/app"
mkdir -p "$base_dir/modules"
mkdir -p "$base_dir/assets"
mkdir -p "$base_dir/config"

# Create necessary files
touch "$base_dir/app/reminder.sh"
touch "$base_dir/modules/functions.sh"
touch "$base_dir/assets/submissions.txt"
touch "$base_dir/config/config.env"
touch "$base_dir/startup.sh"

# Populate config.env file
echo "# Configuration File" > "$base_dir/config/config.env"
echo "REMINDER_INTERVAL=24h" >> "$base_dir/config/config.env"

# Populate reminder.sh script
echo "#!/bin/bash" > "$base_dir/app/reminder.sh"
echo "echo 'Sending reminders to students...'" >> "$base_dir/app/reminder.sh"
chmod +x "$base_dir/app/reminder.sh"

# Populate functions.sh script
echo "#!/bin/bash" > "$base_dir/modules/functions.sh"
echo "send_reminder() {" >> "$base_dir/modules/functions.sh"
echo "    echo 'Reminder sent to student'" >> "$base_dir/modules/functions.sh"
echo "}" >> "$base_dir/modules/functions.sh"
chmod +x "$base_dir/modules/functions.sh"

# Populate submissions.txt with sample data
echo "John Doe, Submitted" > "$base_dir/assets/submissions.txt"
echo "Jane Smith, Not Submitted" >> "$base_dir/assets/submissions.txt"
echo "Alice Brown, Submitted" >> "$base_dir/assets/submissions.txt"
echo "Bob White, Not Submitted" >> "$base_dir/assets/submissions.txt"
echo "Charlie Green, Submitted" >> "$base_dir/assets/submissions.txt"

# Populate startup.sh script
echo "#!/bin/bash" > "$base_dir/startup.sh"
echo "echo 'Starting Submission Reminder App...'" >> "$base_dir/startup.sh"
echo "bash \"\$(dirname \"\$0\")/app/reminder.sh\"" >> "$base_dir/startup.sh"
chmod +x "$base_dir/startup.sh"

# Print success message
echo "Environment setup complete! Run ./startup.sh to start the application."
