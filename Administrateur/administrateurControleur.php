<?php
	require_once("../includes/modele.inc.php");
	$tabRes=array();
	
	function enregistrerCircuit(){
		global $tabRes;	
		$nomCircuit=$_POST['nomCircuit'];
		$nbPlacesMinimum=$_POST['nbPlacesMinimum'];
		$nbPlacesMaximum=$_POST['nbPlacesMaximum'];
		$nbPlacesReservees=$_POST['0'];
		$etat=$_POST['etat'];
		// $etat=0;
		$dateDepart=$_POST['dateDepart'];
		$dateArrivee=$_POST['dateArrivee'];
		$prixCircuit=$_POST['prixCircuit'];
		$guide=$_POST['guide'];
		$transport=$_POST['transport'];
		try{
			$unModele=new circuitModele();
			$photoCircuit=$unModele->verserFichier("imagesCircuit", "photoCircuit", "avatar.jpg",$nomCircuit);
			$requete="INSERT INTO circuit VALUES(0,?,?,?,?,?,?,?,?,?,?,?)";
			$unModele=new circuitModele($requete,array($nomCircuit,$nbPlacesMinimum,$nbPlacesMaximum,$nbPlacesReservees,$etat,$dateDepart,$dateArrivee,$prixCircuit,$guide,$transport,$photoCircuit));
			$stmt=$unModele->executer();
			$tabRes['action']="enregistrerCircuit";
			$tabRes['msg']="Le circuit a bien été enregistré.";
		}
		catch(Exception $e){
		}
		finally{
			unset($unModele);
		}
	}
	
	function lister(){
		global $tabRes;
		$tabRes['action']="lister";
		$requete="SELECT * FROM circuit";
		try{
			 $unModele=new circuitModele($requete,array());
			 $stmt=$unModele->executer();
			 $tabRes['listeCircuits']=array();
			 while($ligne=$stmt->fetch(PDO::FETCH_OBJ)){
			    $tabRes['listeCircuits'][]=$ligne;
			}
		}catch(Exception $e){
		}finally{
			unset($unModele);
		}
	}
	
	
	function fiche(){
		global $tabRes;
		$idCircuit=$_POST['idCircuit'];
		$tabRes['action']="fiche";
		$requete="SELECT * FROM circuit WHERE idCircuit=?";
		try{
			 $unModele=new circuitModele($requete,array($idCircuit));
			 $stmt=$unModele->executer();
			 $tabRes['fiche']=array();
			 if($ligne=$stmt->fetch(PDO::FETCH_OBJ)){
			    $tabRes['fiche']=$ligne;
				$tabRes['OK']=true;
			}
			else{
				$tabRes['OK']=false;
			}
		}
		catch(Exception $e){
		}
		finally{
			unset($unModele);
		}
	}
	
	function modifierCircuit(){
		global $tabRes;	
		$nomCircuit=$_POST['nomCircuit'];
		$nbPlacesMinimum=$_POST['nbPlacesMinimum'];
		$nbPlacesMaximum=$_POST['nbPlacesMaximum'];
		$etat=$_POST['etat'];
		$dateDepart=$_POST['dateDepart'];
		$dateArrivee=$_POST['dateArrivee'];
		$prixCircuit=$_POST['prixCircuit'];
		$guide=$_POST['guide'];
		$transport=$_POST['transport']; 
		try{
			//Recuperer ancienne photo circuit
			$requette="SELECT photoCircuit FROM circuit WHERE idCircuit=?";
			$unModele=new circuitModele($requette,array($idCircuit));
			$stmt=$unModele->executer();
			$ligne=$stmt->fetch(PDO::FETCH_OBJ);
			$anciennePhotoCircuit=$ligne->photoCircuit;
			$photoCircuit=$unModele->verserFichier("imagesCircuits", "photoCircuit",$anciennePhotoCircuit,$nomCircuit);	
			
			$requete="UPDATE circuit SET nomCircuit=?,nbPlacesMinimum=?,nbPlacesMaximum=?,etat=?,dateDepart=?,dateArrivee=?,prixCircuit=?,guide=?,transport=?,photoCircuit=? WHERE idCircuit=?";
			$unModele=new circuitModele($requete,array($nomCircuit,$nbPlacesMinimum,$nbPlacesMaximum,$etat,$dateDepart,$dateArrivee,$prixCircuit,$guide,$transport,$photoCircuit,$idCircuit));
			$stmt=$unModele->executer();
			$tabRes['action']="modifier";
			$tabRes['msg']="Film $idCircuit bien modifie";
		}
		catch(Exception $e){
		}
		finally{
			unset($unModele);
		}
	}
	
	// mod
	function enregistrerEtape(){
		global $tabRes;	
		$nomEtape=$_POST['nomEtape'];
		$id_circuit= null; 
		$nombreJour=$_POST['nombreJour'];
		$dateArrivee=$_POST['dateArrivee'];
		$dateDepart=$_POST['dateDepart'];
		$descriptionEtape=$_POST['descriptionEtape'];
		try{
			$unModele=new circuitModele();
			$photoEtape=$unModele->verserFichier("imagesCircuit", "photoEtape", "avatar.jpg",$nomEtape);
			$requete="INSERT INTO etape VALUES(0,?,?,?,?,?,?,?)";
			$unModele=new circuitModele($requete,array($nomEtape,$nombreJour,$dateArrivee,$dateDepart,$descriptionEtape,$photoEtape));
			$stmt=$unModele->executer();
			$tabRes['action']="enregistrerEtape";
			$tabRes['msg']="L'étape a bien été enregistrée.";
		}
		catch(Exception $e){
		}
		finally{
			unset($unModele);
		}

	}
	
	function modifierEtape(){
		
	}
	
	function enleverEtape(){
		
	}
	
	
	function enregistrerJour(){
		global $tabRes;	
		$nomJour=$_POST['nomJour'];
		$nomVille=$_POST['nomVille'];
		$id_etape= null; 
		$hotel=$_POST['hotel'];
		$urlHotel=$_POST['urlHotel'];
		$restaurant=$_POST['restaurant'];
		$urlRestaurant=$_POST['urlRestaurant'];
		$activite=$_POST['activite'];
		try{
			$unModele=new circuitModele();
			$photoJour=$unModele->verserFichier("imagesCircuit", "photoJour", "avatar.jpg",$nomJour);
			$requete="INSERT INTO etape VALUES(0,?,?,?,?,?,?,?,?)";
			$unModele=new circuitModele($requete,array($nomEtape,$nombreJour,$dateArrivee,$dateDepart,$descriptionEtape,$photoJour));
			$stmt=$unModele->executer();
			$tabRes['action']="enregistrerEtape";
			$tabRes['msg']="Le jour a bien été enregistrée.";
		}
		catch(Exception $e){
		}
		finally{
			unset($unModele);
		}

	}

	function modifierJour(){
		
	}
	
	function enleverJour(){
		
	}

	
	//******************************************************
	//Controleur
	$action=$_POST['action'];
	switch($action){
		case "enregistrerCircuit" :
			enregistrerCircuit();
		break;
		case "enregistrerEtape" :
			enregistrerEtape();
		break;
		case "enregistrerJour" :
			enregistrerJour();
		break;
		case "lister" :
			lister();
		break;
		case "fiche" :
			fiche();
		break;
		case "modifierCircuit" :
			modifierCircuit();
		break;
		case "modifierEtape" :
			modifierEtape();
		break;
		case "modifierJour" :
			modifierJour();
		break;
	}
    echo json_encode($tabRes);
?>