# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Set environment variables for the PostgreSQL database
ENV POSTGRES_DB=mydatabase
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword

# Expose the default PostgreSQL port
EXPOSE 5432

# Add a health check to ensure the database is up and running
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD pg_isready -U $POSTGRES_USER || exit 1