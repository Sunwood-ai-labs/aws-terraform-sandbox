
import json
def handler(event, context):
    print('test')
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
