<?php
	require_once("../BD/connexion.inc.php");
	$rep="<caption>LISTE DES CIRCUITS</caption>";
	$rep.="<table border=1>";
	$rep.="<tr><th>NUMÉRO</th><th>NOM DU CIRCUIT</th><th>NOMBRE MINIMUM DE PLACES</th><th>NOMBRE MAXIMUM DE PLACES</th><th>NOMBRE DE PLACES RÉSERVÉES</th><th>DATE DE DÉPART</th><th>DATE DE RETOUR</th><th>PRIX DU CIRCUIT</th><th>GUIDE</th><th>TRANSPORT</th><th>CIRCUIT ACTIF</th><th>IMAGE CIRCUIT</th></tr>";
	$requete="SELECT * FROM circuit";
	try{
		 $stmt = $connexion->prepare($requete);
		 $stmt->execute();
		 while($ligne=$stmt->fetch(PDO::FETCH_OBJ)){
			$rep.="<tr><td>".($ligne->idCircuit)."</td><td>".($ligne->nomCircuit)."</td><td>".($ligne->nbPlacesMinimum)."</td><td>".($ligne->nbPlacesMaximum)."</td><td>".($ligne->nbPlacesReservees)."</td><td>".($ligne->dateDepart)."</td><td>".($ligne->dateArrivee)."</td><td>".($ligne->prixCircuit)."</td><td>".($ligne->guide)."</td><td>".($ligne->transport)."</td><td><img src='../imagesCircuits/".($ligne->photoCircuit)."' width=80 height=80></td></tr>";		 }
	}
	catch (Exception $e){
		echo "Problème pour lister les circuits";
	}
	finally {
		$rep.="</table>";
		unset($connexion);
		unset($stmt);
		echo $rep;
	}
?>
<br>
<br>
<a href="../admin.html">Retour à la page d'accueil</a>