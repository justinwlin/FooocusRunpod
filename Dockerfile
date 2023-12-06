# Use the specified base image
FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel-ubuntu22.04

# Run system updates and clean up
RUN apt update && apt upgrade -y && apt clean && rm -rf /var/lib/apt/lists/*

# Set the working directory to /workspace
WORKDIR /workspace

# Clone the Fooocus repository into a new directory
COPY Fooocus /workspace/Fooocus

# Change the working directory to /workspace/Fooocus
WORKDIR /workspace/Fooocus

# Install Python dependencies
RUN pip install xformers==0.0.22 \
    && pip install -r requirements_versions.txt

COPY overridePrepare.py /workspace/Fooocus/overridePrepare.py

RUN python overridePrepare.py
