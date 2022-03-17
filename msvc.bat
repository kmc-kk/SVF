@echo off

set llvm_version=10.0.0
set z3_version=4.8.8
set cur_dir=%CD%


@rem 
@rem Prepare files
@rem 
@rem Download Z3 library
set Win64Z3=https://github.com/Z3Prover/z3/releases/download/z3-%z3_version%/z3-%z3_version%-x64-win.zip
@rem 
@rem Extract z3-%z3_version%-x64-win.zip to .\z3-%z3_version%-x64-win\
set Win64Z3File=z3-%z3_version%-x64-win.zip
set Win64Z3Dir=.\z3-%z3_version%-x64-win\
@rem 
@rem Rename static library file %Win64Z3Dir%bin\libz3.lib to %Win64Z3Dir%bin\libz3.a
copy %Win64Z3Dir%bin\libz3.lib %Win64Z3Dir%bin\libz3.a
@rem 

@rem 
@rem Setup PATH to CMake
@rem 
set PATH=C:\work\cmake-3.22.1-windows-x86_64\bin;%PATH%

@rem 
@rem Build
@rem 

set build_dir=%cur_dir%\build
set SVFHOME=%cur_dir%
@rem set llvm_src=%cur_dir%\llvm-%llvm_version%.src
@rem set llvm_dir=C:\work\git\kmc-kk\clang-tools\ext\llvm10\llvm\lib\cmake\llvm
set llvm_dir=C:\work\LLVM\10\llvm-%llvm_version%.build\lib\cmake\llvm
set Z3Home=z3-%z3_version%-x64-win

@rem set LLVM_DIR=%SVFHOME%\%llvm_dir%
set Z3_DIR=%SVFHOME%\%Z3Home%
set MSVC=TRUE

rmdir /Q %build_dir%
mkdir %build_dir%

set CMAKE_OPT=
set CMAKE_OPT=%CMAKE_OPT% -S %SVFHOME%
set CMAKE_OPT=%CMAKE_OPT% -B %build_dir%
set CMAKE_OPT=%CMAKE_OPT% -G "Visual Studio 15 2017"
set CMAKE_OPT=%CMAKE_OPT% -A x64
set CMAKE_OPT=%CMAKE_OPT% -T host=x64
set CMAKE_OPT=%CMAKE_OPT% -D MSVC:BOOL=TRUE
set CMAKE_OPT=%CMAKE_OPT% -D CMAKE_CXX_STANDARD=14
set CMAKE_OPT=%CMAKE_OPT% -D Z3_DIR=%SVFHOME%\%Z3Home%
set CMAKE_OPT=%CMAKE_OPT% -D LLVM_DIR=%llvm_dir%
echo %CMAKE_OPT%

if "%CMAKE%"=="" (
  cmake %CMAKE_OPT% 
  rem cmake-gui %CMAKE_OPT% 
) else (
  %CMAKE% %CMAKE_OPT% 
)

cd %cur_dir%
pause
@rem %ComSpec%

