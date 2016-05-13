<?php
$serial = exec("cat /proc/cpuinfo | grep Serial | cut -d ':' -f 2");
//$serial = rand(0, 100000);
$temperature = rand(20, 45);
$humidity = rand(0,100);
$batterie = rand(0,100);

$ip_web_server = "54.144.23.166";
//put the datas in arrays
$json = array( 'sensors' =>
	array('Temperature' => $temperature,
	'Humidity' => $humidity,
	'Batterie' => $batterie
	),
	'serial_number' => $serial);

$json = json_encode($json, JSON_FORCE_OBJECT);
//parse it in json
exec("echo ".$json." >> /home/pi/Desktop/cloudberry/log.sh");
$fp = fopen('/home/pi/Desktop/cloudberry/data.json', 'w');
fwrite($fp, $json);
fclose($fp);
$url = "http://54.144.23.166/cloudberry/receiveJson.php";
/*$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");

curl_setopt($ch, CURLOPT_POSTFIELDS, $json);

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true)

curl_setopt($ch, CURLOPT_HEADER, array(
    'Content-Type: application/json',
    'Content-Length: ' . strlen($json))
);
$result = curl_exec($ch);*/

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,$json);
$response  = curl_exec($ch);
exec("echo ".$response." >> /home/pi/Desktop/cloudberry/log.sh");
curl_close($ch);
?>
