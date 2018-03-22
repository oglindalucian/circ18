//vue circuits

function listerC(listCircuits){
	var taille;
	var rep="<div class='table-users' style='overflow: scroll; height: 500px;'>";
	rep+="<div class='header'>Liste des circuits<span style='float:right;padding-right:10px;cursor:pointer;' onClick=\"$('#contenu').hide();\">X</span></div>";
	rep+="<table cellspacing='0'>";
	rep+="<tr><th>NUMERO</th><th>TITRE</th><th>NB PLACES MINIMUM</th><th>NB PLACES MAXIMUM</th><th>NB PLACES RÉSERVÉES</th><th>ÉTAT</th><th>DATE DE DÉPART</th><th>DATE DE RETOUR</th><th>PRIX</th><th>GUIDE</th><th>TRANSPORT</th><th>PHOTO CIRCUIT</th></tr>";
	taille=listCircuits.length;
	for(var i=0; i<taille; i++){
		rep+="<tr><td>"+listCircuits[i].IdCircuit+"</td><td>"+listCircuits[i].nomCircuit +"</td><td>"+listCircuits[i].nbPlacesMinimum+"</td><td>"+listCircuits[i].nbrPlacesMaximum +
		"</td><td>"+listCircuits[i].nbPlacesReservees+"</td><td>"+listCircuits[i].etat +"</td><td>"+listCircuits[i].dateDepart +"</td><td>"+listCircuits[i].dateArrivee +"</td><td><img src='imagesCircuits/"+listCircuits[i].photoCircuit+"' width=80 height=80></td>"+
		"<td>"+listCircuits[i].prixCircuit +"</td><td>"+listCircuits[i].guide +"</td><td>"+listCircuits[i].transport + "</td><td>"+listCircuits[i].idRabais + "</td></tr>";		 
	}
	rep+="</table>";
	rep+="</div>";
	$('#contenu').html(rep);
	//$('#contenu').css('display', 'block');	
}

function peuplerC(listCircuits){
	var taille;
	var rep="";
	var rep2="";
	taille=listCircuits.length;
	for(var i=0; i<taille; i++){
		//if(i%2==0) {
			// rep+="<div class='row' style='margin-top:40px;'>";
		// }
		rep+="<div class='col-sm-6 wow fadeInLeft product' data-wow-delay='.8s'>";		
		rep+="<img src='images/"+listCircuits[i].photoCircuit+"' alt='Nos circuits' class='img-responsive' width=1300 height=900>";
		
		rep+=" <div class='product-info'>";
		
		rep+="<div class='col-sm-8'>";
		rep+="<h4>"+listCircuits[i].nomCircuit+"</h4>";
		rep+="<p>"+listCircuits[i].transport+"</p>";
		rep+="</div>";
		
		rep+="<div class='col-sm-4 price'>"+listCircuits[i].prixCircuit+"$</div>"; 
		rep+="<div class='clear'></div>";
		
		rep+="<ul class='product-btns'>";
		rep+=" <li>";
		rep+="<a href='#' class='btn btn-default btn-grey' id='"+i+"'> <i class='fa fa-list'></i> Détails</a>";
		rep+="</li>";
		rep+="<li>";
		rep+="<a href='#' class='btn btn-default btn-red-o' id=100'"+i+"' onClick=''><i class='fa fa-shopping-cart'></i> RÉSERVEZ</a>";
		rep+="</li>";
		rep+="</ul>";
		
		rep+="</div></div>";
		
		// if(i%2==0) {
			// rep+="</div>";
		// }
	}
		
	$('#peuplerProduits').html(rep);
	//------------
	
	
	for(var i=0; i<2; i++){
		if(i===0) {
			rep2+="<div class='item active'>";
		}
		else
			rep2+="<div class='item'>";		
	rep2+="<div class='item'>";
	
    rep2+="<div class='carousel-caption'>";
	
    rep2+="<div class='row'>";	
    rep2+="<div class='col-md-4 col-sm-6'>";	
    rep2+="<div class='block'>";	
    rep2+="<img class='app-img img-responsive' src='images/"+listCircuits[i].photoCircuit+"' alt='Nos circuits' width=1300 height=900>";
    rep2+="</div>";
    rep2+="</div>";	
    rep2+="<div class='col-md-6 col-md-offset-1 col-sm-6'>";	
    rep2+="<div class='block'>";	
    rep2+="<h1>";
    rep2+=listCircuits[i].nomCircuit;                                      
    rep2+="</h1>";
    rep2+="<p>Prix circuit: ";                                    
    rep2+=listCircuits[i].prixCircuit;                                       
    rep2+="</p>";
	rep2+="<p>Transport: ";                                    
    rep2+=listCircuits[i].transport;                                       
    rep2+="</p>"; 
	rep2+="<ul class='download-btn'>";                                    
    rep2+="<li>";                                        
    rep2+="<a href='#' class='btn btn-default btn-grey'> <i class='fa fa-list'></i>Détails</a>";                                            
    rep2+="</li>";                                        
    rep2+="<li>";                                        
    rep2+="<a href='#' class='btn btn-default btn-red'><i class='fa fa-shopping-cart'></i>RÉSERVEZ</a>";                                           
    rep2+="</li>";                                        
    rep2+="</ul>";
	
    rep2+="</div>"; 	
    rep2+="</div>"; 	
    rep2+="</div>";                        
    rep2+="</div>";
	rep2+="</div>"; 	
	}
	$('#infoCarousel').html(rep2); 
	
}

