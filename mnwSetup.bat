@echo off
rem set path=c:\python27;%path%
set path=%USERPROFILE%\appdata\Local\Programs\Python\Python37;%path%
echo #######################################################################
echo ### Check tools presence ##############################################
echo #######################################################################
rem 
rem WINDDK 3790.1830 installation check...
rem 
if not exist c:\WINDDK\3790.1830\install.htm (
    echo ATTENTION: DDK 3790.1830 not installed
    echo download from  http://download.microsoft.com/download/9/0/f/90f019ac-8243-48d3-91cf-81fc4093ecfd/1830_usa_ddk.iso
    pause
) else (
    echo WINDDK 3790.1830 is installed
)


rem
rem VS2015 installation check...
rem

if not exist "c:\Program Files (x86)\Microsoft Visual Studio 14.0\vc\bin\vcvars32.bat" (
    echo ATTENTION: Visual Studio 2015 not installed
    pause
) else (
    echo VS2015 is installed
)

python --version > NUL 2>&1
if errorlevel 1 (
    echo PYTHON not installed.
    echo Please install PYTHON from AppStore
    python
    goto EOF
) else (
	python --version
)
git.exe --version > NUL 2>&1
if errorlevel 1 (
    echo installing GIT ...
    if not exist DOWNLOAD md download
    powershell "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.23.0.windows.1/Git-2.23.0-64-bit.exe -OutFile download\Git-2.23.0-64-bit.exe"}"
    download\Git-2.23.0-64-bit.exe /SP- /NOCANCEL /SILENT
    echo start a new Shell with GIT enabled
    start cmd.exe /c  mnwSetup.bat /restarted
    goto EOF
) else (
    git --version
)

if not exist openssl-1.0.2r-x64_86-win64 (
    echo openSSL download and install ...
    if not exist DOWNLOAD md download
    powershell "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri "https://indy.fulgan.com/SSL/openssl-1.0.2r-x64_86-win64.zip -OutFile download\openssl-1.0.2r-x64_86-win64.zip"}"
    powershell Expand-Archive download\openssl-1.0.2r-x64_86-win64.zip
) else (
   echo openSSL is installed.
)
if not exist nasm-2.13.03 (
   echo NASM download and install ...
   if not exist DOWNLOAD md download
   powershell "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri "https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/win64/nasm-2.13.03-win64.zip -OutFile download\nasm-2.13.03-win64.zip"}"
   powershell Expand-Archive download\nasm-2.13.03-win64.zip .
) else (
   nasm-2.13.03\NASM --version
)

if not exist c:\ASL (
    echo ASL compiler download and install ...
    if not exist DOWNLOAD md download
    md c:\ASL
    powershell "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri "https://acpica.org/sites/acpica/files/iasl-win-20160527.zip -OutFile download\iasl-win-20160527.zip"}"
    powershell Expand-Archive download\iasl-win-20160527.zip c:\ASL
) else (
    c:\asl\iasl.exe | find "Optimizing Compiler"
)

echo #######################################################################
echo ### Check source code presence ########################################
echo #######################################################################

if not exist edk2 (
   git clone https://github.com/tianocore/edk2.git
   cd edk2
   git submodule update --init
   cd ..
)
if not exist edk2-platforms git clone https://github.com/tianocore/edk2-platforms.git
if not exist edk2-non-osi git clone https://github.com/tianocore/edk2-non-osi.git
echo MinnowBoard build environment is ready for use...
if "%1" neq "" pause
goto EOF

rem %USERPROFILE%\AppData\Local\Programs\Python\Python37\python.exe --version > 2>&1
rem %USERPROFILE%\AppData\Local\Microsoft\WindowsApps\python.exe

if errorlevel 1 (
    echo installing PYTHON3.7.4 silently...
    download\python-3.7.4-amd64.exe /passive /simple
) else (
    echo PYTHON3.7.4 is installed.
)
:eof

%COMSPEC% /k echo Welcome, to the jungle...