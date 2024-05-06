@echo off
setlocal

::REM Check if directory is provided
::if "%~1" == "" (
::    echo Usage: build.cmd path
::    exit /b 1
::)

REM Set the platform and build folder
set PLATFORM=Win32
set BUILD_DIR=D:\Projects\Work\QuadRemesher\autoremesher
set BOOST_DIR=C:\SDK\boost_1_66_0
set VISUALSTUDIO=Visual Studio 17 2022

::echo %BUILD_DIR%
::exit

REM Set up the Visual Studio environment
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat"

REM Build the project dependencies

REM Build blosc
cd %BUILD_DIR%\thirdparty\blosc\c-blosc-1.18.1
mkdir build
cd build
cmake -G "%VISUALSTUDIO%" -A %PLATFORM% -D "BUILD_SHARED=OFF" -D "BUILD_TESTS=OFF" -D "BUILD_BENCHMARKS=OFF" ..
cmake --build . --config Release
cd %BUILD_DIR%

REM Build zlib
cd %BUILD_DIR%\thirdparty\zlib\zlib-1.2.11
mkdir build
cd build
cmake -G "%VISUALSTUDIO%" -A %PLATFORM% ..
cmake --build . --config Release
copy %BUILD_DIR%\thirdparty\zlib\zlib-1.2.11\build\zconf.h %BUILD_DIR%\thirdparty\zlib\zlib-1.2.11\zconf.h

REM Build OpenEXR
cd %BUILD_DIR%\thirdparty\openexr\openexr-2.4.1
mkdir build
cd build
cmake -G "%VISUALSTUDIO%" -A %PLATFORM% -D "BUILD_SHARED_LIBS=OFF" -D "PYILMBASE_ENABLE=0" -D "OPENEXR_VIEWERS_ENABLE=0" -D "ZLIB_INCLUDE_DIR=%BUILD_DIR%/thirdparty/zlib/zlib-1.2.11" -D "ZLIB_LIBRARY=%BUILD_DIR%/thirdparty/zlib/zlib-1.2.11/build/Release/zlibstatic.lib" ..
cmake --build . --config Release
cd %BUILD_DIR%

REM Build TBB
cd %BUILD_DIR%\thirdparty\tbb
mkdir build
cd build
cmake -G "%VISUALSTUDIO%" -A %PLATFORM% ..
cmake --build . --config Release
cd %BUILD_DIR%

REM Build OpenVDB
cd %BUILD_DIR%\thirdparty\openvdb\openvdb-7.0.0
mkdir build
cd build
cmake -G "%VISUALSTUDIO%" -A %PLATFORM% -D "OPENVDB_CORE_STATIC=OFF" -D "OPENVDB_BUILD_VDB_PRINT=OFF" -D "IlmBase_INCLUDE_DIR=%BUILD_DIR%/thirdparty/openexr/openexr-2.4.1" -D "IlmBase_Half_LIBRARY=%BUILD_DIR%/thirdparty/openexr/openexr-2.4.1/build/IlmBase/Half/Release/Half-2_4.lib" -D "TBB_INCLUDEDIR=%BUILD_DIR%/thirdparty/tbb/include" -D "TBB_LIBRARYDIR=%BUILD_DIR%/thirdparty/tbb/build/Release" -D "ZLIB_INCLUDE_DIR=%BUILD_DIR%/thirdparty/zlib/zlib-1.2.11" -D "ZLIB_LIBRARY=%BUILD_DIR%/thirdparty/zlib/zlib-1.2.11/build/Release/zlibstatic.lib" -D "Blosc_INCLUDE_DIR=%BUILD_DIR%/thirdparty/blosc/c-blosc-1.18.1" -D "Blosc_LIBRARY=%BUILD_DIR%/thirdparty/blosc/c-blosc-1.18.1/build/blosc/Release/libblosc.lib" -D "BOOST_INCLUDEDIR=%BOOST_DIR%" -D "OPENVDB_DISABLE_BOOST_IMPLICIT_LINKING=ON" -D "CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES=%BOOST_DIR%;%BUILD_DIR%/thirdparty/blosc/c-blosc-1.18.1/blosc;%BUILD_DIR%/thirdparty/zlib/zlib-1.2.11/build" ..
cmake --build . --config Release
cd %BUILD_DIR%

@REM REM Download and install CGAL
@REM REM Check if CGAL-5.1-beta1-Setup.exe exists and download  if not
@REM if not exist %BUILD_DIR%\thirdparty\cgal\CGAL-5.1-beta1-Setup.exe (
@REM     echo Downloading CGAL-5.1-beta1-Setup.exe
@REM     curl -L https://github.com/CGAL/cgal/releases/download/releases/CGAL-5.1-beta1/CGAL-5.1-beta1-Setup.exe -o %BUILD_DIR%\thirdparty\cgal\CGAL-5.1-beta1-Setup.exe
@REM     %BUILD_DIR%\thirdparty\cgal\CGAL-5.1-beta1-Setup.exe /S /D=%BUILD_DIR%\thirdparty\cgal\cgal-5.1-beta1
@REM )
@REM cd %BUILD_DIR%

endlocal
