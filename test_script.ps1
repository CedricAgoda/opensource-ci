& $env:USERPROFILE\.nuget\packages\opencover\4.6.519\tools\OpenCover.Console.exe -register:user -oldStyle -target:"dotnet.exe" -targetargs:"test stage5\tests\tests.csproj" -filter:"+[opensourceci*]* +[tests*]*" -output:"coverage.xml"
choco install --no-progress codecov
codecov -f coverage.xml

if ( ( $env:APPVEYOR_REPO_BRANCH -Eq "master" ) -Or $env:APPVEYOR_PULL_REQUEST_NUMBER )
{
    dotnet "C:\ProgramData\chocolatey\lib\sonarscanner-msbuild-netcoreapp2.0\tools\SonarScanner.MSBuild.dll" end /d:sonar.login="$env:SonarKey"
}