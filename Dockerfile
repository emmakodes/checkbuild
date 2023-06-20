# Use a base image
FROM ersiliaos/base:latest

ARG MODEL=eos9ei3
ENV MODEL=eos9ei3

# Set the working directory in the container
WORKDIR /repo

# Install Git
RUN apt-get update && apt-get install -y git

# Clone the GitHub repository into the desired directory
RUN git clone https://github.com/GemmaTuron/eos9ei3.git .

# List files and folders in the current directory
RUN ls -a

# Other instructions...
RUN ersilia -v fetch eos9ei3 --repo_path .




