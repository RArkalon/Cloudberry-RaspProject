<!DOCTYPE html>
<html lang="fr">
	<head>
		<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/flot/jquery.flot.js"></script>
		<script type="text/javascript">
			//----fonction
			function unfold(nomdiv)
			{
				var lediv = document.getElementById(nomdiv);
				if(lediv.style.display=="block")
					lediv.style.display="none";
				else
					lediv.style.display="block";
				
			}
		</script>
<?php 
 	try{
		$connexion = new PDO('mysql:host=localhost;dbname=spectasonic;charset=utf8','root','');
	}	// Recupère et affiche les erreurs.
	catch (Exception $e){
		die('Erreur :'. $e -> getMessage());
	}


 

        $query = $connexion->prepare('SELECT * FROM specta_client WHERE specta_client.Last_name = UPPER(:lastname) AND specta_client.Password = PASSWORD(:password)');
        $query->bindValue(':lastname', $_POST['lastname'], PDO::PARAM_STR);
        $query->bindValue(':password', $_POST['password'], PDO::PARAM_STR);
        $query->execute();
        $data = $query->fetch();
        // Accès autorisé
        if (!empty($data)) {
            //$_SESSION['ID'] = $data['ID'];
            
        } else {
            echo "erreur";
            header('Location: login.php');
        }
