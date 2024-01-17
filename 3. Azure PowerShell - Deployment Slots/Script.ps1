$ResourceGroupName="powershell-grp"
$WebappName="Companybmkapp90999"
$AppServicePlanName="companyplaneBmk200"


Set-AzAppServicePlan -Name $AppServicePlanName -ResourceGroupName $ResourceGroupName `
-Tier Standard

$SlotName="Staging"

New-AzWebAppSlot -Name $WebappName -ResourceGroupName $ResourceGroupName `
-Slot $SlotName


$Properties=@{
    repoUrl="https://github.com/BakhtMunirUet/PracticeAzureWeApp";
    branch="master";
    isManualIntegration="true"
}


Set-AzResource -ResourceGroupName $ResourceGroupName -Properties $Properties `
-ResourceType Microsoft.Web/sites/slots/sourcecontrols `
-ResourceName $WebappName/$SlotName/web -ApiVersion 2015-08-01 -Force


$TargetSlot="production"

Switch-AzWebAppSlot -Name $WebappName -ResourceGroupName $ResourceGroupName `
-SourceSlotName $SlotName -DestinationSlotName $TargetSlot