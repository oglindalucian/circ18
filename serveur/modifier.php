<?php
	require_once("../BD/connexion.inc.php");
	$idCircuit=$_POST['idCircuit'];
	$nomCircuit=$_POST['nomCircuit'];
	$nbPlacesMinimum=$_POST['nbPlacesMinimum'];
	$nbPlacesMaximum=$_POST['nbPlacesMaximum'];
	$nbPlacesReservees= null;
	$etat=$_POST['etat'];
	$dateDepart=$_POST['dateDepart'];
	$dateArrivee=$_POST['dateArrivee'];
	$prixCircuit=$_POST['prixCircuit'];
	$guide=$_POST['guide'];
	$transport=$_POST['transport'];
	$dossier="../imagesCircuits/";
	$requette="SELECT photoCircuit FROM circuit WHERE idCircuit=?";
	$stmt = $connexion->prepare($requette);
	$stmt->execute(array($idCircuit));
	$ligne=$stmt->fetch(PDO::FETCH_OBJ);
	$photoCircuit=$ligne->photoCircuit;
	if($_FILES['photoCircuit']['tmp_name']!==""){
		//enlever ancienne photoCircuit
		if($photoCircuit!="avatar.jpg"){
			$rmPoc='../imagesCircuit/'.$photoCircuit;
			$tabFichiers = glob('../imagesCircuit/*');
			//print_r($tabFichiers);
			// parcourir les fichier
			foreach($tabFichiers as $fichier){
			  if(is_file($fichier) && $fichier==trim($rmPoc)) {
				// enlever le fichier
				unlink($fichier);
				break;
				//
			  }
			}
		}
		$nomPochette=sha1($titre.time());
		//Upload de la photo
		$tmp = $_FILES['photoCircuit']['tmp_name'];
		$fichier= $_FILES['photoCircuit']['name'];
		$extension=strrchr($fichier,'.');
		$photoCircuit=$nomPochette.$extension;
		@move_uploaded_file($tmp,$dossier.$nomPochette.$extension);
		// Enlever le fichier temporaire chargé
		@unlink($tmp); //effacer le fichier temporaire
	}
	$requette="UPDATE circuit set nomCircuit=?,nbPlacesMinimum=?,nbPlacesMaximum=?,etat=?,dateDepart=?,dateArrivee=?,prixCircuit=?,guide=?,transport=?,photoCircuit=? WHERE idf=?";
	$stmt = $connexion->prepare($requette);
	$stmt->execute(array($titre,$duree,$res,$pochette,$idf));
	unset($connexion);
	unset($stmt);
	echo "<br><b>LE CIRCUIT : ".$idCircuit." A ÉTÉ MODIFIÉ</b>";
?>
<br><br>
<a href="../admin.html">Retour à la page d'accueil</a>