// pkg_theBean

///////////////////////////////////////////
////////T O O L B A R /////////////////////
///////////////////////////////////////////

function report()
{
		//FACCIO IL SUBMIT
		var f = document.ricerca;
		f.flgReport.value="S";
		//f.action=webApp+"/tr/Pratica.abl";
		f.cmd.value="search";
		Ab.submitAj('main');
}

/////////////////////////////////
// funzione richiamata sul document ready
//in modo da averne uno solo
///////////////////////////////
function documentReadyScript()
{
	//caricaFlagTipoFornitore();
}

/////////////////////////////////
// funzione richiamata sul document ready
//in modo da averne uno solo
///////////////////////////////
function documentReadyScriptCR()
{
	//caricaFlagTipoFornitore();
}


/////////////////////////////////////////////7
function checkFields()
/////////////////////////////////////////////7
{
			//R per required
	//isNum per numerico
	//isNumKey è una chiave.. uguale a isNum>0 ma cambio il messaggio
	//isNum>x per numerico maggiore di x
	//isNum<x per numerico minore di x
	//isEmail per indirizzo email
	//inRange1:10 per ..
	//3 stringhe
	//1: nome del field
	//2: se '' visualizza il nome del field, altrimenti questo campo
	//3: R/N+''/isNum/isEmail/inRangea:b
return true;
//Ab.validateForm('descrizione','Descrizione','R','numero','Numero','RisNum>0','eMail','','NisEmail');
	
}

/////////////////////////////////////////////7
function checkSearchFields()
/////////////////////////////////////////////7
{
	if(document.ricerca.crNS==1)
		return false;
	else
	{
		//return Ab.validateForm('descrizione','Descrizione','R','numero','Numero','RisNum>0','eMail','','NisEmail');
		return true;
	}

	
}


function checkBoxes()
/////////////////////////////////////////////
{
	//Ab.setChekBoxValue("dettaglio","flgSommaCRL","1","0");

}

function checkRadio()
{
	//Ab.setRadioButtonValue("dettaglio","flgPlaAntPos");
}

function checkBoxesCR()
/////////////////////////////////////////////
{
	//Ab.setChekBoxValue("ricerca","flgSommaCRL","1","0");
}

function checkRadioCR()
{
	//Ab.setRadioButtonValue("ricerca","flgPlaAntPos");

}
/////////////////////////////////////////////////
//////////////////////////////////////////////////
function addRow()
/////////////////////////////////////////////
{
       
	var f = document.dettaglio;
	f.action=f.actionPage.value;
	if (Ab.validateForm('id_rowBean','RowBean','R'))
	{
		f.cmd.value="gr";
		f.act.value="addRow";
		Ab.submitAj('main');
	}
}

function delRow(l_id)
/////////////////////////////////////////////
{
 if (confirmDelete())
	{      
		var f = document.dettaglio;
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="gr";
		f.act.value="delRow";
		f.id_rowBean.value=l_id;
		Ab.submitAj('main');
	}

}

function modRow(l_id)
/////////////////////////////////////////////
{

		var f = document.dettaglio;
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="gr";
		f.act.value="modRow";
		f.id_rowBean.value=l_id;
		Ab.submitAj('main');

}


/////////////////////////////////////////////////
//////////////////////////////////////////////////
function caricaFile()
/////////////////////////////////////////////
{
       
	var f = document.main;
	f.action=f.actionPage.value;
	var procedi=true;
	if(f.flgTipoSoggettoTS.value==0)
		procedi=Ab.validateForm('nomeFileDaCaricare','Nome File','R','codiceSsa','Codice Struttura','R');
	else
		procedi=Ab.validateForm('nomeFileDaCaricare','Nome File','R');
	
	if(procedi)
	{
		checkBoxes();
		f.cmd.value="caricafilezip";
		//far apparire la rotellina
		f.submit();
		//Ab.submitAj('main');
	}
}

/////////////////////////////////////////////////
//////////////////////////////////////////////////
function inviaFile()
/////////////////////////////////////////////
{
       
	var f = document.main;
	f.action=f.actionPage.value;
	if (confirm("Verra' inviato il file zip. Vuoi Continuare?"))
	{
		checkBoxes();
		f.cmd.value="inviafilezip";
		f.submit();
		//Ab.submitAj('main');
	}
}

/////////////////////////////////////////////////
//////////////////////////////////////////////////
function richiestaEsito()
/////////////////////////////////////////////
{
       
	var f = document.main;
	f.action=f.actionPage.value;
	if (confirm("Verra' richiesto l'esito dell'invio. Vuoi Continuare?"))
	{
		checkBoxes();
		f.cmd.value="richiestaesito";
		$body.addClass("loading");
		f.submit();
		//Ab.submitAj('main');
	}
}

/////////////////////////////////////////////////
//////////////////////////////////////////////////
function getRicevutaPdf()
/////////////////////////////////////////////
{
       
	var f = document.main;
	f.action=f.actionPage.value;
	if (confirm("Verra' richiesta la ricevuta pdf dell'invio. Vuoi Continuare?"))
	{
		checkBoxes();
		f.cmd.value="getricevutapdf";
		$body.addClass("loading");
		f.submit();
		//Ab.submitAj('main');
	}
}

/////////////////////////////////////////////////
//////////////////////////////////////////////////
function getErroriCsv()
/////////////////////////////////////////////
{
       
	var f = document.main;
	f.action=f.actionPage.value;
	if (confirm("Verra' scaricato il file CSV degli errori. Vuoi Continuare?"))
	{
		checkBoxes();
		f.cmd.value="geterroricsv";
		$body.addClass("loading");
		f.submit();
		//Ab.submitAj('main');
	}
}

/////////////////////////////////////////////////
//////////////////////////////////////////////////
function chiudiPratica()
/////////////////////////////////////////////
{
       
	var f = document.main;
	f.action=f.actionPage.value;
	//alert(f.flgStatoChiusura.value);
	if(f.flgStatoChiusura.value=="")
	{
		alert("Scegli in che stato vuoi chiudere la pratica");
	}
	else
	{
		if (confirm("La pratica verra' chiusa nello stato che hai scelto. Vuoi Continuare?"))
		{
			checkBoxes();
			f.cmd.value="chiudipratica";
			$body.addClass("loading");
			f.submit();
			//Ab.submitAj('main');
		}
	}
}
