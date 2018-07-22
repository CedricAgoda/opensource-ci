# Setting up variables
## Project specific names
$clientAppPath = "stage1"

# Installing pre-requisites
Set-Location $clientAppPath
yarn install
dotnet restore

# Building
dotnet build