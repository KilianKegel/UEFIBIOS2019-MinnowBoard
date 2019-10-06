@echo off
set WORKSPACE=%CD%
set PACKAGES_PATH=%WORKSPACE%\edk2;%WORKSPACE%\edk2-platforms\Silicon\Intel;%WORKSPACE%\edk2-platforms\Platform\Intel;%WORKSPACE%\edk2-non-osi\Silicon\Intel
set EDK_TOOLS_PATH=%WORKSPACE%\edk2\BaseTools
path=%path%;%WORKSPACE%\openssl-1.0.2r-x64_86-win64
set NASM_PREFIX=%WORKSPACE%\nasm-2.13.03\

rem ######################################################################
rem ### PYTHONE_HOME
rem ######################################################################
for /F  %%a in ('where python.exe') do set PYTHON_HOME=%%~dpa

rem ######################################################################
rem ### extend the path ##################################################
rem ######################################################################
rem SET PATH=%path%;%WORKSPACE%\edk2\BaseTools\Source\C\VfrCompile\Pccts\dlg
rem SET PATH=%path%;%WORKSPACE%\edk2\BaseTools\Source\C\VfrCompile\Pccts\antlr
rem SET PATH=%path%;%BASE_TOOLS_PATH%\Bin\Win32

cd %WORKSPACE%\edk2

call edksetup.bat Rebuild

cd %WORKSPACE%\edk2\BaseTools\Source\C
nmake all

cd %WORKSPACE%\edk2

rem echo start the build? 5 seconds to stop... (ctrl-C to break)
rem ping 127.0.0.0 -n 10 > nul
echo build -a IA32 -a X64 -n 5 -t VS2015x86 -b DEBUG -p Vlv2TbltDevicePkg\PlatformPkgX64.dsc
echo build -p EmulatorPkg\EmulatorPkg.dsc -t VS2017 -a IA32