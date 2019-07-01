<p align="center">
	<b>SWC - Serveo Website Crawler</b>
	<br>
	<i>A tool that searches for websites that use serveo.</i>
	<br><br><br>
	<img alt="screenshot" src="media/screenshot.gif">
</p>

# Usage
Run by double-clicking:
> src/SWC.bat

It automatically saves **index.html** when it finds any alive website and saves it's name in **log.txt**.

If you want to change the length/charset of a website name (line 10):
```batchfile
call PwdGen.bat 2 6 > "_string"
::              ^ ^ length
::              \ charset
```
Click [here](https://github.com/hXR16F/PwdGen/) for more informations about **PwdGen**.

# Reading log.txt
Example log:
```
-qhicsv
-wekcxk
-cmwzrf
-xyqrxg
-tutnih
-rgendi
-sejqws
+equina
```
The '**+**' indicates that website is alive and the '**-**' means that website doesn't exist.

The script below allows you to process through **log.txt**:
```batchfile
@echo off
setlocal EnableDelayedExpansion
for /f "tokens=1*" %%i in (log.txt) do (
	set "line=%%i"
	if "!line:~0,1!" equ "+" echo https://!line:~1,64!.serveo.net/ ^(Alive^)
	if "!line:~0,1!" equ "-" echo https://!line:~1,64!.serveo.net/ ^(Dead^)
)
pause
```
The output would be:
```
https://qhicsv.serveo.net/ (Dead)
https://wekcxk.serveo.net/ (Dead)
https://cmwzrf.serveo.net/ (Dead)
https://xyqrxg.serveo.net/ (Dead)
https://tutnih.serveo.net/ (Dead)
https://rgendi.serveo.net/ (Dead)
https://sejqws.serveo.net/ (Dead)
https://equina.serveo.net/ (Alive)
Press any key to continue . . .
```
