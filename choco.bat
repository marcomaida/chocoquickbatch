@echo off

:: Check to see if we are admin
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' (
	goto admin
)
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
exit /B

PAUSE
:admin

set choco="%ALLUSERSPROFILE%\chocolatey\bin\choco"
IF "%1" == "chocoisinstalled" (
	echo.
	echo.
	echo ************************ 
	echo USING CHOCO TO INSTALL PACKAGES
	echo ************************ 

	%choco% install googlechrome -y
	%choco% install googledrive -y

	%choco% install git -y
	%choco% install sourcetree -y
	%choco% install sublimetext3 -y

	%choco% install 7zip.install -y
	%choco% install vlc -y
	%choco% install glip -y
	%choco% install spotify -y --ignore-checksum 
	REM Spotify has some problems with checksum. Let's ignore them 
	%choco% install steam -y
	
	%choco% install treesizefree -y
	%choco% install paint.net -y
	%choco% install audacity -y
	%choco% install gitkraken -y
	%choco% install everything -y

	echo.
	echo.
	echo ************************ 
	echo FINISHED! Check that everything is okay before closing
	echo ************************ 
	echo.
	pause
) ELSE (
	IF EXIST "%ALLUSERSPROFILE%\chocolatey\bin" (
		echo.
		echo ************************ 
		echo UPDATING CHOCO
		echo ************************ 

		%choco% update all -y
		echo.
		echo.
		echo ************************ 
		echo FINISHED! Check that everything is okay before closing
		echo ************************ 
		echo.
		pause
	) ELSE (
		echo.
		echo.
		echo ************************ 
		echo INSTALLING CHOCO
		echo ************************ 

		@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

		start %~dpnx0 chocoisinstalled
        )
)
