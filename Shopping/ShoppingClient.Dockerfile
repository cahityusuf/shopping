#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app
COPY ./Shopping.Client/*.csproj ./Shopping.Client/
COPY *.sln .
RUN dotnet restore ./Shopping.Client/*.csproj
COPY . .

RUN dotnet publish -c release ./Shopping.Client/*.csproj -o /publish/


FROM base AS final
WORKDIR /app
COPY --from=build /publish .
ENTRYPOINT ["dotnet", "Shopping.Client.dll"]