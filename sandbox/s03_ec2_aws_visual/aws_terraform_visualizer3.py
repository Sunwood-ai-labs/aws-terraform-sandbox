from diagrams import Diagram, Edge, Cluster
from diagrams.aws.compute import EC2, EC2ElasticIpAddress
from diagrams.aws.network import VPC, InternetGateway, RouteTable, PublicSubnet
from diagrams.aws.security import Shield
from diagrams.aws.general import InternetAlt1
import json

def load_terraform_state(file_path):
    with open(file_path, 'r') as f:
        return json.load(f)

def create_diagram(state):
    with Diagram("AWS EC2 Infrastructure", show=False, filename="aws_ec2_infrastructure3", direction="LR"):
        internet = InternetAlt1("Internet")

        with Cluster("AWS Cloud"):
            vpc = VPC("VPC")
            igw = InternetGateway("Internet Gateway")
            
            with Cluster("Public Subnet"):
                public_subnet = PublicSubnet("Public Subnet")
                ec2 = EC2("EC2 Instance")
                eip = EC2ElasticIpAddress("Elastic IP")
            
            route_table = RouteTable("Route Table")
            sg = Shield("Security Group")

        # Connections
        internet >> Edge(color="blue", style="bold") >> igw
        igw >> Edge(color="blue", style="bold") >> vpc
        vpc >> Edge(color="green") >> public_subnet
        public_subnet >> Edge(color="red", style="dashed") >> ec2
        ec2 - Edge(color="red", style="dashed") - eip
        eip >> Edge(color="blue", style="bold") >> internet
        
        vpc >> Edge(color="orange") >> route_table
        route_table >> Edge(color="orange", style="dashed") >> public_subnet
        sg >> Edge(color="purple", style="dotted") >> ec2

        # Add labels with actual values from the state
        for resource in state['resources']:
            if resource['type'] == 'aws_vpc' and resource['name'] == 'main':
                vpc.label = f"VPC\n{resource['instances'][0]['attributes']['cidr_block']}"
            elif resource['type'] == 'aws_subnet' and resource['name'] == 'public':
                public_subnet.label = f"Public Subnet\n{resource['instances'][0]['attributes']['cidr_block']}"
            elif resource['type'] == 'aws_instance' and resource['name'] == 'main':
                ec2.label = f"EC2 Instance\n{resource['instances'][0]['attributes']['private_ip']}"
            elif resource['type'] == 'aws_eip' and resource['name'] == 'main':
                eip.label = f"Elastic IP\n{resource['instances'][0]['attributes']['public_ip']}"
            elif resource['type'] == 'aws_security_group' and resource['name'] == 'ec2':
                sg.label = f"Security Group\n{resource['instances'][0]['attributes']['name']}"
            elif resource['type'] == 'aws_internet_gateway' and resource['name'] == 'main':
                igw.label = f"Internet Gateway\n{resource['instances'][0]['attributes']['id']}"
            elif resource['type'] == 'aws_route_table' and resource['name'] == 'public':
                route_table.label = f"Route Table\n{resource['instances'][0]['attributes']['id']}"

if __name__ == "__main__":
    state = load_terraform_state("terraform.tfstate")
    create_diagram(state)
    print("Diagram created: aws_ec2_infrastructure.png")
