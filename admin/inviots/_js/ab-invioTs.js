/************************************************/
/* standard javascript for lte */
/************************************************/

/*************************************************/
/*************************************************/
/* DOCUMENT READY CR*/
/*************************************************/
/*************************************************/

function documentReadyScriptCR() {


}

/************************************************************/
/************************************************************/
/* DOCUMENT READY PRIMARY DETAIL*/
/************************************************************/
/************************************************************/

function documentReadyScript() {


}

/************************************************/
/************************************************/
/* check fields per pagina dettaglio /*
/************************************************/
/************************************************/
function checkFields() {
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
  //nel campo aggiungere i seguenti attributi:
  //mandatory="RisNum" mandatory-desc="<ab:lang>Importo Pagamento</ab:lang>"
  return Ab.validateFormMandatory($("#lang").val());
  //vecchia versione
  // return Ab.validateForm('descrizione','Descrizione','R');	

}


/************************************************/
/************************************************/
/** REPORT MA FORSE NON SERVE */
/************************************************/
/************************************************/
function reportxxx() {
  //FACCIO IL SUBMIT
  var f = document.main;
  f.flgReport.value = "S";
  //f.action=webApp+"/tr/Pratica.abl";
  f.cmd.value = "search";
  Ab.submitAj('main');
}


/************************************************/
/************************************************/
/* TEMPLATE GESTIONE RIGHE */
/************************************************/
/************************************************/
function addRow() {

  var f = document.main;
  f.action = f.actionPage.value;
  if (Ab.validateForm('id_riga', 'Row', 'R')) {
    f.cmd.value = "addRow";
    f.act.value = "";
    Ab.submitAj('main');
  }
}

function delRow(l_id) {
  if (Ab.confirmDelete()) {
    var f = document.main;
    f.action = f.actionPage.value;
    //	FACCIO IL SUBMIT
    f.cmd.value = "delRow";
    f.act.value = "";
    f.id_riga.value = l_id;
    Ab.submitAj('main');
  }

}

function modRow(l_id) {

  {
    var f = document.main;
    f.action = f.actionPage.value;
    //	FACCIO IL SUBMIT
    f.cmd.value = "modRo";
    f.act.value = "";
    f.id_riga.value = l_id;
    Ab.submitAj('main');
  }

}

function checkBoxes()
/////////////////////////////////////////////
{


}


function checkBoxesCR() {

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
	
		Ab.submitAj('main');
	}
}
/////////////////////////////////////////////////
//////////////////////////////////////////////////
function caricaFileLte()
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
		f.cmd.value="caricaFileLte";
		//far apparire la rotellina
	
		Ab.submitAj('main');
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
	
		Ab.submitAj('main');
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
	
		Ab.submitAj('main');
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
		
		Ab.submitAj('main');
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
	
		Ab.submitAj('main');
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
			
			Ab.submitAj('main');
		}
	}
}
