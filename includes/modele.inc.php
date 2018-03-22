<?php
	require_once("connexion.inc.php");
	

	//CIRCUIT ET NON CIRCUITS
	class circuitModele{
			private $requete;
			private $params;
			private $connexion;
			
		function __construct($requete=null,$params=null){
				$this->requete=$requete;
				$this->params=$params;
		}
			
		function obtenirConnexion(){
			$maConnexion = new Connexion("localhost", "root", "", "h18circuits");
			$maConnexion->connecter();
			return $maConnexion->getConnexion();
		}

		function executer(){
				$this->connexion = $this->obtenirConnexion();
				$stmt = $this->connexion->prepare($this->requete);
				$stmt->execute($this->params);
				$this->deconnecter();
				return $stmt;		
			}
		function deconnecter(){
				unset($this->connexion);
		}
			
		function verserFichier($dossier, $inputNom, $fichierDefaut, $chaine){
			$dossier="../$dossier/";
			$nomImage=sha1($chaine.time());
			$image=$fichierDefaut;
			if($_FILES[$inputNom]['tmp_name']!==""){
				//Upload de la photo
				$tmp = $_FILES[$inputNom]['tmp_name'];
				$fichier= $_FILES[$inputNom]['name'];
				$extension=strrchr($fichier,'.');
				@move_uploaded_file($tmp,$dossier.$nomImage.$extension);
				// Enlever le fichier temporaire charg�
				@unlink($tmp); //effacer le fichier temporaire
				$image=$nomImage.$extension;
			}
			return $image;
		}
		function enleverFichier($dossier,$image){
			if($image!="avatar.jpg"){
				$rmPoc="../$dossier/".$image;
				$tabFichiers = glob("../$dossier/*");
				// parcourir les fichier
				foreach($tabFichiers as $fichier){
				  if(is_file($fichier) && $fichier==trim($rmPoc)) {
					// enlever le fichier
					unlink($fichier);
					break;
				  }
				}
			}
		}
	}//fin de la classe
?>	
