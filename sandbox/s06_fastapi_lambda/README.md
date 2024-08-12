
```bash


docker build -t fastapi-lambda .

docker run -p 9000:8080 fastapi-lambda

api_gateway_url = "https://skjnkewzwl.execute-api.ap-northeast-1.amazonaws.com/dev"
ecr_repository_url = "498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/fastapi-lambda-repo"
lambda_function_name = "fastapi-lambda-function"


aws configure list

aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com




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

3. ログインに成功したら、再度イメージをプッシュしてみてください：
   ```
   docker push 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/fastapi-lambda-repo:latest
   ```

4. プッシュが成功したら、ECRリポジトリのイメージを確認します：
   ```
   aws ecr list-images --repository-name fastapi-lambda-repo
   ```

5. すべてが正常に完了したら、Terraformを再度適用します：
   ```
   terraform apply
   ```

注意: もし上記の手順でもログインできない場合は、以下を確認してください：
- AWS CLIの認証情報が正しく設定されているか
- 使用しているIAMユーザーまたはロールがECRへのプッシュ権限を持っているか
- AWSアカウントIDが正しいか（498218886114が正しいことを確認）
