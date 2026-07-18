# Stage 1 (Build)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["src/MyDotnetApp.WebApi/MyDotnetApp.WebApi.csproj", "src/MyDotnetApp.WebApi/"]
COPY ["src/MyDotnetApp.Tests/MyDotnetApp.Tests.csproj", "src/MyDotnetApp.Tests/"]
COPY ["MyDotnetApp.sln", "./"]
RUN dotnet restore

COPY . .
WORKDIR "/src/src/MyDotnetApp.WebApi"
RUN dotnet publish "MyDotnetApp.WebApi.csproj" -c Release -o /app/publish

# Stage 2 (Runtime)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080
ENTRYPOINT ["dotnet", "MyDotnetApp.WebApi.dll"]
