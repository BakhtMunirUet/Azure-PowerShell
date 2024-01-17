$ResourceGroupName="powershell-grp"
$WebappName="Companybmkapp90999"



$Properties=@{
    repoUrl="https://github.com/BakhtMunirUet/PracticeAzureWeApp";
    branch="master";
    isManualIntegration="true"
}


Set-AzResource -ResourceGroupName $ResourceGroupName -Properties $Properties `
-ResourceType Microsoft.Web/sites/sourcecontrols `
-ResourceName $WebappName/web -ApiVersion 2015-08-01 -Force