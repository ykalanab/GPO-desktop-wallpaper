[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'enter valid ip address'
$msg   = 'Enter your server IP :'
$server = '$text';
$message = 'connection success';



$text=[Microsoft.VisualBasic.Interaction]::InputBox($title,$msg)

$server =[System.Windows.MessageBox]::Show("Would  you like connect to server $text",'server input','YesNoCancel','Error')



Enter-PSSession -ComputerName $text -Credential administrator


Function remote_message{

Invoke-WmiMethod -Class win32_process  -Name create -ArgumentList  "c:\windows\system32\msg.exe * $message"}

remote_message


$IMAGES = Get-ChildItem -path  C:\Windows\Web\Wallpaper\Windows\*.jpg -Recurse -Force
    
ForEach ($IMAGE in $IMAGES)
    {
##edit GPO registry###
     Set-GPRegistryValue -Name "wallpaper_change" -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName 'WallpaperStyle' -Value 0 -Type Dword
     Set-GPregistryValue -Name "wallpaper_change" -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName 'Wallpaper' -Value $IMAGES -Type ExpandString
    }
