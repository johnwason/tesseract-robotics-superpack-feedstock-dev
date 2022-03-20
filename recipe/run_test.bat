set TESSERACT_SUPPORT_DIR=%CONDA_PREFIX%\opt\tesseract_robotics\share\tesseract_support

echo TESSERACT_SUPPORT_DIR=%TESSERACT_SUPPORT_DIR%

pytest -s
if %errorlevel% neq 0 exit /b %errorlevel%