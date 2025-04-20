#Create a project folder
mkdir deepseek-lambda && cd deepseek-lambda

#Install deepseek SDK in a package directory
pip install deepseek -t ./package

#Zip the dependencies
cd package && zip -r ../lambda-package.zip .

#Add your code to the ZIP file
zip -g lambda-package.zip lambda_function.py

#Deploy the CloudFormation stack
aws cloudformation deploy \
  --template-file deepseek_in_lambda_cf.yaml \
  --stack-name deepseek-lambda \
  --parameter-overrides DeepSeekApiKey=your_api_key_here