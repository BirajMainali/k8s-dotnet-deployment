FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["K8sDemoApp/K8sDemoApp.csproj", "K8sDemoApp/"]
RUN dotnet restore "K8sDemoApp/K8sDemoApp.csproj"
COPY . .
WORKDIR "/src/K8sDemoApp"
RUN dotnet build "K8sDemoApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "K8sDemoApp.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "K8sDemoApp.dll"]
