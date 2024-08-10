from diagrams import Diagram, Cluster
from diagrams.aws.compute import EC2
from diagrams.aws.network import VPC, PublicSubnet, InternetGateway, RouteTable
from diagrams.aws.security import IAM
from diagrams.aws.management import Cloudwatch
from diagrams.aws.integration import SimpleNotificationServiceSns as SNS
from diagrams.aws.management import SystemsManagerParameterStore as ParameterStore

def create_aws_architecture_diagram():
    with Diagram("AWS Architecture", show=False, filename="aws_architecture", outformat="png", direction="TB"):
        # IAM resources
        iam_role = IAM("EC2 Role")
        iam_instance_profile = IAM("EC2 Instance Profile")

        # VPC and related resources
        with Cluster("VPC"):
            vpc = VPC("Main VPC")
            
            with Cluster("Public Subnet"):
                public_subnet = PublicSubnet("Public Subnet")
                
                # EC2 Instance
                ec2 = EC2("Streamlit App")
                
                # Security Group (represented as a note since there's no specific icon)
                EC2("Security Group\n(Streamlit SG)") 

            # Internet Gateway
            igw = InternetGateway("Internet Gateway")

            # Route Table
            route_table = RouteTable("Public Route Table")

        # CloudWatch resources
        cloudwatch_start = Cloudwatch("Start Instance Rule")
        cloudwatch_stop = Cloudwatch("Stop Instance Rule")

        # SNS (assumed for CloudWatch actions)
        sns = SNS("SNS (assumed)")

        # Parameter Store (for storing sensitive data)
        param_store = ParameterStore("Parameter Store")

        # Connections
        vpc >> public_subnet
        igw >> vpc
        route_table >> public_subnet
        iam_role >> iam_instance_profile >> ec2
        ec2 >> public_subnet
        cloudwatch_start >> sns >> ec2
        cloudwatch_stop >> sns >> ec2
        param_store >> ec2

if __name__ == "__main__":
    create_aws_architecture_diagram()
    print("AWS architecture diagram has been saved as 'aws_architecture.png'.")
