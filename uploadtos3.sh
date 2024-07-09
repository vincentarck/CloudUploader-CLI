#!/bin/bash

# Check if the script received an argument
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/file [s3-bucket-name] [s3-target-path]"
  exit 1
fi

# Assign the arguments to variables
FILE_PATH=$1
S3_BUCKET=${2:-your-default-bucket-name}  # Default S3 bucket name if not provided
S3_TARGET_PATH=${3:-}  # Optional target path in S3 bucket

# Check if the file exists
if [ -f "$FILE_PATH" ]; then
  echo "File exists: $FILE_PATH"
else
  echo "File does not exist: $FILE_PATH"
  exit 1
fi

# List all S3 buckets with a timeout of 10 seconds
echo "Listing all S3 buckets:"
timeout 10 aws s3 ls
if [ $? -eq 124 ]; then
  echo "Listing S3 buckets timed out."
else
  echo "S3 buckets listed successfully."
fi

# Define the S3 target URL
if [ -z "$S3_TARGET_PATH" ]; then
  S3_URL="s3://$S3_BUCKET/$(basename "$FILE_PATH")"
else
  S3_URL="s3://$S3_BUCKET/$S3_TARGET_PATH/$(basename "$FILE_PATH")"
fi

# Upload the file to S3
aws s3 cp "$FILE_PATH" "$S3_URL"

# Check if the upload was successful
if [ $? -eq 0 ]; then
  echo "File uploaded successfully to $S3_URL"
else
  echo "File upload failed"
  exit 1
fi

# Optionally, list the contents of the S3 bucket after upload with a timeout of 10 seconds
echo "Listing contents of S3 bucket $S3_BUCKET:"
timeout 10 aws s3 ls "s3://$S3_BUCKET/"
if [ $? -eq 124 ]; then
  echo "Listing contents of S3 bucket timed out."
else
  echo "Contents of S3 bucket listed successfully."
fi

