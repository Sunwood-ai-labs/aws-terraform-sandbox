import requests
import json
from rich.console import Console
from rich.panel import Panel
from rich.syntax import Syntax

console = Console()

def invoke_local_lambda(path, http_method="GET"):
    # url = "http://localhost:9000/2015-03-31/functions/function/invocations"
    url = "https://y11d6hkjw8.execute-api.ap-northeast-1.amazonaws.com/dev"
    payload = {
        "resource": "/{proxy+}",
        "path": path,
        "httpMethod": http_method,
        "requestContext": {
            "resourcePath": "/{proxy+}",
            "httpMethod": http_method
        }
    }
    
    try:
        with console.status(f"[bold green]Invoking local Lambda: {path}...", spinner="dots"):
            response = requests.post(url, json=payload)
        response.raise_for_status()
        return json.loads(response.text)
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
    paths = ["/", "/items/42", "/test"]
    
    for path in paths:
        result = invoke_local_lambda(path)
        display_result(result, path)
        console.print("\n")

if __name__ == "__main__":
    main()
