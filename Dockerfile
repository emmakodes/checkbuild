# Use a base image
FROM ersiliaos/base:latest

ARG MODEL=eos9tyg
ENV MODEL=eos9tyg

# Set the working directory in the container
WORKDIR /repo

# Install Git
RUN apt-get update && apt-get install -y git

# Create the 'eos9ei3' folder
RUN mkdir eos9tyg

# Change directory to 'eos9ei3'
WORKDIR /repo/eos9tyg

# Clone the GitHub repository into the 'eos9ei3' folder
RUN git clone https://github.com/emmakodes/eos9tyg.git .

RUN ls -a

# Move back to the 'repo' directory
WORKDIR /repo

RUN ls -a

# Other instructions...
RUN ersilia -v fetch eos9tyg --repo_path eos9tyg

# List files and folders in the current directory

