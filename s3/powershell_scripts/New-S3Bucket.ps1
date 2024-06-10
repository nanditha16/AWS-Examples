Import-Module AWS.Tools.S3

$region = "us-east-1"
$bucketName = Read-Host -Prompt 'Enter the S3 bucket name'

Write-Host "AWS Region: $region"
Write-Host "S3 Bucket: $bucketName"

# Function to check if the bucket exists
function BucketExists {
    param (
        [string]$bucketName
    )
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}

if (-not (BucketExists -bucketName $bucketName)){
    Write-Host "S3 Bucket: $bucketName doesn't exist"
    New-S3Bucket -BucketName $bucketName -Region $region
} else {
    Write-Host "S3 Bucket: $bucketName already exists"
    # Create a new file
    $fileName = 'myfile.txt'
    $fileContent = 'Hello World!'
    Set-Content -Path $fileName -Value $fileContent

    # Upload the file to S3 bucket
    Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName
}
