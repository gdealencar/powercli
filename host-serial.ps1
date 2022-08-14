$report = foreach($esxcli in Get-VMHost | Get-EsxCli -V2){
    $esxcli.hardware.platform.get.Invoke() |
    Select @{N='VMHost';E={$esxcli.VMHost.Name}},VendorName,ProductName,SerialNumber
}
$report | Export-Csv -Path .\report.csv -NoTypeInformation -UseCulture