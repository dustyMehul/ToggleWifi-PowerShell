cd C:\Users\Public\Documents\myScript

$inftLoop = 0

while($inftLoop -lt 1)
{
	ping 8.8.8.8 | Out-File -filepath C:\Users\Public\Documents\myScript\out.txt
	$FileContent = Get-Content "C:\Users\Public\Documents\myScript\out.txt"
	$Matches = Select-String -InputObject $FileContent -Pattern "Reply from 8.8.8.8" -AllMatches
 	$pDate = Get-Date
	if($Matches.Matches.Count -lt 1)
	{
		Write-Output "Date $pDate Internet Connection not working!! :( "
		"ERROR $pDate - Error while connecting to Internet" >> C:\Users\Public\Documents\myScript\error.log
		Start-Sleep -m 500
		echo "Disabling Wi-Fi"
		Get-NetAdapter -Name 'Wi-Fi 4' | Disable-NetAdapter -Confirm:$false
		Start-Sleep -m 500
		echo "Wi-Fi disabled"
		Start-Sleep -s 3
		echo "Enabling Wi-Fi"
		Get-NetAdapter -Name 'Wi-Fi 4' | Enable-NetAdapter
		Start-Sleep -m 500
		echo "Wi-Fi Enabled"
		Start-Sleep -s 8
	}
	else{
		Write-Output "Date $pDate Internet Connection working!! :) "
		Start-Sleep -m 500
	}
	$Matches = 0
}