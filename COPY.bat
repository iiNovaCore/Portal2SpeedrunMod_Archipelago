@ECHO OFF
SETLOCAL

REM Always run from repo root
cd /d "%~dp0"

echo Copying Portal 2 Speedrun Mod...

SET "dest=%ProgramFiles(x86)%\Steam\steamapps\sourcemods\Portal 2 Speedrun Mod"
SET "vpk=%ProgramFiles(x86)%\Steam\steamapps\common\Portal 2\bin\vpk.exe"

IF NOT EXIST "%vpk%" (
    echo ERROR: vpk.exe not found!
    pause
    exit /b 0
)

MKDIR "%dest%"
xcopy /E /V /Y /I "cfg"          "%dest%\cfg"
xcopy /E /V /Y /I "maps"         "%dest%\maps"
xcopy /E /V /Y /I "resource"     "%dest%\resource"
xcopy /E /V /Y /I "scripts"      "%dest%\scripts"
xcopy /E /V /Y /I "media"        "%dest%\media"
copy /Y           "gameinfo.txt" "%dest%\gameinfo.txt"

"%vpk%" pak01_dir
copy /Y "pak01_dir.vpk" "%dest%\pak01_dir.vpk"
DEL pak01_dir.vpk

copy /Y "smsm\bin\smsm.dll" "%dest%\smsm.dll"

echo Done!
pause
exit /b 0
