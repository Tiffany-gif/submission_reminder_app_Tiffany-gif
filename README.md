# Submission Reminder App

## Overview

This script sets up a simple environment to help track student assignment submissions. Once everything is set up, it checks which students have not submitted a specific assignment and prints out reminders for them. It’s useful for instructors or coordinators who want to quickly identify pending submissions.

---

## What the Script Does

1. Prompts for Your Nam
   When you run the script, it asks you to enter your name. This name is used to create a personalized folder for the environment.

2. Creates a Project Environment  
   The script sets up a folder named after you (for example, `submission_reminder_John`) and creates organized subfolders within it:
   - `app` – contains the main logic to check submissions.
   - `modules` – includes helper functions.
   - `assets` – holds the submission data.
   - `config` – contains environment settings like assignment name and deadline.

3. Generates Important Files  
   It creates all the essential files such as:
   - A reminder script that runs the check.
   - A helper function to scan through student submissions.
   - A config file to define the assignment name and days left.
   - A mock list of students and their submission status.
   - A startup script that launches the reminder system.

4. Fills in Sample Data
   The script adds a small example list of students, with some marked as "submitted" and others as "not submitted."

5. Prepares Everything for Execution  
   Once the setup is complete, it tells you how to run the application and check for pending submissions.

---

## How to Use It

- Run the script once to set up your environment.
- After setup, go into your personalized folder.
- Use the startup file to launch the reminder system.
- The reminder will show which students still need to submit the assignment.

---

## Summary

This tool is a simple way to stay on top of assignment submissions. It creates a clean structure, provides sample data, and includes a working reminder system that highlights students who haven’t submitted yet.
