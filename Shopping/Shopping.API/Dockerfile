#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
COPY ./Shopping.API/*.csproj ./Shopping.API/
COPY *.sln .
RUN dotnet restore ./Shopping.API/*.csproj
COPY . .

RUN dotnet publish -c release ./Shopping.API/*.csproj -o /publish/


FROM base AS final
WORKDIR /app
COPY --from=build /publish .
ENTRYPOINT ["dotnet", "Shopping.API.dll"]

#docker build -f "C:\Users\cahit\Documents\Github\shopping\Shopping\Shopping.API\Dockerfile" --force-rm -t shoppingapi:dev "C:\Users\cahit\Documents\Github\shopping\Shopping"