/*
function peuplerCarousel(listCircuits) {
	var taille;
	var rep="";
	taille=listCircuits.length;  
	for(var i=0; i<taille; i++){
		if(i===0) {
			rep+="<div class='item active'>";
		}
		else
			rep+="<div class='item'>";
	rep+="<div class='item'>";
    rep+="<div class='carousel-caption'>";
    rep+="<div class='row'>";
    rep+="<div class='col-md-4 col-sm-6'>";
    rep+="<div class='block'>";
    rep+="<img class='app-img img-responsive' src='images/"+listCircuits[i].photoCircuit+"' alt='Nos circuits' width=1300 height=900>";
    rep+="</div>";
    rep+="</div>";
    rep+="<div class='col-md-6 col-md-offset-1 col-sm-6'>";
    rep+="<div class='block'>";
    rep+="<h1>";
    rep+=listCircuits[i].nomCircuit;                                      
    rep+="</h1>";
    rep+="<p>Prix circuit: ";                                    
    rep+=listCircuits[i].prixCircuit;                                       
    rep+="</p>";
	rep+="<p>Transport: ";                                    
    rep+=listCircuits[i].transport;                                       
    rep+="</p>"; 
	rep+="<ul class='download-btn'>";                                    
    rep+="<li>";                                        
    rep+="<a href='#' class='btn btn-default btn-grey'> <i class='fa fa-list'></i>Détails</a>";                                            
    rep+="</li>";                                        
    rep+="<li>";                                        
    rep+="<a href='#' class='btn btn-default btn-red'><i class='fa fa-shopping-cart'></i>RÉSERVEZ</a>";                                           
    rep+="</li>";                                        
    rep+="</ul>";                                    
    rep+="</div>";                                
    rep+="</div>";                            
    rep+="</div>";                        
    rep+="</div>";                    
    rep+="</div>"; 	
	}
	$('#infoCarousel').html(rep);
}
*/

function afficherFiche(reponse){
	var uneFiche;
	if(reponse.OK){
		uneFiche=reponse.fiche;
		$('#formFicheC h3:first-child').html("Fiche du circuit numéro "+uneFiche.idf);
		$('#idCircuitFC').val(uneFiche.IdCircuit);
		$('#nomCircuitFC').val(uneFiche.nomCircuit);
		$('#nbPlacesMinimumFC').val(uneFiche.nbPlacesMinimum);
		$('#nbPlacesMaximumFC').val(uneFiche.nbPlacesMaximum);
		$('#nbPlacesReserveesFC').val(uneFiche.nbPlacesReservees);
		$('#dateDepartFC').val(uneFiche.dateDepart);
		$('#dateArriveeFC').val(uneFiche.dateArrivee);
		$('#prixCircuitFC').val(uneFiche.prixCircuit);
		$('#guideFC').val(uneFiche.guide);
		$('#transportFC').val(uneFiche.transport);
		$('#etatFC').val(uneFiche.etat);
		$('#divFormFiche').show();
		document.getElementById('divFormFiche').style.display='block';
	}
	else{
		$('#messages').html("Circuit "+$('#idCircuitF').val()+" introuvable");
		setTimeout(function(){ $('#messages').html(""); }, 5000);
	}
}

var administrateurVue=function(reponse){
	var action=reponse.action; 
	switch(action){
		case "enregistrerCircuit" :
		case "enregistrerEtape" :
		case "enregistrerJour" :
		case "enlever" :
		// mod
		case "modifierCircuit" :
			$('#messages').html(reponse.msg);
			setTimeout(function(){ $('#messages').html(""); }, 5000);
		break;
		case "modifierEtape" :
			$('#messages').html(reponse.msg);
			setTimeout(function(){ $('#messages').html(""); }, 5000);
		break;
		case "modifierJour" :
			$('#messages').html(reponse.msg);
			setTimeout(function(){ $('#messages').html(""); }, 5000);
		break;
		case "lister" :
			listerC(reponse.listeCircuits);
		break;
		case "peupler" :
			peuplerC(reponse.listeCircuits);
		break;
		
	/*	case "peuplerCarousel":
			peuplerCarousel(reponse.listeCircuits2);
		break;  */   
		
		case "fiche" :
			afficherFiche(reponse);
		break;
	default: ;		
	}
}
