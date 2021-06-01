#Bulk user license removal in 365

#Connect-MsolService

#Get-content -path $list
$list = Get-Content -Path "C:\path_to\bulkdelete.txt"

forEach ($i in $list){
    #get-MsolUser -UserPrincipalName $i.licenses.AccountSkuId | 
    Set-MsolUserLicense -UserPrincipalName $i -RemoveLicenses "<>:STANDARDPACK_<>"
    Remove-MsolUser -UserPrincipalName $i -Force
    Write-host "Unlicensed and removed " + $i
    } 