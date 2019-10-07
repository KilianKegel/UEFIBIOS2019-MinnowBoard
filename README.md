# UEFIBIOS2019-MinnowBoard

build the minnowboard according to https://github.com/tianocore/edk2-platforms/blob/master/Platform/Intel/Vlv2TbltDevicePkg/Readme.md procedure

* [Introduction](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard#introduction)
* [Goal](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard#goal)
* [HowTo/install/build](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard#howto-installbuildedit)
	* [Installation](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard#installation)
	* [Directory structure](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard#directory-structure)
	* [Build](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard#build)
	* [Edit](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard#edit)
* [Related Projects](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard#related-projects)
* [Known Bugs](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard#known-bugs)
* [Revision History](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard#revision-history)


![pci1](https://minnowboard.org/wp-content/uploads/2017/10/MBTurbot-quad-core-Top-0001-171002-1-555x370.png)

https://minnowboard.org/

# Introduction
**This **UEFIBIOS2019-MinnowBoard** introduces the [**_CdePkg_**](https://github.com/KilianKegel/CdePkg#cdepkg) and
the [**_CdeValidationPkg_**](https://github.com/KilianKegel/CdeValidationPkg#cdevalidationpkg) to the
UEFI/Tianocore open source community.**

**UEFIBIOS2019-MinnowBoard** is the Git-*Super-Project* in the [UEFIBIOS2019-MinnowBoard](https://github.com/KilianKegel/UEFIBIOS2019-MinnowBoard) project to build the MinnowBoard UEFI BIOS.
It contains the original [**tianocore edk2**](https://github.com/tianocore/edk2.git) as a Git-*Sub-Project*.
Furthermore the original [**tianocore edk2-platforms**](https://github.com/tianocore/edk2-platforms.git) 
and the original [**tianocore edk2-non-osi**](https://github.com/tianocore/edk2-non-osi.git)

[**tianocore edk2**](https://github.com/tianocore/edk2.git) can also be used stand alone in Emulation Mode (EmulationPkg)
(NOTE: In emulation mode timing calulation assumes to run a 1GHz platform).


The MinnowBoard familiy is an *open source* Personal Computer hardware originally created by a company called
*ADI Engineering*, that now belongs to [Silicom](https://www.silicom-usa.com/)

Intel provides [binary modules](https://firmware.intel.com/projects/minnowboard-max) and maintains the [build environment](https://github.com/tianocore/edk2-platforms/blob/master/Platform/Intel/Vlv2TbltDevicePkg/Readme.md)
to get the MinnowBoard running with the open source [UEFI BIOS Tianocore\EDK2](https://github.com/tianocore/edk2.git)

The MinnowBoard is the only free available hardware/PC platform to get UEFI Tianocore BIOS running.

## Goal
1. 	**The main aspect is, to introduce the [**_CdePkg_**](https://github.com/KilianKegel/CdePkg#cdepkg) and
	the [**_CdeValidationPkg_**](https://github.com/KilianKegel/CdeValidationPkg#cdevalidationpkg) to the
	UEFI/Tianocore open source community.**

2. get the MinnowBoard and the EDK2 Emulation (Nt32Pkg) running with the latest released UDK2018 and the latest Visual Studio VS2019 build environment
3. use OpenSSL_1_1_0-stable in the component CryptoPkg\Library\OpensslLib


**CdePkg** is considered an improvement over traditional UEFI BIOS development, since it introduces
* stable, precise, chipset (ACPI timer) independent C library conform [`clock()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/clock?view=vs-2019) for POST and UEFI Shell in millisecond resolution
* unlimited (buffer less) [`printf()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/printf-printf-l-wprintf-wprintf-l?view=vs-2019)-family and [`scanf()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/scanf-scanf-l-wscanf-wscanf-l?view=vs-2019)-family implementation
* Standard C conform format specifiers for [`printf()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/printf-printf-l-wprintf-wprintf-l?view=vs-2019)-family and [`scanf()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/scanf-scanf-l-wscanf-wscanf-l?view=vs-2019)-family
* a library, which satisfies all the Microsoft C compiler intrinsic requirements with one and the same library (C++ not supported)
* *Hosted Environment* instead of *Freestanding Environment* for POST driver

This improvements shall enable UEFI and [modernFW](https://github.com/intel/ModernFW#modernfw-project)
to provide a Standard C interface for any "C"-(open)source-based extention.

NOTE: Visual Studio is here only used for editing the project. The build process is still pure EDK!
      (the startup error message of VS2017/VS2019 can be ignored)
## Revision History
### 20191006 initial version
* MinnowBoard build RELEASE and DEBUG ok
* Emulation build RELEASE and DEBUG ok
