# Use a base image
FROM ersiliaos/base:latest

ARG MODEL=eos9ei3
ENV MODEL=eos9ei3

# Set the working directory in the container
WORKDIR /repo

# Install Git
RUN apt-get update && apt-get install -y git

# Create the 'eos9ei3' folder
RUN mkdir eos9ei3

# Change directory to 'eos9ei3'
WORKDIR /repo/eos9ei3

# Clone the GitHub repository into the 'eos9ei3' folder
RUN git clone https://github.com/GemmaTuron/eos9ei3.git .

# Move back to the 'repo' directory
WORKDIR /repo

# Other instructions...
RUN ersilia -v fetch eos9ei3 --repo_path .

# List files and folders in the current directory
RUN ls -a
