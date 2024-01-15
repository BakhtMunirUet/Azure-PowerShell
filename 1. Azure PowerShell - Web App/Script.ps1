$ResourceGroupName="powershell-grp"
$Location="North Europe"
$AppServicePlanName="companyplaneBmk200"
$WebappName="Companybmkapp90999"


Connect-AzAccount

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

New-AzResourceGroup -ResourceGroupName $ResourceGroupName `
-Location $Location -Tier "B1" -NumberofWorkers 1 -Name $AppServicePlanName

New-AzWebapp -ResourceGroupName $ResourceGroupName -Name $WebappName `
-Location $Location -AppservicePlan $AppServicePlanName