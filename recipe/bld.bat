set CXXFLAGS=%CXXFLAGS% -D_ENABLE_EXTENDED_ALIGNED_STORAGE=1

call colcon build --merge-install --install-base="%PREFIX%\opt\tesseract_robotics" ^
   --event-handlers console_cohesion+ ^
   --packages-ignore gtest osqp osqp_eigen ^
   --cmake-args -GNinja -DCMAKE_BUILD_TYPE=Release ^
   -DCMAKE_CXX_FLAGS_RELWITHDEBINFO:STRING="/MD /Zi /O0 /Ob0 /DNDEBUG" ^
   -DBUILD_SHARED_LIBS=ON ^
   -DUSE_MSVC_RUNTIME_LIBRARY_DLL=ON ^
   -DBUILD_IPOPT=OFF ^
   -DBUILD_SNOPT=OFF ^
   -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
   -DTESSERACT_ENABLE_CLANG_TIDY=OFF ^
   -DTESSERACT_ENABLE_CODE_COVERAGE=OFF ^
   -DPYTHON_EXECUTABLE="%PREFIX%\python.exe"

if %errorlevel% neq 0 exit /b %errorlevel%

setlocal EnableDelayedExpansion

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
)

if %errorlevel% neq 0 exit /b %errorlevel%