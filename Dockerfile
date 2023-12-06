# Use the specified base image
FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel-ubuntu22.04

# Run system updates and clean up
RUN apt-get update && apt-get upgrade -y && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory to /
WORKDIR /

# Clone the Fooocus repository into the workspace directory
RUN git clone https://github.com/lllyasviel/Fooocus.git

# Change the working directory to /workspace/Fooocus
WORKDIR /Fooocus

# Install Python dependencies
# Using '--no-cache-dir' with pip to avoid use of cache
RUN pip install --no-cache-dir xformers==0.0.22 \
    && pip install --no-cache-dir -r requirements_versions.txt
