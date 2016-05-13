<?php
//receive the curl request
$json = file_get_contents("php://input");
//store the json in a file in case of fail during insert in DB
$fp = fopen('/var/www/html/cloudberry/data.json', 'w');
fwrite($fp, $json);
fclose($fp);

$obj = json_decode($json);
try {
        $connexion = new PDO("mysql:host=localhost;dbname=spectasonic;charset=utf8","root","root");
}       // Recupère et affiche les erreurs.
catch (Exception $e){
        die("Erreur :". $e -> getMessage());
}
//Parsing json
$sensors = $obj->sensors;
$device_id = $obj->serial_number;

$temperature = $sensors->Temperature;
$humidity = $sensors->Humidity;
$vibration = $sensors->Vibration;
//the SQL request (this actually doesn't work because we have to change a column type in specta_hours table)
/*$sql = "INSERT INTO specta_hours VALUES (TIME,".$temperature.",".$device_id.",TEMPERATURE),(TIME,".$humidity.",".$device_id.",HUMIDITE),(TIME,".$vibration.",".$device_id.",VIBRATION)";
$connexion -> query($sql);*/
?>

