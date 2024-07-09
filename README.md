# CloudUploader to S3 Bucket with Command Line Interface

## A fully functional CLI 
A bash-based CLI tool developed with Ubuntu 22 that allows users to quickly upload files to S3 , providing a seamless upload experience including, 
* Checking list of all S3 buckets with a timeout (make sure you have one)
* Upload format ```/path/to/file [s3-bucket-name] [s3-target-path]```
* Will give you descriptive error about the file or cloud storage when you trying to upload

## Learn More
![image](https://github.com/vincentarck/CloudUploader-CLI/assets/73167671/d9b35f0b-1b78-4004-bcdc-d809cc8cdd95)
![image](https://github.com/vincentarck/CloudUploader-CLI/assets/73167671/daf2f361-7d2b-4e69-89f9-083e39b29862)

## How to install this CLI
1. Clone this project
2. ```cd``` into folder
3. Configure ```AWS Credentials``` (https://docs.aws.amazon.com/solutions/latest/data-transfer-hub/set-up-credentials-for-amazon-s3.html)
4. Make sure ```User``` using correct ```IAM Policy``` for specific service in ```AWS S3```
5. Setup you AWS CLI with ```access key``` and ```secret key``` 
6. run ```uploadtos3.sh``` with this format ```/path/to/file [s3-bucket-name] [s3-target-path]```

## Tips for troubleshoot
1. Permission Dennied or ```aws s3``` command took to long for response
   * Make sure you have correct region set up according to user that you use for `s3` go check your `~/.aws-config` file
   * Make sure this command list all the `s3` `aws s3 ls --endpoint-url https://s3.<region-name>.amazonaws.com` bucket *if     there is typo `url`
   

## Find Bugs
If you found an issue or would like to submit an improvement to this project, please submit an issue using the issue tab above.
