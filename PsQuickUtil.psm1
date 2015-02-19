function Get-InstallationEvents 
{
    param ( 
        [Parameter()]
        $MaxEvents = [int]::MaxValue ,
        [Parameter()]
        [switch]$oldest,
        [Parameter()]
        [string]$FilterXPath,
        #KnowledgeBase number
        [Parameter()]
        [string]$KB = "."
        )
    $winEventArgs = @{
        ProviderName = "Microsoft-Windows-WUSA"
        MaxEvents = $MaxEvents
        }
    if ( $oldest ) { $winEventArgs['Oldest'] = $true }
    if ( $FilterXPath ) { $winEventArgs['FilterXPath'] = $filterXPath }
    Get-WinEvent @winEventArgs |where Message -match $KB
}
