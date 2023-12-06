# Use the specified base image
FROM runpod/stable-diffusion:fast-stable-diffusion-2.4.0

# Run system updates and clean up
RUN apt update && apt upgrade -y && apt clean && rm -rf /var/lib/apt/lists/*

# Set the working directory to /workspace
WORKDIR /workspace

# Clone the Fooocus repository into a new directory
COPY Fooocus /workspace/Fooocus

# Change the working directory to /workspace/Fooocus
WORKDIR /workspace/Fooocus

# Install Python dependencies
RUN pip install torch==2.0.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 \
    && pip install xformers==0.0.22 \
    && pip install -r requirements_versions.txt

COPY overridePrepare.py /workspace/Fooocus/overridePrepare.py

RUN python overridePrepare.py
