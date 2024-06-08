# Use Python 3.10 base image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Install system dependencies required for OpenCV and other operations
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0

# Copy the necessary files
COPY tracker/ ./tracker/
COPY config.yaml requirements.txt trackers.ini ./

# Download the pre-trained model
RUN pip install gdown
RUN gdown "1g4E-F0RPOx9Nd6J7tU9AE1TjsouL4oZq&confirm=t" -O ./tracker/pretrain_models/SwinB_DeAOTL_PRE_YTB_DAV_VIP_MOSE_OVIS_LASOT_GOT.pth

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Volume mount points (specify these when running the container)
VOLUME ["/app/results", "/app/sequences"]

# Default command to run when starting the container
CMD ["vot", "--debug", "evaluate", "swinb_dm_deaot_vots"]
