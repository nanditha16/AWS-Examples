Import-Module AWS.Tools.S3

$region = "us-east-1"

$bucketName = Read-Host -Prompt 'Enter the S3 bucket name'

Write-Host "AWS- Region: $region"
Write-Host "S3 Bucket: $bucketName"


function BucketExists {
    $bucket = GET-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}

if (-not (BucketExists)){
    Write-Host "S3 Bucket: $bucketName doesnt exists"
    New-S3Bucket -BucketName $bucketName -Region $region
} else {
    Write-Host "S3 Bucket: $bucketName already exists"
    #create a new file
    $fileName = 'myfile.txt'
    $fileContent = 'Hello World!'
    Set-Content -Path $fileName -Value $fileContent

    Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName

}


