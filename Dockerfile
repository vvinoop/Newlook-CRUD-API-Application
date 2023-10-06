# Learn about building .NET container images:
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /coffee

# copy and publish app and libraries
COPY . .

WORKDIR /coffee
RUN dotnet publish --configuration Release --property:PublishDir=/source/publish --runtime linux-x64

# final stage/image
FROM mcr.microsoft.com/dotnet/runtime:7.0
WORKDIR /coffee
COPY --from=build-env /coffee .
RUN pwd
ENTRYPOINT ["dotnet", "/coffee/CoffeeBookWeb/bin/Release/net6.0/linux-x64/CoffeeBookWeb.dll"]