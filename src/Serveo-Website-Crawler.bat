:: Programmed by hXR16F
:: hXR16F.ar@gmail.com

@echo off
title SWC - Serveo Website Crawler
setlocal EnableDelayedExpansion
if not exist "websites" md "websites"

:loop
	call PwdGen.bat 2 6 > "_string"
	:: https://github.com/hXR16F/PwdGen/
	for /f "tokens=1*" %%i in (_string) do set "address=%%i"
	
	curl -s !address!.serveo.net -o _webpage
	for /f "tokens=1*" %%i in (_webpage) do (
		if not "%%i" equ "" (
			call batbox.dll /c 0xf0 /d "https://" /c 0x2f /d "%address%" /c 0xf0 /d ".serveo.net/" & echo.
			echo.+!address!>> "log.txt"
			ren _webpage !address!.html >nul 2>&1
			move "!address!.html" "websites" >nul 2>&1
			echo.start https://!address!.serveo.net> "!address!.cmd"
			move "!address!.cmd" "websites" >nul 2>&1
			goto :loop
		)
	)
	call batbox.dll /c 0xf0 /d "https://" /c 0xcf /d "%address%" /c 0xf0 /d ".serveo.net/" & echo.
	echo.-!address!>> "log.txt"
	
	goto :loop
	