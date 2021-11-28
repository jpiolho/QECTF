@echo off
setlocal
rem Main
call :RereleaseFolder
call :SavedGamesFolder

set mod=rogue
call :InstallForMod
set mod=mg1
call :InstallForMod
set mod=hipnotic
call :InstallForMod
set mod=dopa
call :InstallForMod

goto end



:RereleaseFolder
set folder_rerelease=%programfiles(x86)%\steam\steamapps\common\quake\rerelease

if not exist "%folder_rerelease%" call :InsertRereleaseFolder
if not exist "%folder_rerelease%\QuakeEX.kpf" call :InsertRereleaseFolder
goto :eof

:InsertRereleaseFolder
echo Enter your quake rerelease installation folder path
echo This is usually located at 'C:\Program Files (x86)\Steam\steamapps\common\Quake\rerelease'
set /p folder_rerelease="Path: "

if not exist "%folder_rerelease%\QuakeEX.kpf" (
	echo Could not find QuakeEX.kdf. Are you sure your rerelease folder path is correct?
	goto :InsertRereleaseFolder
)
goto :eof

:SavedGamesFolder
set folder_savedgames=%userprofile%\Saved Games\Nightdive Studios\Quake

if not exist "%folder_savedgames%" call :InsertSavedGamesFolder
if not exist "%folder_savedgames%\kexengine.cfg" call :InsertSavedGamesFolder
goto :eof

:InsertSavedGamesFolder
echo Enter your quake saved game folder path
echo This is usually located at '%userprofile%\Saved Games\Nightdive Studios\Quake'
set /p folder_savedgames="Path: "

if not exist "%folder_savedgames%\kexengine.cfg" (
	echo Could not find kexengine.cfg. Are you sure your saved games folder path is correct?
	goto :InsertSavedGamesFolder
)
goto :eof



:InstallForMod
cd "%folder_savedgames%
if not exist "%mod%" (
	echo '%mod%' folder not found. Creating...
	mkdir %mod%
)

cd %mod%
if exist pak0.pak (
	echo pak0.pak is already installed in '%mod%'
) else (
	echo Creating symbolic link for '%cd%\pak0.pak'...
	mklink "pak0.pak" "%folder_rerelease%\%mod%\pak0.pak"
)
goto :eof


:end
endlocal
echo Done
pause