function rendreVisible(elem){
	document.getElementById(elem).style.display='block';
}

function rendreInvisible(elem){
	document.getElementById(elem).style.display='none';
}

function rendreInvisibleTous() {
	$(document).ready(function() {	
		 $("div").each(function( index ) {
			 if($(this).attr('id')!="contenu" && $(this).attr('id')!="messages" && $(this).attr('id')!="header" && $(this).attr('id')!="container-fluid" && $(this).attr('id')!="navbar-header" && $(this).attr('id')!="collapse navbar-collapse" && $(this).attr('id')!="admin" && $(this).attr('id')!="menuAdmin" && $(this).attr('id')!="management")
				$(this).css('display', 'none');		
		});
		//rendreVisible("container-fluid"); rendreVisible("navbar-header"); rendreVisible("collapse navbar-collapse"); 
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

function lister() {
	//a effacaer
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

	
	
}