# Use a base image
FROM ersiliaos/base:latest

ARG MODEL=eos22io
ENV MODEL=eos22io

# Set the working directory in the container
WORKDIR /repo

# Install Git
RUN apt-get update && apt-get install -y git

# Create the 'eos9ei3' folder
RUN mkdir eos22io

# Change directory to 'eos9ei3'
WORKDIR /repo/eos22io

# Clone the GitHub repository into the 'eos9ei3' folder
RUN git clone https://github.com/emmakodes/eos22io.git .

RUN ls -a

# Move back to the 'repo' directory
WORKDIR /repo

RUN ls -a

# Other instructions...
RUN ersilia -v fetch eos22io --repo_path eos22io

# List files and folders in the current directory

