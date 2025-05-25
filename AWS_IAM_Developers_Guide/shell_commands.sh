#Creating an IAM User (AWS CLI)
aws iam create-user --user-name dev-user

#Attaching a Policy to a User
aws iam attach-user-policy \
    --user-name dev-user \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

#Creating an IAM Role for EC2
aws iam create-role \
    --role-name EC2S3AccessRole \
    --assume-role-policy-document file://ec2-trust-policy.json

#Attaching a Policy to a Role
aws iam attach-role-policy \
    --role-name EC2S3AccessRole \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

#Create an instance profile
aws iam create-instance-profile \ 
	--instance-profile-name EC2S3AccessProfile 
aws iam add-role-to-instance-profile \ 
    --instance-profile-name EC2S3AccessProfile \ 
    --role-name EC2S3AccessRole

#Launch EC2 with the role
aws ec2 run-instances \ 
    --image-id ami-0abcdef1234567890 \ 
    --instance-type t2.micro \ 
    --iam-instance-profile Name=EC2S3AccessProfile

#Enable MFA (Multi-Factor Authentication)
aws iam enable-mfa-device 
	--user-name root 
    --serial-number arn:aws:iam::123456789012:mfa/root-account-mfa 
    --authentication-code-1 123456 
    --authentication-code-2 654321

#Restrict session duration for assumed roles
aws iam update-role --role-name DevRole --max-session-duration 3600 # 1 hour

#Tag IAM Resources for Better Governance
aws iam tag-user --user-name dev-user --tags Key=Project,Value=APIv2

#Permissions Boundaries
aws iam put-user-permissions-boundary \
    --user-name dev-user \
    --permissions-boundary arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
