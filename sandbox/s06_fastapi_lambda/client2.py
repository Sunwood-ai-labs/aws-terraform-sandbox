import requests
import json
from rich.console import Console
from rich.panel import Panel
from rich.syntax import Syntax

console = Console()

# API Gateway エンドポイント
API_GATEWAY_URL = "https://a1ffehx0ll.execute-api.ap-northeast-1.amazonaws.com/dev"
# ローカル Lambda エンドポイント
LOCAL_LAMBDA_URL = "http://localhost:9000/2015-03-31/functions/function/invocations"

def invoke_lambda(path, http_method="GET", use_local=False):
    if use_local:
        url = LOCAL_LAMBDA_URL
        payload = {
            "resource": "/{proxy+}",
            "path": path,
            "httpMethod": http_method,
            "requestContext": {
                "resourcePath": "/{proxy+}",
                "httpMethod": http_method
            }
        }
        request_type = "local Lambda"
    else:
        url = f"{API_GATEWAY_URL}{path}"
        payload = None
        request_type = "API Gateway"

    try:
        with console.status(f"[bold green]Invoking {request_type}: {path}...", spinner="dots"):
            if use_local:
                response = requests.post(url, json=payload)
            else:
                if http_method == "GET":
                    response = requests.get(url)
                elif http_method == "POST":
                    response = requests.post(url, json=payload)
                else:
                    raise ValueError(f"Unsupported HTTP method: {http_method}")

        response.raise_for_status()
        return json.loads(response.text)
    except requests.exceptions.RequestException as e:
        console.print(f"[bold red]{request_type} invocation error:[/bold red] {e}", style="red")
        return None

def display_result(result, path, use_local):
    request_type = "Local Lambda" if use_local else "API Gateway"
    if not result:
        console.print(Panel(f"[bold red]{request_type} invocation for {path} failed[/bold red]", border_style="red"))
        return

    console.print(Panel(f"[bold green]{request_type} invocation for {path} successful[/bold green]", border_style="green"))
    
    json_str = json.dumps(result, indent=2)
    syntax = Syntax(json_str, "json", theme="monokai", line_numbers=True)
    console.print(Panel(syntax, title=f"Response from {path}", border_style="blue"))

def main():
    paths = ["/items/42", "/test"]
    use_local = False  # API Gateway を使用する場合は False、ローカル Lambda を使用する場合は True に設定

    for path in paths:
        result = invoke_lambda(path, use_local=use_local)
        display_result(result, path, use_local)
        console.print("\n")

if __name__ == "__main__":
    main()
