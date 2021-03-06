echo Downloading Python...
echo Downloading %PYTHON_ORIGIN%
powershell -Command "(New-Object Net.WebClient).DownloadFile('%PYTHON_ORIGIN%', '%1\python_installer.exe')"

echo Installing Python...
mkdir "%1\python"
"%1\python_installer.exe" /passive "TargetDir=%1\python" AssociateFiles=0 Shortcuts=0 Include_doc=0 Include_launcher=0 Include_test=0
if not exist "%1\python\python.exe" (
    call %1\cppy.bat "%1" python.exe
)

echo Updating Package Manager...
"%1\python\python.exe" -m pip install --no-warn-script-location --upgrade pip

echo Installing Packages...
"%1\python\python.exe" -m pip install --no-warn-script-location %PACKAGES%
