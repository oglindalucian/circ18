<?php
	require_once("../BD/connexion.inc.php");
	$idCircuit=$_POST['idCircuit'];	
	$requette="SELECT * FROM circuit WHERE idCircuit=?";
	$stmt = $connexion->prepare($requette);
	$stmt->execute(array($idCircuit));
	if(!$ligne=$stmt->fetch(PDO::FETCH_OBJ)){
		echo "Le circuit ".$num." est introuvable";
		unset($connexion);
		unset($stmt);
		exit;
	}
	$pochette=$ligne->pochette;
	if($pochette!="avatar.jpg"){
		$rmPoc='../pochettes/'.$pochette;
		$tabFichiers = glob('../pochettes/*');
		//print_r($tabFichiers);
		// parcourir les fichier
		foreach($tabFichiers as $fichier){
		  if(is_file($fichier) && $fichier==trim($rmPoc)) {
			// enlever le fichier
			unlink($fichier);
			break;
		  }
		}
	}
	$requette="DELETE FROM circuit WHERE idCircuit=?";
	$stmt = $connexion->prepare($requette);
	$stmt->execute(array($idCircuit));
	unset($connexion);
	unset($stmt);
	echo "<br><b>LE CIRCUIT : ".$idCircuit." A ÉTÉ RETIRÉ</b>";
?>
<br><br>
<a href="../admin.html">Retour à la page d'accueil</a>