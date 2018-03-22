//requetes circuits

function enregistrerCircuit(){
	var formCircuit = new FormData(document.getElementById('formEnregCircuit'));
	//alert(formCircuit.get("action"));
	formCircuit.append('action','enregistrerCircuit');
	$.ajax({
		type : 'POST',
		url : 'Administrateur/administrateurControleur.php',
		data : formCircuit,
		dataType : 'json', //text pour le voir en format de string
		//async : false,
		//cache : false,
		contentType : false,
		processData : false,
		success : function (reponse){//alert(reponse);
					administrateurVue(reponse);
		},
		fail : function (err){
		   
		}
	});
}

// mod
function enregistrerEtape(){
	var formEtape = new FormData(document.getElementById('formEnregEtape'));
	formEtape.append('action','enregistrerEtape');
	$.ajax({
		type : 'POST',
		url : 'Administrateur/administrateurControleur.php',
		data : formEtape,
		dataType : 'json', //text pour le voir en format de string
		//async : false,
		//cache : false,
		contentType : false,
		processData : false,
		success : function (reponse){//alert(reponse);
					administrateurVue(reponse);
		},
		fail : function (err){
		   
		}
	});
}

// mod
function enregistrerJour(){
	var formJour = new FormData(document.getElementById('formEnregJour'));
	formJour.append('action','enregistrerEtape');
	$.ajax({
		type : 'POST',
		url : 'Administrateur/administrateurControleur.php',
		data : formJour,
		dataType : 'json', //text pour le voir en format de string
		//async : false,
		//cache : false,
		contentType : false,
		processData : false,
		success : function (reponse){//alert(reponse);
					administrateurVue(reponse);
		},
		fail : function (err){
		   
		}
	});
}

function lister(){
	var formCircuit = new FormData();
	formCircuit.append('action','lister');//alert(formCircuit.get("action"));
	$.ajax({
		type : 'POST',
		url : 'Administrateur/administrateurControleur.php',
		data : formCircuit,
		contentType : false,
		processData : false,
		dataType : 'json', //text pour le voir en format de string
		success : function (reponse){//alert(reponse);
					administrateurVue(reponse);
		},
		fail : function (err){
		}
	});
}

function peuplerProduits() {
	var formCircuit = new FormData();
	formCircuit.append('action','peupler');
	$.ajax({
		type : 'POST',
		url : 'Administrateur/administrateurControleur.php',
		data : formCircuit,
		contentType : false,
		processData : false,
		dataType : 'json', //text pour le voir en format de string
		success : function (reponse){//alert(reponse);
					administrateurVue(reponse);
		},
		fail : function (err){
		}
	});
}

/*
function peuplerCarousel() {
	var formCircuit = new FormData();
	formCircuit.append('action','peuplerCarousel');
	$.ajax({
		type : 'POST',
		url : 'Administrateur/administrateurControleur.php',
		data : formCircuit,
		contentType : false,
		processData : false,
		dataType : 'json', //text pour le voir en format de string
		success : function (reponse){//alert(reponse);
					administrateurVue(reponse);
		},
		fail : function (err){
		}
	});
}
*/

function obtenirFiche(){
	$('#divFiche').hide();
	var leForm=document.getElementById('formFiche');
	var formCircuit = new FormData(leForm);
	formCircuit.append('action','fiche');
	$.ajax({
		type : 'POST',
		url : 'Administrateur/administrateurControleur.php',
		data : formCircuit,
		contentType : false, 
		processData : false,
		dataType : 'json', 
		success : function (reponse){//alert(reponse);
					administrateurVue(reponse);
		},
		fail : function (err){
		}
	});
}

function modifierCircuit(){
	var leForm=document.getElementById('formFicheC');
	var formCircuit = new FormData(leForm);
	formCircuit.append('action','modifier');
	$.ajax({
		type : 'POST',
		url : 'Administrateur/administrateurControleur.php',
		data : formCircuit,
		contentType : false, 
		processData : false,
		dataType : 'json', 
		success : function (reponse){//alert(reponse);
					$('#divFormFicheC').hide();
					administrateurVue(reponse);
		},
		fail : function (err){
		}
	});
}

function modifierEtape(){
	var leForm=document.getElementById('formFicheE');
	var formEtape = new FormData(leForm);
	formEtape.append('action','modifier');
	$.ajax({
		type : 'POST',
		url : 'Administrateur/administrateurControleur.php',
		data : formEtape,
		contentType : false, 
		processData : false,
		dataType : 'json', 
		success : function (reponse){//alert(reponse);
					$('#divFormFicheE').hide();
					administrateurVue(reponse);
		},
		fail : function (err){
		}
	});
}

function modifierJour(){
	var leForm=document.getElementById('formFicheJ');
	var formJour = new FormData(leForm);
	formJour.append('action','modifier');
	$.ajax({
		type : 'POST',
		url : 'Administrateur/administrateurControleur.php',
		data : formJour,
		contentType : false, 
		processData : false,
		dataType : 'json', 
		success : function (reponse){//alert(reponse);
					$('#divFormFicheJ').hide();
					administrateurVue(reponse);
		},
		fail : function (err){
		}
	});
}
