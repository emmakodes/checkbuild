# Use a base image
FROM ersiliaos/base:latest

ARG MODEL=eos526j
ENV MODEL=eos526j

# Set the working directory in the container
WORKDIR /repo

# Install Git
RUN apt-get update && apt-get install -y git

# Create the 'eos9ei3' folder
RUN mkdir eos526j

# Change directory to 'eos9ei3'
WORKDIR /repo/eos526j

# Clone the GitHub repository into the 'eos9ei3' folder
RUN git clone https://github.com/emmakodes/eos526j.git .

RUN ls -a

# Move back to the 'repo' directory
WORKDIR /repo

RUN ls -a

# Other instructions...
RUN ersilia -v fetch eos526j --repo_path eos526j

# List files and folders in the current directory