?> 

		
		<script type="text/javascript">

			$(function() {

				// We use an inline data source in the example, usually data would
				// be fetched from a server

				var data = [],
				totalPoints = 300;

				function getRandomData() {

					if (data.length > 0)
						data = data.slice(1);

					// Do a random walk

					while (data.length < totalPoints) 
					{

						var prev = data.length > 0 ? data[data.length - 1] : 50,
							y = prev + Math.random() * 10 - 5;

						if (y < 0) {
							y = 0;
						} else if (y > 100) {
							y = 100;
						}

						data.push(y);
					}
					if (y>=50)
					{
						$(".care").css("visibility","visible");
					}
					else
					{
						$(".care").css("visibility","hidden");
					}

					// Zip the generated y values with the x values

					var res = [];
					for (var i = 0; i < data.length; ++i) {
						res.push([i, data[i]]);
					}

					return res;
				}

				// Set up the control widget

				var updateInterval = 2;
				/*$("#updateInterval").val(updateInterval).change(function () {
					var v = $(this).val();
					if (v && !isNaN(+v)) {
						updateInterval = +v;
						if (updateInterval < 1) {
							updateInterval = 1;
						} else if (updateInterval > 2000) {
							updateInterval = 2000;
						}
						$(this).val("" + updateInterval);
					}
				});*/

				var plot1 = $.plot("#placeholder1", [ getRandomData() ], {
					series: {
						shadowSize: 0	// Drawing is faster without shadows
					},
					yaxis: {
						min: 0,
						max: 100
					},
					xaxis: {
						show: false
					}
				});
				var plot2 = $.plot("#placeholder2", [ getRandomData() ], {
					series: {
						shadowSize: 0	// Drawing is faster without shadows
					},
					yaxis: {
						min: 0,
						max: 100
					},
					xaxis: {
						show: false
					}
				});
				var plot3 = $.plot("#placeholder3", [ getRandomData() ], {
					series: {
						shadowSize: 0	// Drawing is faster without shadows
					},
					yaxis: {
						min: 0,
						max: 100
					},
					xaxis: {
						show: false
					}
				});
				var plot4 = $.plot("#placeholder4", [ getRandomData() ], {
					series: {
						shadowSize: 0	// Drawing is faster without shadows
					},
					yaxis: {
						min: 0,
						max: 100
					},
					xaxis: {
						show: false
					}
				});
				




				function update() {

					plot1.setData([getRandomData()]);
					plot2.setData([getRandomData()]);
					plot3.setData([getRandomData()]);
					plot4.setData([getRandomData()]);

					


					// Since the axes don't change, we don't need to call plot.setupGrid()

					plot1.draw();
					plot2.draw();
					plot3.draw();
					plot4.draw();
					

					

					setTimeout(update, updateInterval);
				}

				update();

				// Add the Flot version string to the footer

				$("#footer").prepend("Flot " + $.plot.version + " &ndash; ");
			});
		</script>


			<?php
			

				$compteur = 0;
				// Connexion a la base de données.
					//Essaye de se connecter a la bdd en PDO.
				try{
					$connexion = new PDO("mysql:host=localhost;dbname=spectasonic;charset=utf8","root","");
				}	// Recupère et affiche les erreurs.
				catch (Exception $e){
					die("Erreur :". $e -> getMessage());
				}

				$compteur = 0;
				$sql =  "SELECT specta_client.Last_name, specta_device.ID FROM specta_client, specta_device WHERE specta_device.Client_id = 2 AND specta_client.ID = specta_device.Client_id";
				foreach ($connexion -> query($sql)  as  $row)
				{
					$compteur++;
				}
				// Recupèration de données  dans  la  base  de donnée
					//Requete SQL
				$sql = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
				FROM specta_client, specta_device, specta_months 
				WHERE specta_client.ID = specta_device.Client_id 
				AND specta_client.ID = 1 
				AND specta_months.device_id = specta_device.ID
				AND specta_months.type_capteur = "TEMPERATURE"
				ORDER BY specta_months.date';

				$temp ="";

				// Affichage
					// Permet ditérer à travers un jeu de résultats retourné par une requête SELECT exécutée avec succès pour chaque ligne.
				foreach ($connexion -> query($sql)  as  $row){
					//  Mise en forme des  données JSON.
					
					$temp = $temp . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
				}
				$temp = substr($temp,0,-1);// On supprime la derniere ","
				$temp = "[".$temp."]";



				//---------------------------------------------------------
				// Recupèration de données  dans  la  base  de donnée
					//Requete SQL
				$sql = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
				FROM specta_client, specta_device, specta_months 
				WHERE specta_client.ID = specta_device.Client_id 
				AND specta_client.ID = 1 
				AND specta_months.device_id = specta_device.ID
				AND specta_months.type_capteur = "HUMIDITE"
				ORDER BY specta_months.date';

				$humidity ="";

				// Affichage
					// Permet ditérer à travers un jeu de résultats retourné par une requête SELECT exécutée avec succès pour chaque ligne.
				foreach ($connexion -> query($sql)  as  $row){
					//  Mise en forme des  données JSON.
					$humidity = $humidity . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
				}
				$humidity = substr($humidity,0,-1);// On supprime la derniere ","
				$humidity = "[".$humidity."]";



				//---------------------------------------------------------
				// Recupèration de données  dans  la  base  de donnée
					//Requete SQL
				$sql = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
				FROM specta_client, specta_device, specta_months 
				WHERE specta_client.ID = specta_device.Client_id 
				AND specta_client.ID = 1 
				AND specta_months.device_id = specta_device.ID
				AND specta_months.type_capteur = "HALLSENSOR"
				ORDER BY specta_months.date';

				$hall ="";

				// Affichage
					// Permet ditérer à travers un jeu de résultats retourné par une requête SELECT exécutée avec succès pour chaque ligne.
				foreach ($connexion -> query($sql)  as  $row){
					//  Mise en forme des  données JSON.
					
					$hall = $hall . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
				}
				$hall = substr($hall,0,-1);// On supprime la derniere ","
				$hall = "[".$hall."]";

				//---------------------------------------------------------
				// Recupèration de données  dans  la  base  de donnée
					//Requete SQL
				$sql = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
				FROM specta_client, specta_device, specta_months 
				WHERE specta_client.ID = specta_device.Client_id 
				AND specta_client.ID = 1 
				AND specta_months.device_id = specta_device.ID
				AND specta_months.type_capteur = "VIBRATION"
				ORDER BY specta_months.date';

				$VIBR ="";

				// Affichage
					// Permet ditérer à travers un jeu de résultats retourné par une requête SELECT exécutée avec succès pour chaque ligne.
				foreach ($connexion -> query($sql)  as  $row){
					//  Mise en forme des  données JSON.
					
					$VIBR = $VIBR . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
				}
				$VIBR = substr($VIBR,0,-1);// On supprime la derniere ","
				$VIBR = "[".$VIBR."]";





				echo 
				'<script type="text/javascript">

						$(document).ready(function(){
							
							var plot1 = $.plot("#placeholder9",[';echo $temp; echo ']);
							
							var plot2 = $.plot("#placeholder10",[';echo $hall; echo ']);
							var plot3 = $.plot("#placeholder11",[';echo $humidity; echo ']);
							var plot4 = $.plot("#placeholder12",[';echo $VIBR; echo ']);
						});
					function updateDevice()
						{'; 
						// Recupèration de données  dans  la  base  de donnée
						//Requete SQL
						$sql = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
						FROM specta_client, specta_device, specta_months 
						WHERE specta_client.ID = specta_device.Client_id 
						AND specta_client.ID = 1 
						AND specta_months.device_id = specta_device.ID
						AND specta_months.type_capteur = "TEMPERATURE"
						ORDER BY specta_months.date';

						$temp ="";

						// Affichage
							// Permet ditérer à travers un jeu de résultats retourné par une requête SELECT exécutée avec succès pour chaque ligne.
						foreach ($connexion -> query($sql)  as  $row){
							//  Mise en forme des  données JSON.
							
							$temp = $temp . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
						}
						$temp = substr($temp,0,-1);// On supprime la derniere ","
						$temp = "[".$temp."]";



						//---------------------------------------------------------
						// Recupèration de données  dans  la  base  de donnée
							//Requete SQL
						$sql = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
						FROM specta_client, specta_device, specta_months 
						WHERE specta_client.ID = specta_device.Client_id 
						AND specta_client.ID = 1 
						AND specta_months.device_id = specta_device.ID
						AND specta_months.type_capteur = "HUMIDITE"
						ORDER BY specta_months.date';

						$humidity ="";

						// Affichage
							// Permet ditérer à travers un jeu de résultats retourné par une requête SELECT exécutée avec succès pour chaque ligne.
						foreach ($connexion -> query($sql)  as  $row){
							//  Mise en forme des  données JSON.
							
							$humidity = $humidity . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
						}
						$humidity = substr($humidity,0,-1);// On supprime la derniere ","
						$humidity = "[".$humidity."]";



						//---------------------------------------------------------
						// Recupèration de données  dans  la  base  de donnée
							//Requete SQL
						$sql = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
						FROM specta_client, specta_device, specta_months 
						WHERE specta_client.ID = specta_device.Client_id 
						AND specta_client.ID = 1 
						AND specta_months.device_id = specta_device.ID
						AND specta_months.type_capteur = "HALLSENSOR"
						ORDER BY specta_months.date';

						$hall ="";

						// Affichage
							// Permet ditérer à travers un jeu de résultats retourné par une requête SELECT exécutée avec succès pour chaque ligne.
						foreach ($connexion -> query($sql)  as  $row){
							//  Mise en forme des  données JSON.
							
							$hall = $hall . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
						}
						$hall = substr($hall,0,-1);// On supprime la derniere ","
						$hall = "[".$hall."]";

						//---------------------------------------------------------
						// Recupèration de données  dans  la  base  de donnée
							//Requete SQL
						$sql = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
						FROM specta_client, specta_device, specta_months 
						WHERE specta_client.ID = specta_device.Client_id 
						AND specta_client.ID = 1 
						AND specta_months.device_id = specta_device.ID
						AND specta_months.type_capteur = "VIBRATION"
						ORDER BY specta_months.date';

						$VIBR ="";

						// Affichage
							// Permet ditérer à travers un jeu de résultats retourné par une requête SELECT exécutée avec succès pour chaque ligne.
						foreach ($connexion -> query($sql)  as  $row){
							//  Mise en forme des  données JSON.
							
							$VIBR = $VIBR . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
						}
						$VIBR = substr($VIBR,0,-1);// On supprime la derniere ","
						$VIBR = "[".$VIBR."]";
						echo 'select = document.getElementById("select");
							choice = select.selectedIndex  // Récupération de lindex du <option> choisi


								if(choice==0)
								{
									$.plot("#placeholder9",[';echo $temp; echo ']);
									$.plot("#placeholder10",[';echo $hall; echo ']);
									$.plot("#placeholder11",[';echo $humidity; echo ']);
									$.plot("#placeholder12",[';echo $VIBR; echo ']);

								}';
						$i = 1;

						while($i <= $compteur)
						{

							$VIBR_months ="";
							$hall_months="";
							$temp_months="";
							$humidity_months ="";
							
							$tabdevice = array();
							$sql1='SELECT specta_device.ID
							FROM specta_client, specta_device 
							WHERE specta_client.Last_name = upper("ode")
							AND specta_client.Password = PASSWORD("loickode")
							AND specta_device.Client_id = specta_client.ID';

							foreach ($connexion -> query($sql1)  as  $row){
								//  Mise en forme des  données JSON.
								array_push($tabdevice,$row['ID']);
								
								
							}

							echo 'else if(choice=='.$i.')';
							echo '{';

								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
									FROM specta_client, specta_device, specta_months 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND specta_months.device_id = specta_device.ID
									AND specta_months.type_capteur = "TEMPERATURE"
									ORDER BY specta_months.date';
								
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$temp_months = $temp_months . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";

									}
									$temp_months = substr($temp_months,0,-1);// On supprime la derniere ","
									$temp_months = "[".$temp_months."]";
								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
									FROM specta_client, specta_device, specta_months 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND specta_months.device_id = specta_device.ID
									AND specta_months.type_capteur = "VIBRATION"
									ORDER BY specta_months.date';
									
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$VIBR_months = $VIBR_months . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
									}
									$VIBR_months = substr($VIBR_months,0,-1);// On supprime la derniere ","
									$VIBR_months = "[".$VIBR_months."]";
								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
									FROM specta_client, specta_device, specta_months 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND specta_months.device_id = specta_device.ID
									AND specta_months.type_capteur = "HALLSENSOR"
									ORDER BY specta_months.date';
									
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$hall_months= $hall_months. "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
									}
									$hall_months = substr($hall_months,0,-1);// On supprime la derniere ","
									$hall_months = "[".$hall_months."]";
								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_months.device_id, specta_months.value, specta_months.date, specta_months.type_capteur 
									FROM specta_client, specta_device, specta_months 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND specta_months.device_id = specta_device.ID
									AND specta_months.type_capteur = "HUMIDITE"
									ORDER BY specta_months.date';
									
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$humidity_months= $humidity_months."[".mb_strimwidth($row['date'],8,2).",".$row['value']."],";
									}
									$humidity_months = substr($humidity_months,0,-1);// On supprime la derniere ","
									$humidity_months = "[".$humidity_months."]";

									//-------------------------------------------
									$temp_days ="";
									$hall_days = "";
									$humidity_days = "";
									$VIBR_days ="";
									$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_days.device_id, specta_days.value, specta_days.heure, specta_days.type_capteur 
									FROM specta_client, specta_device, specta_days 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND specta_days.device_id = specta_device.ID
									AND specta_days.type_capteur = "TEMPERATURE"
									ORDER BY specta_days.heure';
								
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$temp_days = $temp_days . "[" . mb_strimwidth($row['heure'],8,2). "," . $row['value']. "],";

									}
									$temp_days = substr($temp_days,0,-1);// On supprime la derniere ","
									$temp_days = "[".$temp_days."]";
								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_days.device_id, specta_days.value, specta_days.heure, specta_days.type_capteur 
									FROM specta_client, specta_device, specta_days 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND specta_days.device_id = specta_device.ID
									AND specta_days.type_capteur = "VIBRATION"
									ORDER BY specta_days.heure';
									
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$VIBR_days = $VIBR_days . "[" . mb_strimwidth($row['heure'],8,2). "," . $row['value']. "],";
									}
									$VIBR_days = substr($VIBR_days,0,-1);// On supprime la derniere ","
									$VIBR_days = "[".$VIBR_days."]";
								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_days.device_id, specta_days.value, specta_days.heure, specta_days.type_capteur 
									FROM specta_client, specta_device, specta_days 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND specta_days.device_id = specta_device.ID
									AND specta_days.type_capteur = "HALLSENSOR"
									ORDER BY specta_days.heure';
									
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$hall_days= $hall_days. "[" . mb_strimwidth($row['heure'],8,2). "," . $row['value']. "],";
									}
									$hall_days = substr($hall_days,0,-1);// On supprime la derniere ","
									$hall_days = "[".$hall_days."]";
								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, specta_days.device_id, specta_days.value, specta_days.heure, specta_days.type_capteur 
									FROM specta_client, specta_device, specta_days 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND specta_days.device_id = specta_device.ID
									AND specta_days.type_capteur = "HUMIDITE"
									ORDER BY specta_days.heure';
									
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$humidity_days= $humidity_days."[".mb_strimwidth($row['heure'],8,2).",".$row['value']."],";
									}
									$humidity_days = substr($humidity_days,0,-1);// On supprime la derniere ","
									$humidity_days = "[".$humidity_days."]";


									//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
								$VIBR_years ="";
								$hall_years="";
								$temp_years="";
								$humidity_years ="";
								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, spect_years.device_id, spect_years.value, spect_years.date, spect_years.type_capture 
									FROM specta_client, specta_device, spect_years 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND spect_years.device_id = specta_device.ID
									AND spect_years.type_capture = "TEMPERATURE"
									ORDER BY spect_years.date';
								
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$temp_years = $temp_years . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
									}
									$temp_years = substr($temp_years,0,-1);// On supprime la derniere ","
									$temp_years = "[".$temp_years."]";
								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, spect_years.device_id, spect_years.value, spect_years.date, spect_years.type_capture 
									FROM specta_client, specta_device, spect_years 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND spect_years.device_id = specta_device.ID
									AND spect_years.type_capture = "VIBRATION"
									ORDER BY spect_years.date';
									
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$VIBR_years = $VIBR_years . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
									}
									$VIBR_years = substr($VIBR_years,0,-1);// On supprime la derniere ","
									$VIBR_years = "[".$VIBR_years."]";
								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, spect_years.device_id, spect_years.value, spect_years.date, spect_years.type_capture 
									FROM specta_client, specta_device, spect_years 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND spect_years.device_id = specta_device.ID
									AND spect_years.type_capture = "HALLSENSOR"
									ORDER BY spect_years.date';
									
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$hall_years= $hall_years . "[" . mb_strimwidth($row['date'],8,2). "," . $row['value']. "],";
									}
									$hall_years = substr($hall_years,0,-1);// On supprime la derniere ","
									$hall_years = "[".$hall_years."]";
								$sql1 = 'SELECT specta_client.ID, specta_device.ID,specta_device.Client_id, spect_years.device_id, spect_years.value, spect_years.date, spect_years.type_capture 
									FROM specta_client, specta_device, spect_years 
									WHERE specta_client.ID = specta_device.Client_id
									AND specta_device.ID ='.$tabdevice[$i-1].'
									AND specta_client.Last_name = upper("ode") 
									AND specta_client.Password = PASSWORD("loickode")
									AND spect_years.device_id = specta_device.ID
									AND spect_years.type_capture = "HUMIDITE"
									ORDER BY spect_years.date';								
								foreach ($connexion -> query($sql1)  as  $row){
									//  Mise en forme des  données JSON.
										$humidity_years= $humidity_years."[".mb_strimwidth($row['date'],8,2).",".$row['value']."],";
									}
									$humidity_years = substr($humidity_years,0,-1);// On supprime la derniere ","
									$humidity_years = "[".$humidity_years."]";
							 $i +=1;


								echo '
									$.plot("#placeholder9",[';echo $temp_months; echo ']);
									$.plot("#placeholder10",[';echo $hall_months; echo ']);
									$.plot("#placeholder11",[';echo $humidity_months; echo ']);
									$.plot("#placeholder12",[';echo $VIBR_months; echo ']);

									$.plot("#placeholder13",[';echo $temp_years; echo ']);
									$.plot("#placeholder14",[';echo $hall_years; echo ']);
									$.plot("#placeholder15",[';echo $humidity_years; echo ']);
									$.plot("#placeholder16",[';echo $VIBR_years; echo ']);
								
									$.plot("#placeholder5",[';echo $temp_days; echo ']);
									$.plot("#placeholder6",[';echo $hall_days; echo ']);
									$.plot("#placeholder7",[';echo $humidity_days; echo ']);
									$.plot("#placeholder8",[';echo $VIBR_days; echo ']);}';

						}
							echo 'else{
								$.plot("#placeholder9",[';echo $temp_months; echo ']);
								$.plot("#placeholder10",[';echo $hall_months; echo ']);
								$.plot("#placeholder11",[';echo $humidity_months; echo ']);
								$.plot("#placeholder12",[';echo $VIBR_months; echo ']);


								$.plot("#placeholder5",[';echo $temp_days; echo ']);
								$.plot("#placeholder6",[';echo $hall_days; echo ']);
								$.plot("#placeholder7",[';echo $humidity_days; echo ']);
								$.plot("#placeholder8",[';echo $VIBR_days; echo ']);';
							
							

							echo '}
						}
					
				</script>';
			?>


		
		<meta charset="utf-8">
		<title> Projet Transversal </title>
		<!-- Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<nav class="navbar navbar-default">
		  	<div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      	<a class="navbar-brand" href="#">Spectasonic</a>
			   	</div>

	
		    	
		  	</div><!-- /.container-fluid -->
		</nav>

		<div class="all">
			<div class="container-fluid">
				<div  class="row" > 
					<div  class= "clearfix col-sm-6 col-xs-6" >
						<button type="button" class="btn btn-default btn-lg">
		  					</span> ON/OFF
						</button> 	
					</div> 
					<div  class= "clearfix col-sm-6 col-xs-6" >
					<!-- Split button -->
					<!-- Single button -->
					<?php
						$sql =  "SELECT specta_client.Last_name, specta_device.ID FROM specta_client, specta_device WHERE specta_device.Client_id = 2 AND specta_client.ID = specta_device.Client_id";
						
						$compteur = 0;
				            echo'<select class="form-control" id="select" onChange="updateDevice()" name="size">';								
								echo'<option value="">Choose a device</option>';
									foreach ($connexion -> query($sql)  as  $row)
									{
										echo'<option id='.$compteur.'value="'. $compteur . '" onChange="updateDevice()">'  .'device '.$compteur. '</option>';
										$compteur++;
									}
				            echo'</select>';
					?>
					</div> 
				</div> 
			</div> 
			
			<ul class="nav nav-tabs">
			  	<li class="active"><a data-toggle="tab" href="#home">	Real Time</a></li>
			  	<li><a data-toggle="tab" href="#menu1">Day</a></li>
			  	<li><a data-toggle="tab" href="#menu2">Month</a></li>
			  	<li><a data-toggle="tab" href="#menu2">Year</a></li>
			</ul>

			<div class="tab-content">
			  	<div id="home" class="tab-pane fade in active">
					<button  class="btn btn-default dropdown-toggle dropdownMenu"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic10')">Temperature ( °C )</button>
					<div class="graphic" id="graphic10"  style="display: none;">
						<div  id="placeholder1" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
						<div class="care"><strong>The temperature is too high</strong></div>
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The temperature value must not exceed XX ° C</p>
						</div>
					</div>


					<button  class="btn btn-default dropdown-toggle dropdownMenu"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic11')">Hall sensor ( Hz )</button>
					<div class="graphic" id="graphic11"   style="display: none;">
						<div  id="placeholder2" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
						<div class="care"><strong>The magnetism is too high!!</strong></div>
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The magnetism value must not exceed XX ° C</p>
						</div>
					</div>


					<button  class="btn btn-default dropdown-toggle dropdownMenu"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic12')"> Humidity ( g/m³ )</button>
					<div class="graphic" id="graphic12"   style="display: none;">
						<div  id="placeholder3" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
						<div class="care">The Humidity is too high!!</div>
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The humidity value must not exceed XX ° C</p>
						</div>
					</div>

					<button  class="btn btn-default dropdown-toggle dropdownMenu"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic13')">Vibrations ( Hz )</button>
					<div class="graphic" id="graphic13"   style="display: none;">
						<div  id="placeholder4" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
						<div class="care">Vibrations are too high!!</div>
						<div class="note">
							<p><strong>Note!<br></strong>Warning! Vibrations value must not exceed XX ° C</p>
						</div>
					</div>
			  	</div>
			  	<div id="menu1" class="tab-pane fade">
					<button  class="btn btn-default dropdown-toggle dropdownMenu"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic20')"> Temperature ( °C )</button>
					<div class="graphic" id="graphic20"  style="display: none;">
						<div  id="placeholder5" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
					
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The temperature value must not exceed XX ° C</p>
						</div>

					</div>


					<button  class="btn btn-default dropdown-toggle dropdownMenu"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic21')"> Hall sensor (Hz)</button>
					<div class="graphic" id="graphic21"   style="display: none;">
						<div  id="placeholder6" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
			
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The magnetism value must not exceed XX ° C</p>
						</div>

					</div>


					<button  class="btn btn-default dropdown-toggle dropdownMenu"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic22')">Humidity ( g/m³ )</button>
					<div class="graphic" id="graphic22"   style="display: none;">
						<div  id="placeholder7" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
		
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The humidity value must not exceed XX ° C</p>
						</div>

					</div>

					<button  class="btn btn-default dropdown-toggle dropdownMenu"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic23')">Vibrations ( Hz )</button>
					<div class="graphic" id="graphic23"   style="display: none;">
						<div  id="placeholder8" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
	
						<div class="note">
							<p><strong>Note!<br></strong>Warning! Vibrations value must not exceed XX ° C</p>
						</div>

					</div>
			  	</div>
		  		<div id="menu2" class="tab-pane fade">
					<button  class="btn btn-default dropdown-toggle dropdownMenu"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic30')">Temperature ( °C )</button>
					<div class="graphic" id="graphic30"  style="display: none;">
						<div  id="placeholder9" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
					
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The temperature value must not exceed XX ° C</p>
						</div>

					</div>


					<button  class="btn btn-default dropdown-toggle dropdownMenu"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic31')">Hall sensor ( Hz )</button>
					<div class="graphic" id="graphic31"   style="display: none;">
						<div  id="placeholder10" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
			
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The magnetism value must not exceed XX ° C</p>
						</div>
					</div>


					<button  class="btn btn-default dropdown-toggle dropdownMenu"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic32')"> Humidity ( 	
					g/m³ )</button>
					<div class="graphic" id="graphic32"   style="display: none;">
						<div  id="placeholder11" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
		
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The humidity value must not exceed XX ° C</p>
						</div>

					</div>

					<button  class="btn btn-default dropdown-toggle dropdownMenu"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic33')">Vibrations ( Hz )</button>
					<div class="graphic" id="graphic33"   style="display: none;">
						<div  id="placeholder12" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
	
						<div class="note">
							<p><strong>Note!<br></strong>Warning! Vibrations value must not exceed XX ° C</p>
						</div>
					</div>
		  		</div>
		  		<div id="menu3" class="tab-pane fade">
					<button  class="btn btn-default dropdown-toggle dropdownMenu"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic30')">Temperature ( °C )</button>
					<div class="graphic" id="graphic30"  style="display: none;">
						<div  id="placeholder13" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
					
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The temperature value must not exceed XX ° C</p>
						</div>

					</div>


					<button  class="btn btn-default dropdown-toggle dropdownMenu"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic31')">Hall sensor ( Hz )</button>
					<div class="graphic" id="graphic31"   style="display: none;">
						<div  id="placeholder14" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
			
						<div class="note">
							<p><strong>Note!<br></strong>Warning! The magnetism value must not exceed XX ° C</p>
						</div>

					</div>


					<button  class="btn btn-default dropdown-toggle dropdownMenu"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic32')"> Humidity ( 	
					g/m³ )</button>
					<div class="graphic" id="graphic32"   style="display: none;">
						<div  id="placeholder15" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
		

					</div>

					<button  class="btn btn-default dropdown-toggle dropdownMenu"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" type="button" value="clique" onClick="unfold('graphic33')">Vibrations ( Hz )</button>
					<div class="graphic" id="graphic33"   style="display: none;">
						<div  id="placeholder16" style="width:700px;height:400px"></div>
						<div class="row">
							<br>
							<p class="col-sm-6 col-xs-6">Last Value :<?php echo "<br>Value in DB"; ?></p> 

							<p class="col-sm-6 col-xs-6">Average : <?php echo "<br>Value in DB"; ?></p>
							
						</div>
	
						<div class="note">
							<p><strong>Note!<br></strong>Warning! Vibrations value must not exceed XX ° C</p>
						</div>

					</div>
		  		</div>
			</div>

			<div class="spacer"></div>
			<footer class="footer">
				<div class="container">

				</div>
			</footer>
		</div>
	</body>
</html>