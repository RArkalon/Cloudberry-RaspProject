<?php
$serial = exec("cat /proc/cpuinfo | grep Serial | cut -d ':' -f 2");
//$serial = rand(0, 100000);
$temperature = rand(20, 45);
$humidity = rand(0,100);
$vibration = rand(0,100);

$ip_web_server = "54.144.23.166";
//put the datas in arrays
$json = array( 'sensors' =>
        array('Temperature' => $temperature,
        'Humidity' => $humidity,
        'Vibration' => $vibration
        ),
        'serial_number' => $serial);

$json = json_encode($json, JSON_FORCE_OBJECT);
//parse it in json
exec("echo ".$json." >> /home/pi/Desktop/cloudberry/log.sh");
//store the json in a json file in case of failure
$fp = fopen('/home/pi/Desktop/cloudberry/data.json', 'w');
fwrite($fp, $json);
fclose($fp);
$url = "http://54.144.23.166/cloudberry/receiveJson.php";

//send the json to the web server in curl
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,$json);
$response  = curl_exec($ch);
exec("echo ".$response." >> /home/pi/Desktop/cloudberry/log.sh");
curl_close($ch);
?>







