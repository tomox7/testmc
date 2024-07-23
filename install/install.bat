set MC_HOME=%AppData%\.minecraft
echo %MC_HOME%
explorer %MC_HOME%
cd /d %~dp0
set /p INPUTSTR="open minecraft folder ?(y or n)"

IF %INPUTSTR%==y (
GOTO CP
) ELSE (
GOTO END
)

:CP
If not exist %MC_HOME%\mods mkdir %MC_HOME%\mods
attrib -r %MC_HOME%\mods
ren %MC_HOME%\mods mods_bk_20240722202823
mkdir %MC_HOME%\mods

copy mods %MC_HOME%\mods

If not exist %MC_HOME%\config mkdir %MC_HOME%\config
mkdir %MC_HOME%\config_bk_20240722202823
xcopy /s /e %MC_HOME%\config %MC_HOME%\config_bk_20240722202823
copy config %MC_HOME%\config

If not exist %MC_HOME%\shaderpacks mkdir %MC_HOME%\shaderpacks
mkdir %MC_HOME%\shaderpacks_bk_20240722202823
xcopy /s /e %MC_HOME%\shaderpacks %MC_HOME%\shaderpacks_bk_20240722202823
copy shaderpacks %MC_HOME%\shaderpacks
:END
pause