@echo off
setlocal

REM Set up the Visual Studio environment
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat"

REM Build the project dependencies

REM Build blosc
cd X:\Samolet\autoremesher\thirdparty\blosc\c-blosc-1.18.1
mkdir build
cd build
cmake -G "Visual Studio 15 2017" -A Win32 -D "BUILD_SHARED=OFF" -D "BUILD_TESTS=OFF" -D "BUILD_BENCHMARKS=OFF" ..
cmake --build . --config Release
cd X:\Samolet\autoremesher

REM Build zlib
cd X:\Samolet\autoremesher\thirdparty\zlib\zlib-1.2.11
mkdir build
cd build
cmake -G "Visual Studio 15 2017" -A Win32 ..
cmake --build . --config Release
copy X:\Samolet\autoremesher\thirdparty\zlib\zlib-1.2.11\build\zconf.h X:\Samolet\autoremesher\thirdparty\zlib\zlib-1.2.11\zconf.h

REM Build OpenEXR
cd X:\Samolet\autoremesher\thirdparty\openexr\openexr-2.4.1
mkdir build
cd build
cmake -G "Visual Studio 15 2017" -A Win32 -D "BUILD_SHARED_LIBS=OFF" -D "PYILMBASE_ENABLE=0" -D "OPENEXR_VIEWERS_ENABLE=0" -D "ZLIB_INCLUDE_DIR=X:\Samolet\autoremesher/thirdparty/zlib/zlib-1.2.11" -D "ZLIB_LIBRARY=X:\Samolet\autoremesher/thirdparty/zlib/zlib-1.2.11/build/Release/zlibstatic.lib" ..
cmake --build . --config Release
cd X:\Samolet\autoremesher

REM Build TBB
cd X:\Samolet\autoremesher\thirdparty\tbb
mkdir build
cd build
cmake -G "Visual Studio 15 2017" -A Win32 ..
cmake --build . --config Release
cd X:\Samolet\autoremesher

REM Build OpenVDB
cd X:\Samolet\autoremesher\thirdparty\openvdb\openvdb-7.0.0
mkdir build
cd build
cmake -G "Visual Studio 15 2017" -A Win32 -D "OPENVDB_CORE_STATIC=OFF" -D "OPENVDB_BUILD_VDB_PRINT=OFF" -D "IlmBase_INCLUDE_DIR=X:\Samolet\autoremesher/thirdparty/openexr/openexr-2.4.1" -D "IlmBase_Half_LIBRARY=X:\Samolet\autoremesher/thirdparty/openexr/openexr-2.4.1/build/IlmBase/Half/Release/Half-2_4.lib" -D "TBB_INCLUDEDIR=X:\Samolet\autoremesher/thirdparty/tbb/include" -D "TBB_LIBRARYDIR=X:\Samolet\autoremesher/thirdparty/tbb/build/Release" -D "ZLIB_INCLUDE_DIR=X:\Samolet\autoremesher/thirdparty/zlib/zlib-1.2.11" -D "ZLIB_LIBRARY=X:\Samolet\autoremesher/thirdparty/zlib/zlib-1.2.11/build/Release/zlibstatic.lib" -D "Blosc_INCLUDE_DIR=X:\Samolet\autoremesher/thirdparty/blosc/c-blosc-1.18.1" -D "Blosc_LIBRARY=X:\Samolet\autoremesher/thirdparty/blosc/c-blosc-1.18.1/build/blosc/Release/libblosc.lib" -D "BOOST_INCLUDEDIR=x:\Samolet\boost_1_66_0" -D "OPENVDB_DISABLE_BOOST_IMPLICIT_LINKING=ON" -D "CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES=x:\Samolet\boost_1_66_0;X:\Samolet\autoremesher/thirdparty/blosc/c-blosc-1.18.1/blosc;X:\Samolet\autoremesher/thirdparty/zlib/zlib-1.2.11/build" ..
cmake --build . --config Release
cd X:\Samolet\autoremesher

REM Download and install CGAL
REM Check if CGAL-5.1-beta1-Setup.exe exists and download  if not
if not exist X:\Samolet\autoremesher\thirdparty\cgal\CGAL-5.1-beta1-Setup.exe (
    echo Downloading CGAL-5.1-beta1-Setup.exe
    curl -L https://github.com/CGAL/cgal/releases/download/releases/CGAL-5.1-beta1/CGAL-5.1-beta1-Setup.exe -o X:\Samolet\autoremesher\thirdparty\cgal\CGAL-5.1-beta1-Setup.exe
    X:\Samolet\autoremesher\thirdparty\cgal\CGAL-5.1-beta1-Setup.exe /S /D=X:\Samolet\autoremesher\thirdparty\cgal\cgal-5.1-beta1
)

endlocal
