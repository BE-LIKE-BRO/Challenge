import boto3

import json

dynamodb = boto3.resource('dynamodb')
ddbTableName = "Counter"
table = dynamodb.Table(ddbTableName) 

def lambda_handler(event, context):
    
    response = table.get_item(Key= {'ID' : 'count'})
    count = response["Item"]["visitor_count"]
    
    # increment string version of visit count
    new_count = str(int(count)+1)
    response = table.update_item(
        Key={'ID': 'count'},
        UpdateExpression='set visitor_count = :c',
        ExpressionAttributeValues={':c': new_count},
        ReturnValues='UPDATED_NEW'
        )
        
    return {'Count':new_count}
#end lambda_handler

    
    return {
        'statusCode': 200,
        'headers': {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token',
            'Access-Control-Allow-Credentials': 'true',
            'Content-Type': 'application/json'
        },
        'body': get_count()
    }
