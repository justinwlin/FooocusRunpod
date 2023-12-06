# Use the specified base image
FROM runpod/stable-diffusion:fast-stable-diffusion-2.4.0

# Run system updates
RUN apt update

# Set the working directory to /workspace
WORKDIR /workspace

# Clone the Fooocus repository into a new directory
RUN git clone https://github.com/lllyasviel/Fooocus Fooocus

# Change the working directory to /workspace/Fooocus
WORKDIR /workspace/Fooocus

# Create a Python virtual environment and update the PATH environment variable
RUN python3 -m venv venv
ENV PATH="/workspace/Fooocus/venv/bin:$PATH"

# Install PyTorch and related libraries
RUN pip install torch==2.0.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Install xformers
RUN pip install xformers==0.0.22

# Install other Python dependencies from requirements file
RUN pip install -r requirements_versions.txt
