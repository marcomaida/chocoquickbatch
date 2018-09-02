@echo off

IF "%1" == "chocoisinstalled" (
	echo.
	echo.
	echo ************************ 
	echo USING CHOCO TO INSTALL PACKAGES - RUN THIS AS ADMINISTRATOR!
	echo ************************ 
	timeout 5

	choco install googlechrome -y
	choco install googledrive -y

	choco install git -y
	choco install sourcetree -y
	choco install sublimetext3 -y

	choco install 7zip.install -y
	choco install vlc -y
	choco install glip -y
	choco install spotify -y --ignore-checksum 
	choco install steam -y
	REM Spotify has some problems with checksum. Let's ignore them 
	
	choco install treesizefree -y
	choco install paint.net -y
	choco install audacity -y
	choco install gitkraken -y
	choco install everything -y

	echo.
	echo.
	echo ************************ 
	echo FINISHED! Check that everything is okay before closing
	echo ************************ 
	echo.
	pause
)
ELSE (
	echo.
	echo.
	echo ************************ 
	echo INSTALLING CHOCO IF NOT PRESENT - RUN THIS AS ADMINISTRATOR!
	echo ************************ 
	timeout 8

	@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

	start %~dpnx0 chocoisinstalled
)
