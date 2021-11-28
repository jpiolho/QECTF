function Add-Tools-Path
{
    $path = ([IO.Path]::Combine(".","set_path.ps1"))
    if ((Get-Command $path -ErrorAction SilentlyContinue) -ne $null)
    {
        Invoke-Expression -Command $path
    }
}

function Convert-Nav-To-NavJson
{
    Push-Location (Combine-Paths @('.','bots','navigation'))
    
    try 
    {
        foreach($navjson in (Get-ChildItem -Path '.' -File -Filter "*.nav"))
        {
            Start-Process "nav2json" -ArgumentList @("-navjson","-ow","-upgrade",($navjson | Resolve-Path -Relative)) -NoNewWindow -Wait
        }
    }
    finally
    {
        Pop-Location
    }
}


function Main
{
    Add-Tools-Path
    Convert-Nav-To-NavJson
}

Main