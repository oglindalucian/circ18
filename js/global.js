function rendreVisible(elem){
	document.getElementById(elem).style.display='block';
}

function rendreInvisible(elem){
	document.getElementById(elem).style.display='none';
}

function rendreInvisibleTous() {
	$(document).ready(function() {	
		 $("div").each(function( index ) {
			 if($(this).attr('id')!="contenu" && $(this).attr('id')!="messages"  && $(this).attr('id')!="admin" && $(this).attr('id')!="menuAdmin" && $(this).attr('id')!="management" && $(this).attr('id')!="liste1" && $(this).attr('id')!="liste2")
				$(this).css('display', 'none');		
		});
		//&& $(this).attr('id')!="leheader" && $(this).attr('id')!="container-fluid" && $(this).attr('id')!="navbar-header" && $(this).attr('id')!="collapse navbar-collapse"
	});
}

function rendreVisibleTous() {
	$(document).ready(function() {
		$("div").each(function( index ) {
			 if($(this).attr('id')!="admin")
				$(this).css('display', 'block');		
		});
	});
}



function validerNum(elem){
	var num=document.getElementById(elem).value;
	var numRegExp=new RegExp("^[0-9]{1,4}$");
	if(num!="" && numRegExp.test(num))
		return true;
	return false;
}

function valider(){
	var num=document.getElementById('num').value;
	var titre=document.getElementById('titre').value;
	var duree=document.getElementById('duree').value;
	var res=document.getElementById('res').value;
	var numRegExp=new RegExp("^[0-9]{1,4}$");
	if(num!="" && titre!="" && duree!="" && res!="")
		if(numRegExp.test(num))
			return true;
	return false;
}

function creerElementsListes() {
	var listeMin = document.getElementById("nbPlacesMinimum");
	for(var i=3; i<10; i++) {
		var options = document.createElement("option");
		options.textContent = i;
		options.value = i;
		listeMin.appendChild(options);
	}
	
	var listeMax = document.getElementById("nbPlacesMaximum");
	for(var i=11; i<100; i++) {
		var options = document.createElement("option");
		options.textContent = i;
		options.value = i;
		listeMax.appendChild(options);		
	}

	var listenombreJour = document.getElementById("nombreJour");
	for(var i=1; i<100; i++) {
		var options = document.createElement("option");
		options.textContent = i;
		options.value = i;
		listenombreJour.appendChild(options);		
	}
	
	var nbPlacesMinimumFC = document.getElementById("nbPlacesMinimumFC");
	for(var i=1; i<25; i++) {
		var options = document.createElement("option");
		options.textContent = i;
		options.value = i;
		nbPlacesMinimumFC.appendChild(options);		
	}
	
	var nbPlacesMaximumFC = document.getElementById("nbPlacesMaximumFC");
	for(var i=1; i<25; i++) {
		var options = document.createElement("option");
		options.textContent = i;
		options.value = i;
		nbPlacesMaximumFC.appendChild(options);		
	}
	
	var idUsager = document.getElementById("idUsager");
	for(var i=1; i<250; i++) {
		var options = document.createElement("option");
		options.textContent = i;
		options.value = i;
		idUsager.appendChild(options);		
	}
	
	var idUsagerDes = document.getElementById("idUsagerDes");
	for(var i=1; i<250; i++) {
		var options = document.createElement("option");
		options.textContent = i;
		options.value = i;
		idUsagerDes.appendChild(options);		
	}
	
	var idRabaisDes = document.getElementById("idRabaisDes");
	for(var i=1; i<250; i++) {
		var options = document.createElement("option");
		options.textContent = i;
		options.value = i;
		idRabaisDes.appendChild(options);		
	}
	
	var idCircuitF = document.getElementById("idCircuitF");
	for(var i=1; i<250; i++) {
		var options = document.createElement("option");
		options.textContent = i;
		options.value = i;
		idCircuitF.appendChild(options);		
	}
}