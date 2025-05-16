#Assuming a Role in Code (Python)
sts_client = boto3.client('sts')

assumed_role = sts_client.assume_role(
    RoleArn="arn:aws:iam::123456789012:role/EC2S3AccessRole",
    RoleSessionName="AssumeRoleSession"
)

credentials = assumed_role['Credentials']
s3_client = boto3.client(
    's3',
    aws_access_key_id=credentials['AccessKeyId'],
    aws_secret_access_key=credentials['SecretAccessKey'],
    aws_session_token=credentials['SessionToken']
)

response = s3_client.list_buckets()
print(response)
