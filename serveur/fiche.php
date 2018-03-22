<script language="javascript" src="../js/global.js"></script>
<link rel="stylesheet" href="../css/administrateur.css" type="text/css" />
<?php
	require_once("../BD/connexion.inc.php");
	
	function envoyerForm($ligne){
		global $idCircuit;
		$rep = "<form id=\"formEnreg\"  enctype=\"multipart/form-data\" action=\"modifier.php\" method=\"POST\" onSubmit=\"return valider();\">\n"; 
		$rep.= "	<h3>Fiche du circuit ".$idCircuit." </h3><br><br>\n"; 
		$rep.= "	<span onClick=\"rendreInvisible('divEnreg')\">X</span><br>\n"; 
		$rep.= "	Numéro:<input type=\"text\" id=\"idCircuit\" name=\"idCircuit\" value='".$ligne->idCircuit."' readonly><br>\n"; 
		$rep.= "	Nom du circuit:<input type=\"text\" id=\"nomCircuit\" name=\"nomCircuit\" value='".$ligne->nomCircuit."'><br>\n"; 
		$rep.= "	Nombre minimum de places:<input type=\"text\" id=\"nbPlacesMinimum\" name=\"nbPlacesMinimum\" value='".$ligne->nbPlacesMinimum."'><br>\n"; 
		$rep.= "	Nombre maximum de places:<input type=\"text\" id=\"nbPlacesMaximum\" name=\"nbPlacesMaximum\" value='".$ligne->nbPlacesMaximum."'><br>\n"; 
		$rep.= "	Nombre maximum de réservées:<input type=\"text\" id=\"nbPlacesReservees\" name=\"nbPlacesReservees\" value='".$ligne->nbPlacesReservees."' readonly><br>\n"; 
		
		$rep.= "	Date de départ:<input type=\"text\" id=\"dateDepart\" name=\"dateDepart\" value='".$ligne->dateDepart."'><br>\n"; 
		$rep.= "	Date de retour:<input type=\"text\" id=\"dateArrivee\" name=\"dateArrivee\" value='".$ligne->dateArrivee."'><br>\n"; 
		$rep.= "	Prix du circuit:<input type=\"text\" id=\"prixCircuit\" name=\"prixCircuit\" value='".$ligne->prixCircuit."'><br>\n"; 
		$rep.= "	Nom du guide:<input type=\"text\" id=\"guide\" name=\"guide\" value='".$ligne->guide."'><br>\n"; 
		$rep.= "	Transport:<input type=\"text\" id=\"transport\" name=\"transport\" value='".$ligne->transport."'><br>\n"; 
		$rep.= "	Circuit actif:<input type=\"checkbox\" id=\"etat\" name=\"etat\" value='".$ligne->etat."'><br>\n"; 
		

		$rep.= "  Image de circuit:<input type=\"file\" id=\"photoCircuit\" name=\"photoCircuit\"><br><br>";
		$rep.= "	<input type=\"submit\" value=\"Envoyer\"><br>\n"; 
		$rep.= "</form>\n";
		return $rep;
	}
	
	//Obtenir le circuit en question
	$idCircuit=$_POST['idCircuit'];
	$requette="SELECT * FROM circuit WHERE idCircuit=?";
	$stmt = $connexion->prepare($requette);
	$stmt->execute(array($idCircuit));
	if(!$ligne=$stmt->fetch(PDO::FETCH_OBJ)){
		echo "Le circuit numéro ".$idCircuit." est introuvable";
		unset($connexion);
		unset($stmt);
		exit;
	}
	unset($connexion);
	unset($stmt);
	echo envoyerForm($ligne);
?>