# Use the latest n8n image
FROM n8nio/n8n:latest

# Switch to root user to install system-level packages
USER root

# Update package lists and install necessary utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    imagemagick \
    ghostscript \
    exiftool \
    ffmpeg \
    sox \
    python3 \
    python3-pip && \
    \
    # Install yt-dlp via pip
    pip3 install yt-dlp && \
    \
    # Clean up APT cache to reduce image size
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the n8n user (node)
USER node
