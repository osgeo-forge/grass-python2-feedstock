if "%LIBRARY_PREFIX%" == "" (
  echo "LIBRARY_PREFIX env var not set!"
  exit 1
)

if not exist "%LIBRARY_PREFIX%" (
  echo "LIBRARY_PREFIX does not exist!"
  exit 1
)

set "GRASS_SITE_PKGS=%LIBRARY_PREFIX%\apps\grass-site-packages"

if not exist "%GRASS_SITE_PKGS%" mkdir "%GRASS_SITE_PKGS%"

:: Install Python 2 pkgs via pip2
pip2 install ^
  --isolated ^
  --target="%GRASS_SITE_PKGS%" ^
  --upgrade ^
  -r %RECIPE_DIR%\requirements.txt
if %errorlevel% neq 0 exit /b %errorlevel%

exit /b 0
