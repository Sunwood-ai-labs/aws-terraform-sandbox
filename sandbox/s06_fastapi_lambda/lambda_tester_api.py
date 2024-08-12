import requests
import json
import os
import sys
from dotenv import load_dotenv
from rich.console import Console
from rich.panel import Panel
from rich.syntax import Syntax
from rich.table import Table
from rich.text import Text
from art import text2art


# .env ファイルから環境変数を読み込む
load_dotenv()

console = Console()

# ファイル名を取得
current_file = text2art(os.path.basename(sys.argv[0]))
# ファイル名を大きく表示
console.print(Panel(
    Text(current_file, style="bold cyan", justify="center"),
    border_style="bold green",
    expand=True,
    title="[bold yellow]Current Script",
    subtitle="[italic]Lambda Invocation Tester"
))

console.print()  # 空行を追加

# API GatewayのURLとAPIキーを環境変数から取得
API_URL = os.getenv('API_URL')
API_KEY = os.getenv('API_KEY')

def mask_string(s, visible_chars=4):
    return s[:visible_chars] + '•' * (len(s) - visible_chars)

def display_env_vars():
    table = Table(title="Environment Variables", show_header=True, header_style="bold magenta")
    table.add_column("Variable", style="cyan", no_wrap=True)
    table.add_column("Value", style="green")

    table.add_row("API_URL", Text(mask_string(API_URL), style="bold"))
    table.add_row("API_KEY", Text(mask_string(API_KEY), style="bold"))

    console.print(Panel(table, expand=True, title="Configuration", subtitle="[italic]Masked for security[/italic]"))

def invoke_lambda(path, http_method="GET"):
    url = f"{API_URL}{path}"
    headers = {
        'x-api-key': API_KEY
    }
    
    try:
        with console.status(f"[bold green]Invoking Lambda via API Gateway: {path}...", spinner="dots"):
            if http_method == "GET":
                response = requests.get(url, headers=headers)
            elif http_method == "POST":
                response = requests.post(url, headers=headers)
            else:
                raise ValueError(f"Unsupported HTTP method: {http_method}")
        
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        console.print(f"[bold red]Lambda invocation error:[/bold red] {e}", style="red")
        return None

def display_result(result, path):
    if not result:
        console.print(Panel(f"[bold red]Lambda invocation for {path} failed[/bold red]", border_style="red"))
        return

    console.print(Panel(f"[bold green]Lambda invocation for {path} successful[/bold green]", border_style="green"))
    
    json_str = json.dumps(result, indent=2)
    syntax = Syntax(json_str, "json", theme="monokai", line_numbers=True)
    console.print(Panel(syntax, title=f"Response from {path}", border_style="blue"))

def main():
    display_env_vars()
    console.print("\n")

    paths = ["/items/42", "/test"]
    
    for path in paths:
        result = invoke_lambda(path)
        display_result(result, path)
        console.print("\n")

if __name__ == "__main__":
    main()
