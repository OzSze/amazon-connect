# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

# Purpose
# This code demonstrates how to create a bucket in Amazon Simple Storage Service (Amazon S3).

# snippet-start:[s3.ruby.create_bucket_snippet.rb]
require 'aws-sdk-s3'

# @param s3_client [Aws::S3::Client] An initialized Amazon S3 client.
# @param bucket_name [String] The bucket's name.
# @return [Boolean] true if the bucket was created; otherwise, false.
# @example
#   s3_client = Aws::S3::Client.new(region: 'us-west-2')
#   exit 1 unless bucket_created?(s3_client, 'doc-example-bucket')
def bucket_created?(s3_client, bucket_name)
  s3_client.create_bucket(bucket: bucket_name)
rescue StandardError => e
  puts "Error while creating the bucket named '#{bucket_name}': #{e.message}"
end

# Full example call:
# Replace us-west-2 with the AWS Region you're using for Amazon S3.
def run_me
  bucket_name = 'doc-example-bucket'
  region = 'us-west-2'

  s3_client = Aws::S3::Client.new(region: region)

  puts "Creating the bucket '#{bucket_name}'..."

  if bucket_created?(s3_client, bucket_name)
    puts 'The bucket was created.'
  else
    puts 'The bucket was not created. Stopping program.'
    exit 1
  end
end

run_me if $PROGRAM_NAME == __FILE__

# snippet-end:[s3.ruby.create_bucket_snippet.rb]
