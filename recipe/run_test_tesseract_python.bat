set TESSERACT_SUPPORT_DIR=%CONDA_PREFIX%\opt\tesseract_robotics\share\tesseract_support
set TESSERACT_RESOURCE_PATH=%CONDA_PREFIX%\opt\tesseract_robotics\share
set TESSERACT_TASK_COMPOSER_DIR=%CONDA_PREFIX%\opt\tesseract_robotics\share\tesseract_task_composer

echo TESSERACT_RESOURCE_PATH=%TESSERACT_RESOURCE_PATH%

pytest
if %errorlevel% neq 0 exit /b %errorlevel%