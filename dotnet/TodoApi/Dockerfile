FROM mcr.microsoft.com/dotnet/sdk:3.1

COPY certs/client/root.crt /usr/local/share/ca-certificates/root.crt
RUN update-ca-certificates

WORKDIR /app
COPY . .
RUN dotnet publish
