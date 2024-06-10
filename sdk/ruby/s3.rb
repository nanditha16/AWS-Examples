#!/usr/bin/env ruby

# Required libraries
require 'aws-sdk-s3'   # AWS SDK for S3
require 'pry'          # Pry for debugging
require 'securerandom' # SecureRandom for generating random strings

# Retrieve the bucket name from the environment variables
bucket_name = ENV['BUCKET_NAME']

# Create an S3 client object
client = Aws::S3::Client.new

# Create a bucket with the specified name and region
resp = client.create_bucket({
  bucket: bucket_name
})
# binding.pry

# Generate a random number of files between 1 and 6
number_of_files = 1 + rand(6)
puts "Number of files: #{number_of_files}" 

# Loop to create and upload each file
number_of_files.times.each do |i|
    puts "File index i: #{i}"
    
    # Generate a filename for the current file
    filename = "file_#{i}.txt"
    output_path = "/tmp/#{filename}" # Specify the local file path
    
    # Generate a random string and write it to the file
    File.open(output_path, "w") do |f|
        f.write(SecureRandom.uuid)
    end 
 
    # Upload the file to the S3 bucket
    File.open(output_path, "rb") do |f|
       # Upload the file to the S3 bucket
        client.put_object(
            bucket: bucket_name,
            key: filename,
            body: File.open(output_path, "rb")
        )

    end 
end    
