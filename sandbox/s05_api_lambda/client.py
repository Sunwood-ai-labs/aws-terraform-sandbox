import requests
import json
from rich.console import Console
from rich.panel import Panel
from rich.syntax import Syntax
from rich.table import Table

console = Console()

def call_lambda_api():
    api_url = "https://ynssduk8ag.execute-api.ap-northeast-1.amazonaws.com/dev/test"
    
    try:
        with console.status("[bold green]Calling Lambda API...", spinner="dots"):
            response = requests.get(api_url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        console.print(f"[bold red]API request error:[/bold red] {e}", style="red")
        return None

def display_result(result):
    if not result:
        console.print(Panel("[bold red]API call failed[/bold red]", border_style="red"))
        return

    console.print(Panel("[bold green]API call successful[/bold green]", border_style="green"))
    
    # Create a table for the response
    table = Table(title="API Response", show_header=True, header_style="bold magenta")
    table.add_column("Key", style="cyan", no_wrap=True)
    table.add_column("Value", style="green")

    for key, value in result.items():
        if isinstance(value, dict):
            value = json.dumps(value, indent=2)
        table.add_row(str(key), str(value))

    console.print(table)

    # Display full JSON response
    json_str = json.dumps(result, indent=2)
    syntax = Syntax(json_str, "json", theme="monokai", line_numbers=True)
    console.print(Panel(syntax, title="Full JSON Response", border_style="blue"))

def main():
    result = call_lambda_api()
    display_result(result)

if __name__ == "__main__":
    main()
