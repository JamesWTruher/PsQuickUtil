function Get-InstallationEvents 
{
    param ( 
        $MaxEvents = [int]::MaxValue ,
        [switch]$oldest,
        [string]$FilterXPath
        )
    $winEventArgs = @{
        ProviderName = "*WUSA*"
        MaxEvents = $MaxEvents
        }
    if ( $oldest ) { $winEventArgs['Oldest'] = $true }
    if ( $FilterXPath ) { $winEventArgs['FilterXPath'] = $filterXPath }
    Get-WinEvent @winEventArgs
}
