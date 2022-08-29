import json
import boto3

def lambda_handler(event, context):

   notification = "A new user has visited your website !"
   client = boto3.client('sns')
   response = client.publish (
      TargetArn = "arn:aws:sns:us-east-1:237301564654:DynamoDBUpdates",
      Message = json.dumps({'default': notification}),
      MessageStructure = 'json'
   )

   return {
      'statusCode': 200,
      'body': json.dumps(response)
   }