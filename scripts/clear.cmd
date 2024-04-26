@echo off
setlocal

set BUILD_DIR=D:\Projects\Work\QuadRemesher\autoremesher

rmdir /s /q %BUILD_DIR%\thirdparty\blosc\c-blosc-1.18.1\build
rmdir /s /q %BUILD_DIR%\thirdparty\zlib\zlib-1.2.11\build
rmdir /s /q %BUILD_DIR%\thirdparty\openexr\openexr-2.4.1\build
rmdir /s /q %BUILD_DIR%\thirdparty\tbb\build
rmdir /s /q %BUILD_DIR%\thirdparty\openvdb\openvdb-7.0.0\build

endlocal