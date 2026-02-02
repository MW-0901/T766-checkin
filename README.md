# How to build installer:
- Ensure you have:
  - Inno Setup installed
  - Dotnet 10
- From here on out, all commands will be ran from the root of this repo
- Run `dotnet publish -c Release -r win-x64 --self-contained true`
- Run `start .\installer-output\inno-installer.iss`
- Enter Ctrl + F9 to build the installer!
- You'll find your installer inside installer-output
