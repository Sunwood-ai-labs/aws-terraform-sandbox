
```bash


docker build -t fastapi-lambda .

docker run -p 9000:8080 fastapi-lambda

api_gateway_url = "https://skjnkewzwl.execute-api.ap-northeast-1.amazonaws.com/dev"
ecr_repository_url = "498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/fastapi-lambda-repo"
lambda_function_name = "fastapi-lambda-function"


aws configure list

aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com


docker tag fastapi-lambda:latest 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/fastapi-lambda-repo:latest




```



# ECRリポジトリへのログインと認証手順

1. まず、AWS CLIが正しく設定されていることを確認します：
   ```
   aws configure list
   ```
   正しいAWSアカウントIDとリージョンが設定されていることを確認してください。

2. 次に、ECRリポジトリへのログインコマンドを実行します：
   ```
   aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com
   ```
   このコマンドが成功すると、"Login Succeeded" というメッセージが表示されるはずです。

aws ecr create-repository --repository-name fastapi-lambda-repo --region ap-northeast-1


3. ログインに成功したら、再度イメージをプッシュしてみてください：
   ```
   docker push 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/fastapi-lambda-repo:latest
   ```

4. プッシュが成功したら、ECRリポジトリのイメージを確認します：
   ```
   aws ecr list-images --repository-name fastapi-lambda-repo
   ```
terraform import aws_ecr_repository.fastapi-lambda-repo fastapi-lambda-repo

5. すべてが正常に完了したら、Terraformを再度適用します：
   ```
   terraform apply
   ```

注意: もし上記の手順でもログインできない場合は、以下を確認してください：
- AWS CLIの認証情報が正しく設定されているか
- 使用しているIAMユーザーまたはロールがECRへのプッシュ権限を持っているか
- AWSアカウントIDが正しいか（498218886114が正しいことを確認）


```json
{
  "version": "2.0",
  "routeKey": "GET /",
  "rawPath": "/",
  "rawQueryString": "",
  "headers": {
    "accept": "*/*",
    "content-length": "0",
    "host": "your-api-id.execute-api.your-region.amazonaws.com",
    "user-agent": "curl/7.64.1",
    "x-amzn-trace-id": "Root=1-5e9f8f8f-8f8f8f8f8f8f8f8f8f8f8f8f",
    "x-forwarded-for": "1.2.3.4",
    "x-forwarded-port": "443",
    "x-forwarded-proto": "https"
  },
  "requestContext": {
    "accountId": "123456789012",
    "apiId": "your-api-id",
    "domainName": "your-api-id.execute-api.your-region.amazonaws.com",
    "domainPrefix": "your-api-id",
    "http": {
      "method": "GET",
      "path": "/",
      "protocol": "HTTP/1.1",
      "sourceIp": "1.2.3.4",
      "userAgent": "curl/7.64.1"
    },
    "requestId": "JKJaXmPLvHcESHA=",
    "routeKey": "GET /",
    "stage": "$default",
    "time": "12/Mar/2020:19:03:58 +0000",
    "timeEpoch": 1583348638390
  },
  "isBase64Encoded": false
}
```
