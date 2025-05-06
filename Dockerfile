FROM python:3.11-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apt-get update && apt-get upgrade -y

WORKDIR /code

# Use system python
ENV UV_SYSTEM_PYTHON=1

# Install dependencies
COPY requirements.txt .
RUN uv pip install -r requirements.txt
