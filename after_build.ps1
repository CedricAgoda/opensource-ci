Set-Location stage5\src
dotnet publish --output ..\..\publish
Set-Location ..\..
tree publish