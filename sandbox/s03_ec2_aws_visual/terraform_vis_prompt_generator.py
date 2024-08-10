import requests
from bs4 import BeautifulSoup
import markdown
from jinja2 import Template
from rich.console import Console
from rich.panel import Panel
from rich.progress import Progress, SpinnerColumn, TextColumn, BarColumn, TaskID
from rich.syntax import Syntax
from art import *

console = Console()

def read_file(file_path: str) -> str:
    with console.status(f"[bold green]ファイル読み込み中: {file_path}"):
        with open(file_path, 'r', encoding='utf-8') as file:
            return file.read()

def scrape_diagrams_docs(url: str) -> str:
    with Progress(
        SpinnerColumn(),
        TextColumn("[progress.description]{task.description}"),
        BarColumn(),
        TextColumn("[progress.percentage]{task.percentage:>3.0f}%"),
        console=console,
        transient=True,
    ) as progress:
        task = progress.add_task("[cyan]ダイアグラムドキュメントのスクレイピング中...", total=100)
        
        try:
            progress.update(task, advance=10, description="[cyan]リクエスト送信中...")
            response = requests.get(url)
            response.raise_for_status()
            
            progress.update(task, advance=20, description="[cyan]HTML保存中...")
            with open('diagrams_docs.html', 'w', encoding='utf-8') as f:
                f.write(response.text)
            console.print(Panel("[green]HTMLが保存されました: diagrams_docs.html", expand=True))

            progress.update(task, advance=30, description="[cyan]HTML解析中...")
            soup = BeautifulSoup(response.text, 'html.parser')
            
            progress.update(task, advance=20, description="[cyan]コンテンツ検索中...")
            content = soup.find('div', class_='container')
            if content is None:
                console.print("[yellow]警告: 'content'クラスのdivが見つかりません。代わりにbodyを使用します。")
                content = soup.body
                if content is None:
                    raise ValueError("ページのbody要素が見つかりません。")
            
            progress.update(task, advance=20, description="[cyan]Markdownに変換中...")
            markdown_content = markdown.markdown(content.get_text())
            
            progress.update(task, completed=100, description="[green]スクレイピング完了")
            return markdown_content
        except requests.RequestException as e:
            console.print(f"[bold red]リクエストエラー: {e}")
        except Exception as e:
            console.print(f"[bold red]予期せぬエラー: {e}")
        
        progress.update(task, completed=100, description="[red]スクレイピング失敗")
        return "ドキュメントの取得中にエラーが発生しました。"

def main():
    tprint('terraform vis prompt generator')
    console.print(Panel("[bold blue]Terraform可視化プロセスを開始します", expand=True))

    files_to_read = [
        ('docs/TERRAFORM_VIS_REQ_SPEC.md', '要件仕様書'),
        ('sandbox/s02_streamlit_aws_deployer/main.tf', 'Terraform メインファイル'),
        ('sandbox/s02_streamlit_aws_deployer/terraform.tfstate', 'Terraform 状態ファイル')
    ]

    file_contents = {}
    for file_path, description in files_to_read:
        file_contents[description] = read_file(file_path)
        console.print(f"[green]✓[/green] {description}の読み込みが完了しました")

    diagrams_docs_url = 'https://diagrams.mingrammer.com/docs/nodes/aws'
    diagrams_docs_content = scrape_diagrams_docs(diagrams_docs_url)

    console.print("[yellow]テンプレートをレンダリング中...")
    template = Template(file_contents['要件仕様書'])
    updated_content = template.render(
        main_tf_content=file_contents['Terraform メインファイル'],
        terraform_tfstate_content=file_contents['Terraform 状態ファイル'],
        diagrams_docs=diagrams_docs_content
    )

    output_markdown_path = 'sandbox/s03_ec2_aws_visual/terraform_visualization_prompt.md'
    with open(output_markdown_path, 'w', encoding='utf-8') as f:
        f.write(updated_content)

    console.print(f"[bold green]✓ プロンプトがMarkdownとして保存されました: {output_markdown_path}")

    # 生成されたコンテンツのプレビューを表示
    syntax = Syntax(updated_content[:500] + "...", "markdown", theme="monokai", line_numbers=True)
    console.print(Panel(syntax, title="生成されたコンテンツのプレビュー", expand=True))

if __name__ == "__main__":
    main()
