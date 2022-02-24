#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["K8sTest/K8sTest.csproj", "K8sTest/"]
RUN dotnet restore "K8sTest/K8sTest.csproj"
COPY . .
WORKDIR "/src/K8sTest"
RUN dotnet build "K8sTest.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "K8sTest.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "K8sTest.dll"]