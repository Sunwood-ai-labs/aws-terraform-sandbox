import requests
import json
from rich.console import Console
from rich.panel import Panel
from rich.syntax import Syntax

console = Console()

API_GATEWAY_URL = "https://y11d6hkjw8.execute-api.ap-northeast-1.amazonaws.com/dev"

def invoke_lambda(path, http_method="GET"):
    url = f"{API_GATEWAY_URL}{path}"
    
    try:
        with console.status(f"[bold green]Invoking Lambda via API Gateway: {path}...", spinner="dots"):
            if http_method == "GET":
                response = requests.get(url)
            elif http_method == "POST":
                response = requests.post(url)
            else:
                raise ValueError(f"Unsupported HTTP method: {http_method}")
        
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        console.print(f"[bold red]API Gateway invocation error:[/bold red] {e}", style="red")
        if hasattr(e.response, 'text'):
            console.print(f"Response content: {e.response.text}")
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
        result = invoke_lambda(path)
        display_result(result, path)
        console.print("\n")

if __name__ == "__main__":
    main()
