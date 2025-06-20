set iddy=1-21-0
set time2=%time: =0%
set iddt=%iddy%%time2:~0,2%%time2:~3,2%%time2:~6,2%

set MC_HOME=%AppData%\.minecraft
echo %MC_HOME%
explorer %MC_HOME%
cd /d %~dp0

If not exist %MC_HOME%\mods mkdir %MC_HOME%\mods
attrib -r %MC_HOME%\mods
ren %MC_HOME%\mods mods_bk_%iddt%
mkdir %MC_HOME%\mods

copy mods %MC_HOME%\mods

If not exist %MC_HOME%\config mkdir %MC_HOME%\config
mkdir %MC_HOME%\config_bk_%iddt%
xcopy /s /e %MC_HOME%\config %MC_HOME%\config_bk_%iddt%
copy config %MC_HOME%\config

If not exist %MC_HOME%\shaderpacks mkdir %MC_HOME%\shaderpacks
mkdir %MC_HOME%\shaderpacks_bk_%iddt%
xcopy /s /e %MC_HOME%\shaderpacks %MC_HOME%\shaderpacks_bk_%iddt%
copy shaderpacks %MC_HOME%\shaderpacks

echo. >> "%MC_HOME%\options.txt" && type "options.txt" >> "%MC_HOME%\options.txt"

pause