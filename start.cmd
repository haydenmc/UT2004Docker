@ECHO OFF

REM Move info Unreal's working directory
pushd C:\System\

REM Put config files in the right place
if not exist "C:\_data\" mkdir C:\_data
for %%f in (*.ini) do (
    if not exist C:\_data\%%~nxf (
        echo Moving %%~ff to C:\_data and replacing with symlink...
        move /y %%~ff C:\_data\%%~nxf
        mklink %%~ff C:\_data\%%~nxf
    ) ELSE (
        echo %%~ff is already linked to volume
    )
)

REM Start up the server
ucc.exe %*