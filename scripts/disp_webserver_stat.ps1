"Conten-type:application/json"
echo ""

$ErrorActionPreference = "silentlycontinue"

$url01 = "http://192.168.0.1/"
$url02 = "http://192.168.0.2/"
$url03 = "http://192.168.0.3/"
$url04 = "http://192.168.0.4/"
$url05 = "http://192.168.0.5/"

function getStat($url) {
	[System.Net.HttpWebRequest]$REQUEST = [System.Net.WebRequest]::Create($url)
    $REQUEST.Timeout=2000;
	$RESPONSE = $REQUEST.GetResponse()
	$RESPONSE.Close()
	return [int]$RESPONSE.StatusCode
}

function echoStatJson($id, $serverip, $stat) {
	echo "{"
	echo $("`"id`" : `""+$id+"`"")
	echo $(", `"serverip`" : `""+$serverip+"`"")
	echo $(", `"stat`" : `""+$stat+"`"")
	echo "}"
}

$stat01 = getStat $url01
$stat02 = getStat $url02
$stat03 = getStat $url03
$stat04 = getStat $url04
$stat05 = getStat $url05

echo "["
echoStatJson 1 "server01" $stat01
echo ","
echoStatJson 2 "server02" $stat02
echo ","
echoStatJson 3 "server03" $stat03
echo ","
echoStatJson 4 "server04" $stat04
echo ","
echoStatJson 5 "server05" $stat05
echo "]"
