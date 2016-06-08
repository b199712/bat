ECHO off
SET /p path1=輸入取代位址資料夾(請輸入絕對位址)：
SET /p path2=輸入欲取代位址資料夾(請輸入絕對位址)：
SET do_stuff=false

REM chec path1 and path2 is a directory
REM IF EXIST %path1% IF EXIST %path2% SET do_stuff=true
REM IF "%do_stuff%"=="true" (
REM ) ELSE (
REM )

IF EXIST "%path1%" (
	ECHO make folder
	MKDIR %path2%
	TIMEOUT /t 5
	ECHO start move data
	ROBOCOPY /copyall /move /e %path1% %path2%
	TIMEOUT /t 5
	ECHO delete source folder
	DEL %path1%
	TIMEOUT /t 5
	ECHO make symbolic link
	MKLINK /d %path1% %path2%
) ELSE (
	ECHO Wrong PATH
)

pause