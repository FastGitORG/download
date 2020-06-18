@echo off
echo ===========================
echo = Go Cross Compile Helper =
echo = by KevinZonda           =
echo ===========================

:: Build for Linux
echo [+] Set env
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64

echo [+] Start build
call go build ghproxy.go

echo [+] Finished.
pause