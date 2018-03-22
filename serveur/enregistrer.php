<?php
	require_once("../BD/connexion.inc.php");
	$nomCircuit=$_POST['nomCircuit'];
	$nbPlacesMinimum=$_POST['nbPlacesMinimum'];
	$nbPlacesMaximum=$_POST['nbPlacesMaximum'];
	$nbPlacesReservees=null;
	$etat=$_POST['etat'];
	$dateDepart=$_POST['dateDepart'];
	$dateArrivee=$_POST['dateArrivee'];
	$prixCircuit=$_POST['prixCircuit'];
	$guide=$_POST['guide'];
	$transport=$_POST['transport'];
	$dossier="../imagesCircuits/";
	$photoCircuit=sha1($nomCircuit.time());
	$pochette="avatar.jpg";
	if($_FILES['pochette']['tmp_name']!==""){
		//Upload de la photo
		$tmp = $_FILES['pochette']['tmp_name'];
		$fichier= $_FILES['pochette']['name'];
		$extension=strrchr($fichier,'.');
		@move_uploaded_file($tmp,$dossier.$photoCircuit.$extension);
		// Enlever le fichier temporaire chargé
		@unlink($tmp); //effacer le fichier temporaire
		$pochette=$photoCircuit.$extension;
	}
	$requete="INSERT INTO circuit VALUES(0,?,?,?,?,?,?,?,?,?,?,?)";
	$stmt = $connexion->prepare($requete);
	$stmt->execute(array($nomCircuit,$nbPlacesMinimum,$nbPlacesMaximum,$nbPlacesReservees,$etat,$dateDepart,$dateArrivee,$photoCircuit,$prixCircuit,$guide,$transport));
	echo "Le circuit ". $connexion->lastInsertId()." a bien été enregistré";
	unset($connexion);
	unset($stmt);
?>
<br><br>
<a href="../admin.html">Retour à la page d'accueil</a>