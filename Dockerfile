# Start from the official Rust image
FROM rust:latest

# Install sccache, a shared compilation cache system
RUN cargo install sccache

# Set environment variables to use sccache
ENV RUSTC_WRAPPER=sccache

# Set the working directory
WORKDIR /usr/src/localsend-rs

# Copy the source code into the container
COPY . .

# Build the Rust project using Release configuration
# Utilizing sccache to cache the compilation steps
RUN cargo build --release

# Expose the port the application runs on
EXPOSE 7878

# Command to run the application
CMD ["./target/release/localsend-rs"]
