## Create a new S3.bucket
```sh
aws s3 mb s3://aws-cs-practice-nan1
```

## Create a file that will do a checksum tests on
```sh
echo "Hello checksums" > cs_file.txt
```

## Get a checksum of a file for md5 
```sh
md5sum cs_file.txt
# c7f5019704cc869c9e6b822e118c3ece  cs_file.txt
```

## upload this file to S3.bucket and look at its etag - 
<!-- This CLI upload will not add any checksum and Additional checksums - Off -->
```sh
aws s3 cp cs_file.txt s3://aws-cs-practice-nan1
aws s3api head-object --bucket aws-cs-practice-nan1 --key cs_file.txt
```
<!-- {
    "AcceptRanges": "bytes",
    "LastModified": "2024-06-15T18:06:27+00:00",
    "ContentLength": 16,
    "ETag": "\"c7f5019704cc869c9e6b822e118c3ece\"",
    "ContentType": "text/plain",
    "ServerSideEncryption": "AES256",
    "Metadata": {}
} -->


## upload this file to S3.bucket with user specified checksum - user defined 
<!-- The cksum command in Unix-like systems (Linux, macOS) computes a cyclic redundancy check (CRC) checksum using the CRC-32 algorithm. -->
```sh
cksum cs_file.txt
```

<!-- Use the aws s3api put-object command to upload your file. 
Specify the crc32 checksum using the --metadata option with a custom metadata key (crc32-checksum in this example)
However, when uploaded Additional checksums is still - Off  -->
```sh
aws s3api put-object \
--bucket "aws-cs-practice-nan1" \
--key "cs_file_crc32.txt" \
--body "cs_file.txt" \
--metadata "crc32-checksum=719192522,x-amz-meta-checksum-algo=crc32"


aws s3api head-object --bucket aws-cs-practice-nan1 --key cs_file_crc32.txt
```
<!-- {
    "AcceptRanges": "bytes",
    "LastModified": "2024-06-15T18:52:11+00:00",
    "ContentLength": 16,
    "ETag": "\"c7f5019704cc869c9e6b822e118c3ece\"",
    "ContentType": "binary/octet-stream",
    "ServerSideEncryption": "AES256",
    "Metadata": {
        "crc32-checksum": "719192522",
        "x-amz-meta-checksum-algo": "crc32"
    }
}
} -->


## upload this file to S3.bucket with user specified checksum - sha1
<!-- The sha1sum command computes a cryptographic hash function using the SHA-1 (Secure Hash Algorithm 1)
 algorithm.  -->
```sh
sha1sum cs_file.txt 
```

<!-- Use the aws s3api put-object command to upload your file. 
Specify the sha1 checksum using the --metadata option with a custom metadata key (sha1-checksum in this example)
However, when uploaded Additional checksums is still - Off  -->
```sh
aws s3api put-object \
--bucket "aws-cs-practice-nan1" \
--key "cs_file_sha1.txt" \
--body "cs_file.txt" \
--metadata "sha1-checksum=5398dce18580a72c14528947289c1ea45d1e6f5e"

aws s3api head-object --bucket aws-cs-practice-nan1 --key cs_file_sha1.txt
```
<!-- {
    "AcceptRanges": "bytes",
    "LastModified": "2024-06-15T18:09:23+00:00",
    "ContentLength": 16,
    "ETag": "\"c7f5019704cc869c9e6b822e118c3ece\"",
    "ContentType": "binary/octet-stream",
    "ServerSideEncryption": "AES256",
    "Metadata": {
        "sha1-checksum": "5398dce18580a72c14528947289c1ea45d1e6f5e"
    }
} -->


## upload this file to S3.bucket via AWS console, you turn on that feature : Additional checksums - On, Checksum function - SHA-256

<!-- When Amazon S3 receives the object, it calculates the checksum by using the algorithm specified. 
https://aws.amazon.com/getting-started/hands-on/amazon-s3-with-additional-checksums/?ref=docs_gateway/amazons3/checking-object-integrity.html
-->
```sh
aws s3api head-object --bucket aws-cs-practice-nan1 --key cs_file_sha256.txt
```
<!-- 
In console: 
Additional checksums: On
Checksum function: SHA-256
Checksum value: esiGdLAy1gnWjs4csDEu8tmod/0tnJeMa/p9/GHl/dI=

Verification from source before uploading
openssl dgst -sha256 -binary cs_file_sha256.txt | base64
esiGdLAy1gnWjs4csDEu8tmod/0tnJeMa/p9/GHl/dI=

{
    "AcceptRanges": "bytes",
    "LastModified": "2024-06-15T18:10:31+00:00",
    "ContentLength": 16,
    "ETag": "\"c7f5019704cc869c9e6b822e118c3ece\"",
    "ContentType": "text/plain",
    "ServerSideEncryption": "AES256",
    "Metadata": {}
} -->


## Create a folder structure 
```sh
aws s3api put-object \
--bucket "aws-cs-practice-nan1" \
--key "prefix-bucket-folder/" 

aws s3api head-object --bucket aws-cs-practice-nan1 --key prefix-bucket-folder/
```
<!-- {
    "AcceptRanges": "bytes",
    "LastModified": "2024-06-15T18:24:26+00:00",
    "ContentLength": 0,
    "ETag": "\"d41d8cd98f00b204e9800998ecf8427e\"",
    "ContentType": "binary/octet-stream",
    "ServerSideEncryption": "AES256",
    "Metadata": {}
} -->

