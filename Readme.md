# Localstack example

[Localstack](https://localstack.cloud/) is a fully functional local cloud stack .
             Develop and test your cloud and serverless apps offline!

##
## Requirements


- python (Python 3.6 up to 3.9 supported)
- pip (Python package manager)
- Docker

## Installation
We can run localstack via Docker,go to localstack folder(docker-compose file needs to fulfill your project needs):

```bash
docker-compose up -d
```

or install it
```bash
pip install localstack
```

## Usage

 Deploy Static Web to Localstack "offline" AWS S3 bucket 

s3-bucket-static-website script , creates and deploy your static website to  localstack S3 bucket.
```bash
bash s3-bucket-static-website.sh 

  Usage: s3-bucket-static-website.sh [bucket-name] [endpoint-url] [folder-path] [start-index-file] 
```

s3-delete-bucket , it force deletes your chosen bucket even if it is not empty!!!
```bash
bash scripts/s3-bucket/s3-delete-bucket.sh 
  

   Usage: scripts/s3-bucket/s3-delete-bucket.sh [bucket-name] [endpoint-url] 
```
## Contributing
Pull requests are more than welcome.

## Repo has to be fullfilled with other examples as we go....
## Origin Repo
https://github.com/localstack/localstack
