

$Aaaryofkb = @('KB4577064', 'KB4577051', 'KB4577066', 'KB4577015', 'KB4570333', ) \\ Replace the array with the list of Monthly Security Updates for each OS. See read me file.

$HotfixInstaled = (Get-Hotfix | select HotFixID).HotFixID
$Hotfixcompare = Compare-Object $Aaaryofkb ($HotfixInstaled)  -IncludeEqual 

 

foreach ($NewHotfixcompare in $Hotfixcompare) {
    if($NewHotfixcompare.sideindicator -eq "=="){
    $NewHotfixcompare.sideindicator = "SUCCESS"
    $NewHotfixcompare.sideindicator
    break
}
    elseif($NewHotfixcompare.sideindicator -eq "=>" -or "<="){ 
$NewHotfixcompare.sideindicator = "FAIL"
$NewHotfixcompare.sideindicator
    break
}
$NewHotfixcompare
}
 
