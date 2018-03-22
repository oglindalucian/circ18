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
		
		
	}
		
	$('#peuplerProduits').html(rep);
	//------------
		
	$(document).ready(function(){  
	   if(!$('.item').hasClass('carousel2') || !$('.item active').hasClass('carousel2')) {
	  for(var i=0 ; i<3 ; i++) {
		 
			$('<div class="item"><img src="images/'+listCircuits[i].photoCircuit+'" width=1400 height=700><div class="carousel-caption"></div>   </div>').appendTo('.carousel-inner');
			$('<li data-target="#carousel-example-generic" data-slide-to="'+i+'"></li>').appendTo('.carousel-indicators')

		  }
		  $('.item').first().addClass('active');
		  $('.carousel-indicators > li').first().addClass('active');
		  $('#carousel-example-generic').carousel();
	  }
	});
	
}


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
