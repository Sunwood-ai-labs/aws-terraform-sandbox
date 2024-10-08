# IaL要件定義: StreamlitアプリケーションのAWS Fargateデプロイメント

## 0. プロジェクト概要
- Streamlitアプリケーションを AWS Fargate 上にデプロイするための Terraform コードを生成すること
- セキュアで拡張性のあるインフラストラクチャを構築すること
- 初心者でも理解しやすい構造とコメントを含めること

## 1. ファイル構造とコメント
- [ ] プロジェクトを以下のように構造化すること:
  - `main.tf`: メインの設定ファイル
  - `variables.tf`: 変数定義ファイル
  - `outputs.tf`: 出力定義ファイル
  - `terraform.tfvars`: 変数値設定ファイル
  - `modules/`: モジュールを格納するディレクトリ
    - 各モジュールは独立したディレクトリを持ち、それぞれに `main.tf`, `variables.tf`, `outputs.tf` を含む
- [ ] 各ファイルの冒頭に、そのファイルの目的と内容を説明する詳細なコメントを追加すること
- [ ] コメントは初心者でも理解できる平易な言葉で書くこと

## 2. モジュール構造
- [ ] 以下のモジュールを作成し、`modules/` ディレクトリ内に配置すること:
  - `network`: VPC、サブネット、インターネットゲートウェイ、ルートテーブルの設定
  - `security`: セキュリティグループとIAMロールの設定
  - `ecs`: ECSクラスタ、タスク定義、サービスの設定
  - `alb`: Application Load Balancerの設定

## 3. IPホワイトリスト
- [ ] `whitelist.csv` ファイルを作成し、以下の形式でIPアドレスと説明を記載すること:
  ```
  ip,description
  192.168.1.1,Office IP
  203.0.113.0/24,Client network
  ```
- [ ] `security` モジュール内で `whitelist.csv` ファイルを読み込み、記載されているIPアドレスをALBのセキュリティグループのインバウンドルールに追加すること
- [ ] CSVファイルの読み込みとパースには適切なTerraformのデータソースまたはローカル変数を使用すること

## 4. プロバイダー設定
- [ ] AWS プロバイダーを適切に設定し、リージョンを指定すること
- [ ] プロバイダーのバージョンを明示的に指定すること

## 5. ネットワーク構成
- [ ] VPC を作成し、適切な CIDR ブロックを設定すること
- [ ] 少なくとも2つのアベイラビリティーゾーンにまたがる公開サブネットを作成すること
- [ ] インターネットゲートウェイとルートテーブルを適切に設定すること

## 6. セキュリティ設定
- [ ] Fargate タスク用のセキュリティグループを作成し、必要最小限のポート（8501 for Streamlit）のみを開放すること
- [ ] ALB 用のセキュリティグループを作成し、HTTP トラフィック（ポート80）を許可すること

## 7. ECS クラスタとタスク定義
- [ ] ECS クラスタを作成すること
- [ ] Fargate 互換の ECS タスク定義を作成すること
- [ ] タスク定義には Streamlit アプリケーションのコンテナ設定を含めること

## 8. IAM ロールとポリシー設定
- [ ] ECS タスク実行ロールを作成し、必要な権限を付与すること
- [ ] 最小権限の原則に従ってアクセス権限を設定すること

## 9. Application Load Balancer (ALB) 設定
- [ ] ALB を作成し、公開サブネットに配置すること
- [ ] ALB のターゲットグループを作成し、Fargate タスクにルーティングするよう設定すること

## 10. ECS サービス設定
- [ ] ECS サービスを作成し、タスク定義とクラスタを関連付けること
- [ ] サービスを ALB と統合すること

## 11. Streamlit アプリケーションのコンテナ化
- [ ] Dockerfile を作成し、Streamlit アプリケーションをコンテナ化する手順を含めること
- [ ] コンテナイメージを ECR にプッシュするためのコマンドを README に記載すること

## 12. 変数の使用
- [ ] 環境やデプロイメント間で変更される可能性のある値は変数として定義すること
- [ ] 変数にはデフォルト値を設定し、必要に応じて override できるようにすること

## 13. 出力設定
- [ ] ALB の DNS 名を出力として定義し、アプリケーションの URL を表示すること

## 14. タグ付け
- [ ] すべてのリソースに適切なタグを付けること（最低限、Name タグは必須）

## 15. エラーハンドリング
- [ ] リソースの作成に失敗した場合の対応（例：depends_on の使用）を考慮すること

## 16. スクリプトの構造
- [ ] 関連するリソースをグループ化し、論理的な順序で配置すること

## 17. 拡張性
- [ ] 将来的な拡張や変更が容易になるような構造にすること
- [ ] 例えば、複数の Streamlit アプリケーションを簡単にデプロイできるようなモジュール構造を考慮すること

## 18. セキュリティ考慮事項
- [ ] HTTPS を使用するための ACM 証明書の統合を考慮すること（オプション）
- [ ] セキュアな通信のために VPC エンドポイントの使用を検討すること

## 19. コスト最適化
- [ ] Fargate タスクのサイズ（CPU、メモリ）を適切に設定し、過剰なリソース割り当てを避けること

## 20. ドキュメンテーション
- [ ] README.md ファイルを作成し、プロジェクトの概要、セットアップ手順、使用方法を記載すること

## 21. ベストプラクティス
- [ ] Terraform のベストプラクティスに従ってコードを構造化すること
- [ ] コードの再利用性と保守性を考慮すること

## 22. モジュール間の依存関係
- [ ] モジュール間の依存関係を適切に管理し、`depends_on` を使用して明示的に順序付けを行うこと

## 23. 変数のスコープ
- [ ] ルートモジュールで定義された変数を適切に子モジュールに渡すること
- [ ] モジュール固有の変数は各モジュール内の `variables.tf` で定義すること

## 24. モジュールの出力
- [ ] 各モジュールは必要な情報を出力し、他のモジュールやルートモジュールで使用できるようにすること

## 25. モジュールのドキュメンテーション
- [ ] 各モジュールディレクトリに `README.md` を作成し、モジュールの目的、入力変数、出力、使用例を記載すること

この要件定義に基づいてTerraformコードを生成することで、モジュール化された構造とIPホワイトリスト機能を持つ、より柔軟で管理しやすいインフラストラクチャを実現できます。また、初心者にもわかりやすい構造とコメントにより、インフラストラクチャ・アズ・ランゲージ（IaL）の学習と実践がさらに容易になります。
