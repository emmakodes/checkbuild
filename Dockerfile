# Use a base image
FROM ersiliaos/base:latest

ARG MODEL=eos526j
ENV MODEL=eos526j

# Set the working directory in the container
WORKDIR /repo

# Install Git
RUN apt-get update && apt-get install -y git

# Clone the GitHub repository into the desired directory
RUN git clone https://github.com/emmakodes/eos526j.git .

# Other instructions...
RUN ersilia -v fetch eos526j --repo_path .




