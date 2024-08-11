import boto3
import json
from loguru import logger

# ログの設定
logger.add("lambda_invocation.log", rotation="500 MB", encoding="utf-8")

def invoke_lambda():
    logger.info("Lambda呼び出しプロセスを開始します")
    
    # AWS認証情報を設定
    try:
        session = boto3.Session(
            region_name='ap-northeast-1'
        )
        logger.debug("AWSセッションの作成に成功しました")
    except Exception as e:
        logger.error(f"AWSセッションの作成に失敗しました: {e}")
        return

    # Lambda clientを作成
    try:
        lambda_client = session.client('lambda')
        logger.debug("Lambdaクライアントの作成に成功しました")
    except Exception as e:
        logger.error(f"Lambdaクライアントの作成に失敗しました: {e}")
        return

    # Lambda関数名
    function_name = 'test_terraform'
    logger.info(f"Lambda関数を呼び出します: {function_name}")

    try:
        # Lambda関数を呼び出し
        response = lambda_client.invoke(
            FunctionName=function_name,
            InvocationType='RequestResponse',
            Payload=json.dumps({})
        )
        logger.debug("Lambda関数の呼び出しに成功しました")

        # レスポンスを処理
        status_code = response['StatusCode']
        payload = json.loads(response['Payload'].read())
        
        logger.info(f"Lambda呼び出しのステータスコード: {status_code}")
        logger.info(f"Lambda呼び出しのペイロード: {payload}")

    except Exception as e:
        logger.error(f"Lambda関数の呼び出し中にエラーが発生しました: {e}")

if __name__ == "__main__":
    logger.info("スクリプトの実行を開始します")
    invoke_lambda()
    logger.info("スクリプトの実行が完了しました")
