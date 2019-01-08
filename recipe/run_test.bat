if "%LIBRARY_PREFIX%" == "" (
  set "LIBRARY_PREFIX=%CONDA_PREFIX%\Library"
)

if not exist "%LIBRARY_PREFIX%\" (
  echo "LIBRARY_PREFIX directory does not exist!"
  exit 1
)

set OSGEO4W_ROOT=%LIBRARY_PREFIX%

rem Add the standard GRASS Python2 packages
set PYTHONPATH=%OSGEO4W_ROOT%\apps\grass-site-packages;%PYTHONPATH%
path %OSGEO4W_ROOT%\apps\grass-site-packages\bin;%PATH%

python2 -c "import numpy"
if %errorlevel% neq 0 exit /b %errorlevel%
python2 -c "import matplotlib"
if %errorlevel% neq 0 exit /b %errorlevel%
python2 -c "import wx"
if %errorlevel% neq 0 exit /b %errorlevel%
python2 -c "import PIL"
if %errorlevel% neq 0 exit /b %errorlevel%

exit /b 0
