FROM python:3.12

# Install necessary tools
RUN apt-get update 
RUN apt-get install -y  graphviz

# Install cfn-diagram and terraform-to-cfn
RUN pip install diagrams

WORKDIR /app

CMD ["bash"]
