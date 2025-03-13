FROM ghcr.io/cirruslabs/flutter:latest

# Install required dependencies
RUN apt-get update && apt-get install -y \
  unzip \
  curl \
  git \
  wget \
  libglu1-mesa \
  && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy project files into the container
COPY . .

# Enable Flutter for Android builds
RUN flutter config --enable-android

# Get Flutter dependencies
RUN flutter pub get

# Build APK release
RUN flutter build apk --release

# Output directory
RUN mkdir -p /output
RUN cp build/app/outputs/flutter-apk/app-release.apk /output/

# Set output directory as volume
VOLUME /output

CMD ["cp", "/output/app-release.apk", "/app"]
