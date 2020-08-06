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
call go build -ldflags="-s -w" ghproxy.go
call go build -ldflags="-s -w" apiproxy.go

echo [+] Finished.
pause