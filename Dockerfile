FROM docker pull mcr.microsoft.com/dotnet/sdk:9.0 AS build-env

WORKDIR /app

COPY ["Web/Web.csproj", "Web/"]
COPY ["Application/Application.csproj", "Application/"]
COPY ["Domain/Domain.csproj", "Domain/"]
COPY ["Persistence/Persistence.csproj", "Persistence/"]

RUN dotnet restore "Web/Web.csproj"
RUN dotnet restore "Application/Application.csproj"
RUN dotnet restore "Domain/Domain.csproj"
RUN dotnet restore "Persistence/Persistence.csproj"

COPY . ./

WORKDIR "Web/"

RUN dotnet publish -c Release -o out

FROM docker pull mcr.microsoft.com/dotnet/aspnet:9.0

RUN sed -i 's/CipherString = DEFAULT@SECLEVEL=2/CipherString = DEFAULT@SECLEVEL=1/g' /etc/ssl/openssl.cnf

COPY --from=build-env /app/Web/out .

ENTRYPOINT [ "dotnet", "Web.dll" ]

EXPOSE 8080