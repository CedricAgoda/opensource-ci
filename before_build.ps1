Set-Location stage5/src
yarn install
yarn webpack --config webpack.config.vendor.js
yarn webpack
Set-Location ..
dotnet restore
Set-Location ..
choco install --no-progress sonarscanner-msbuild-netcoreapp2.0

if ( $env:APPVEYOR_PULL_REQUEST_NUMBER )
{
    dotnet "C:\ProgramData\chocolatey\lib\sonarscanner-msbuild-netcoreapp2.0\tools\SonarScanner.MSBuild.dll" begin /k:opensource-ci /v:$env:APPVEYOR_BUILD_VERSION /d:sonar.organization=cedricagoda-github /d:sonar.host.url=https://sonarcloud.io /d:sonar.cs.opencover.reportsPaths=coverage.xml /d:sonar.login=$env:SonarKey /d:sonar.exclusions="$env:SonarExclusions" /d:sonar.analysis.mode=preview /d:sonar.github.pullRequest=$env:APPVEYOR_PULL_REQUEST_NUMBER /d:sonar.github.repository=$env:APPVEYOR_REPO_NAME /d:sonar.github.oauth=$env:SonarGithubKey
}
elseif ( $env:APPVEYOR_REPO_BRANCH -Eq "master" )
{
    dotnet "C:\ProgramData\chocolatey\lib\sonarscanner-msbuild-netcoreapp2.0\tools\SonarScanner.MSBuild.dll" begin /k:opensource-ci /v:$env:APPVEYOR_BUILD_VERSION /d:sonar.organization=cedricagoda-github /d:sonar.host.url=https://sonarcloud.io /d:sonar.cs.opencover.reportsPaths=coverage.xml /d:sonar.login=$env:SonarKey /d:sonar.exclusions="$env:SonarExclusions"
} 