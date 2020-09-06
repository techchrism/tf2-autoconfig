Function dl($url)
{
    Add-Type -AssemblyName PresentationFramework
    try
    {
        $hl2Path = Split-Path ((Get-Process -Name hl2 -ErrorAction Stop | Select-Object Path).Path)
    }
    catch
    {
        $hl2Path = "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2"
        if(-Not (Test-Path -Path $hl2Path))
        {
            [System.Windows.MessageBox]::Show('TF2 not detected. Please make sure TF2 is running.')
            return;
        }
    }
    $configFile = $hl2Path + "\tf\cfg\autoexec.cfg"
    Invoke-WebRequest ("https://pastebin.com/raw/"+$url) -OutFile $configFile
    [System.Windows.MessageBox]::Show('Done loading config file!')
}