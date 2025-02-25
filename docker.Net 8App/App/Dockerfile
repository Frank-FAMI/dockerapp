# Use .NET 8 SDK image for building
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /App

# Copy everything
COPY . ./

# Restore as distinct layers
RUN dotnet restore

# Build and publish a release
RUN dotnet publish -c Release -o out

# Use .NET 8 runtime image for running the app
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /App
COPY --from=build /App/out .

# Define the entry point
ENTRYPOINT ["dotnet", "DotNet.Docker.dll"]

# Expose the application port
EXPOSE 3000
