<!DOCTYPE html>
<html><!-- InstanceBegin template="/Templates/3bean.dwt" codeOutsideHTMLIsLocked="false" -->
<%@ taglib uri="/WEB-INF/ablia.tld" prefix="ab" %> 
<%@ page language="java" import="com.ablia.jsp.*" %>
<!-- InstanceBeginEditable name="taglib" -->
<!-- InstanceEndEditable -->
<head><jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request" ></jsp:useBean>
<jsp:useBean id="encType" class="java.lang.String" type="java.lang.String" scope="request" ></jsp:useBean>
<jsp:useBean id="grantMsg" class="java.lang.String" type="java.lang.String" scope="request" ></jsp:useBean>
<jsp:useBean id="nf" scope="request" type="java.text.NumberFormat" ></jsp:useBean><jsp:useBean id="readonly" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="df" class="com.ablia.util.SimpleDateFormat" scope="request" type="com.ablia.util.SimpleDateFormat" ></jsp:useBean>
<!-- InstanceBeginEditable name="title" -->
<title>::invio Tessera Sanitaria 0.0</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="Ablia S.r.l." />
<meta name="Keywords" content="" />
<meta name="author" content="Designed by AgenziaVerde- http://www.agenziaverde.it" />
<link rel="shortcut icon" href=".../admin/_logo/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../_V3/_css/reset.css" media="screen" />
<ab:custom_css><link rel="stylesheet" type="text/css" href="../_V3/_css/colors/green/text.css" media="screen" /></ab:custom_css>
<ab:custom_css><link rel="stylesheet" type="text/css" href="../_V3/_css/colors/green/content.css" media="screen" /></ab:custom_css>
<ab:custom_css><link rel="stylesheet" type="text/css" href="../_V3/_css/colors/green/layout_content.css" media="screen" /></ab:custom_css>
<!-- InstanceBeginEditable name="css" -->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head><jsp:include page="../_V3/_inc/_allJs2.jsp" flush="true" />
<body><!-- #BeginEditable "Script" --> 
<script language="JavaScript" src="_js/ab-invioTs.js"></script> 
<span class="td-colored">
<script language="JavaScript" src="../_V3/_lib/jscolor/jscolor.js"></script>
</span>
<script language="JavaScript" src="../_V3/_js/ab-addImg.js"></script> 
<!-- #EndEditable -->
<jsp:useBean id="utenteLogon" type="com.ablia.common.UsersI" class="com.ablia.common.Users" scope="session" >
</jsp:useBean>
<!-- InstanceBeginEditable name="Bean" -->
<jsp:useBean id="bean" class="com.ablia.ts.InvioTs" type="com.ablia.ts.InvioTs" scope="request" >
</jsp:useBean>
<jsp:useBean id="list" scope="request" class="com.ablia.util.Vectumerator" type="com.ablia.util.Vectumerator">
</jsp:useBean>
<!-- InstanceEndEditable --><div id="togglePlaceholder" style="width:30px;float:left;margin-left:3px"></div>
<ab:if_logon_ok trueifnotsecure="true">
  <form method="post" action="" name="main" id="main" <%=encType%>  onSubmit="if(checkFields()) formSaveCommand();else return false;">
    <jsp:include page="../_V3/_inc/_formMainFields.jsp" flush="true" /><input name="pageType" type="hidden" id="pageType" value="D"><input name="currentTab" type="hidden" id="currentTab" value="<%= bean.getCurrentTab() %>">
<input name="currentFocus" type="hidden" id="currentFocus" value="<%= bean.getCurrentFocus() %>"><input name="lastUpdTmst" id="lastUpdTmst" type="hidden" value="<%= bean.getLastUpdTmstString() %>"><div class="path" > <!-- path logico della pagina -->
      <p><a href="javascript:menu();">Menu</a><!-- InstanceBeginEditable name="navbar" --><a href="javascript:Ab.callAbl('/admin/config/Blacklist',null,null,'back')"> &raquo;</a><a href="javascript:Ab.callAbl('/admin/inviots/InvioTs',null,null,'back')">Elenco Invii Tessera Sanitaria</a> <a href="javascript:Ab.callAbl('/admin/config/Blacklist',null,null,'back')"> &raquo;</a> Modifica Record<!-- InstanceEndEditable -->
      <h1 style="float:right"><!-- InstanceBeginEditable name="pageTitle" -->Invio Tessera Sanitaria
          <input name="pageTitle" type="hidden" id="pageTitle" value="::Parametri 2.0">
      <!-- InstanceEndEditable -->&nbsp;<a href="javascript:help();"><img src="../_V3/_img/icone/userbar/ico_help.png" alt="Help" title="Help" width="32" height="27" class="noborder"></a></h1></p><div class="beanLastUpd"><jsp:include page="../_V3/_inc/beanLastUpd.jsp" flush="true"  /></div>
    </div>
    <div id="inside" class="body"> <div class="toolbar"><!-- InstanceBeginEditable name="toolbar" -->
      <div class="user_menu"><a href="javascript:newCommandPD();"><img src="../_V3/_img/icone/32/new_doc_32.png" class="noborder" alt="Nuovo Record" title="Nuovo Record"></a> <a href="javascript:saveCommand();"><img src="../_V3/_img/icone/32/save_32.png" alt="Salva Record" title="Salva Record"></a> <a href="javascript:printCommand()"><img src="../_V3/_img/icone/32/print_32.png" alt="Stampa" title="Stampa"></a> <ab:if wherecondition="<%=utenteLogon.getId_users()==1%>"> <a href="javascript:deleteCommand();"><img src="../_V3/_img/icone/32/delete_32.png" alt="Cancella Record" title="Cancella Record"></a></ab:if></div>
      <!-- InstanceEndEditable --><div id="messaggi" class="msg"><jsp:include page="../_V3/_inc/beanMsg.jsp" flush="true"  /> <!-- InstanceBeginEditable name="msg" -->
	  <!-- InstanceEndEditable --></div> 
      </div>
      <!-- InstanceBeginEditable name="body" --><input type="hidden" name="actionPage" id="actionPage" value="InvioTs.abl"><input type="hidden" name="id_invioTs" id="id_invioTs" value="<%=bean.getId_invioTs()%>"><input name="flgTipoSoggettoTS" type="hidden" id="flgTipoSoggettoTS" value="<%=bean.getFlgTipoSoggettoTS()%>">
    <table cellspacing="0" cellpadding="0" width="100%">
           <ab:if wherecondition="<%=bean.getNomeFileZip().isEmpty()%>">   <tr>
                <td colspan="2" class="td-colored"   >Carica file da inviare: 
                  <br>               
                  <input name="nomeFile" type="file" id="nomeFile" size="40" maxlength="200">
                  <br>
                </td>
                <td colspan="3" class="td-colored"   >  <ab:if wherecondition="<%=bean.getFlgTipoSoggettoTS()==0%>">  CODICE STRUTTURA:<br>
                  <select name="codiceSsa" class="mandatoryField" id="codiceSsa"  >
                  <ab:optionvec  boundcolumn="codice" desccolumn="codice" vectumerator="listaCodiceSsa" value="<%=bean.getCodiceSsa()%>"> &nbsp;&nbsp;&nbsp;</ab:optionvec>
                </select></ab:if>&nbsp;</td>
                <td width="223" class="td-colored"   >Descrizione Invio:<br>
                <textarea  name="descrizioneInvio" cols="60" rows="8" id="descrizioneInvio"><%= bean.getDescrizioneInvio() %></textarea></td>
                <td width="235" class="td-colored"   ><a href="javascript:caricaFile();"><img src="../_V3/_img/Icons/48x48/shadow/add2.gif" alt="carica file" height="48" title="Carica file zip" border="0"></a></td>
              </tr>
           </ab:if>
              <ab:else>
              <tr>
                <td colspan="2" valign="top" class="td-colored"   >Descrizione Invio:<br><textarea  name="descrizioneInvio" cols="60" rows="8" id="descrizioneInvio"><%= bean.getDescrizioneInvio() %></textarea></td>
                <td colspan="3" rowspan="2" align="center" valign="middle" class="td-colored"   >  
                 <table width="309" border="1">
                  <tbody>
                    <tr>
						<td colspan="2" align="center" class="td-colored"><strong>DATI INVIO <ab:if wherecondition="<%=bean.isTest()%>">TEST!!!</ab:if></strong></td>
                    </tr>
                    <tr>
                      <td class="td-colored">Codice fiscale proprietario</td>
                      <td class="td-colored"><strong><input name="tsCfProprietario" type="text" class="mandatoryField"  id="tsCfProprietario" <%=readonly%> value="<%= bean.getTsCfProprietario() %>" size="20" maxlength="20"></strong> </td>
                    </tr>
                 <ab:if wherecondition="<%=bean.getTsTipoSoggetto()==0%>">   <tr>
                      <td class="td-colored">Codice regione:</td>
                      <td class="td-colored"><strong><input name="tsCodRegione" type="text" class="mandatoryField"  id="tsCodRegione" <%=readonly%> value="<%= bean.getTsCodRegione() %>" size="20" maxlength="20">
                      </strong></td>
                    </tr>
                    <tr>
                      <td class="td-colored">Codice ASL:</td>
                      <td class="td-colored"><strong><input name="tsCodAsl" type="text" class="mandatoryField"  id="tsCodAsl" <%=readonly%> value="<%= bean.getTsCodAsl() %>" size="20" maxlength="20">
                      </strong></td>
                    </tr>
                  
                    <tr>
                      <td class="td-colored">Codice Struttura:</td>
                      <td class="td-colored"><strong>  <ab:if wherecondition="<%=bean.getProtocollo().isEmpty() && !bean.isTest()%>"> <select name="codiceSsa" class="mandatoryField" id="codiceSsa"    >
                  <ab:optionvec  boundcolumn="codice" desccolumn="codice" vectumerator="listaCodiceSsa"  value="<%=bean.getCodiceSsa()%>"> &nbsp;&nbsp;&nbsp;</ab:optionvec>
						  </select></ab:if><ab:else><%=bean.getCodiceSsa()%></ab:else>
                  </strong></td>
                    </tr></ab:if>  <tr>
                      <td class="td-colored">User name inviante:</td>
                      <td class="td-colored"><strong><input name="tsUsername" type="text" class="mandatoryField"  id="tsUsername" <%=readonly%> value="<%= bean.getTsUsername() %>" size="20" maxlength="20">
                      </strong></td>
                    </tr>
                     <tr>
                      <td class="td-colored">Password inviante:</td>
                      <td class="td-colored"><strong><input name="tsPassword" type="text" class="mandatoryField"  id="tsPassword" <%=readonly%> value="<%= bean.getTsPassword() %>" size="20" maxlength="20">
                      </strong></td>
                    </tr> <tr>
                      <td class="td-colored">Pin Code Inviante:</td>
                      <td class="td-colored"><strong><input name="tsPinCode" type="text" class="mandatoryField"  id="tsPinCode" <%=readonly%> value="<%= bean.getTsPinCode() %>" size="20" maxlength="20">
                      </strong></td>
                    </tr>
                  </tbody>
                </table>
                </td>
                <td height="76" colspan="2"  class="td-colored"  style="vertical-align:top" >Descrizione Esito:<br><span class="red-bold"><%=bean.getDescrizioneEsitoHtml()%></span></td>
                </tr>
              <tr>
                <td colspan="2" valign="top" class="td-colored"   >FILE CARICATO PRONTO PER L'iNVIO:<br>
                  <strong><%=bean.getNomeFileZip()%></strong><br>
                  <br>
Stato: <span style="font-size:14px;color:#F60004"> <%=bean.getFlgStato()%>- <%=bean.getStato()%></span></td>
                <td  height="50%" colspan="2"  class="td-colored"  style="vertical-align:top" ><ab:if_file_exist filename="<%=bean.getNomeFileZip()%>" path='/_ts/invio/' ><strong>ELENCO FILES:</strong><br><a href="../../_ts/invio/<%=bean.getNomeFileZip()%>" target="_blank">File zip del seguente invio</a></ab:if_file_exist><ab:if_file_exist filename="<%=bean.getFileNameRicevutaPdf()%>" path='/_ts/ricevute/' ><br><a href="../../_ts/ricevute/<%=bean.getFileNameRicevutaPdf()%>" target="_blank">Ultima ricevuta PDF scaricata</a></ab:if_file_exist><ab:if_file_exist filename="<%=bean.getFileNameErroriCsv()%>" path='/_ts/ricevute/' ><br><a href="../../_ts/ricevute/<%=bean.getFileNameErroriCsv()%>" target="_blank">Ultimo file CSV di errori</a></ab:if_file_exist></td>
              </tr>
           <ab:if wherecondition="<%=bean.getProtocollo().isEmpty()%>">     <tr>
                <td colspan="2" class="td-colored"   ><br>
                  Il file deve essere ancora inviato<a href="javascript:inviaFile()"><br>
                  <br>
                </a></td>
                <td colspan="3" align="center" class="td-colored"   ><a href="javascript:inviaFile()"><img src="../_V3/_img/Icons/48x48/shadow/document_out.gif" alt="" width="48" height="48" title="INVIA FILE ZIP"/><br>
                INVIA ADESSO</a></td>
                <td colspan="2" align="center" class="td-colored"   >IL PRIMO PASSO E' INVIARE IL FILE ALLA  AGENZIA DELL'ENTRATE</td>
              </tr>
           </ab:if>
              <ab:else>
              <tr>
                <td width="236" class="td-colored"   >Protocollo:<br>
                  <span style="font-size:16px;font-weight:bold"><%=bean.getProtocollo()%></span><br>
                  Timestamp accoglienza file:<br>
                <strong><%= bean.getDataAccoglienzaS() %></strong></td>
                <td width="182" align="center"  style="vertical-align:top"  class="td-colored"   ><ab:if wherecondition="<%=bean.getFlgStato()>=2 && bean.getFlgStato()<=9%>"><span class="td-colored" style="vertical-align:top"><a href="javascript:richiestaEsito()"><img src="../_V3/_img/Icons/48x48/shadow/check2.gif" alt="" width="48" height="48" title="VERIFICA LA RICEVUTA"/><br>
VERIFICA RICEVUTA </a></span></ab:if></td>
                <td width="129" align="center" class="td-colored"   style="vertical-align:top"  ><ab:if wherecondition="<%=bean.getFlgStato()>=3 && bean.getFlgStato()<=9%>"><span class="td-colored" style="vertical-align:top"><a href="javascript:getRicevutaPdf()"><img src="../_V3/_img/Icons/48x48/shadow/save_as.gif" alt="" width="48" height="48" title="VERIFICA LA RICEVUTA"/><br>
RICHIEDI RICEVUTA PDF</a></span></ab:if></td>
                <td width="139" align="center" class="td-colored"   style="vertical-align:top"  > <ab:if wherecondition="<%=bean.getFlgStato()>=3  && bean.getFlgStato()<=9%>">
                  <span class="td-colored" style="vertical-align:top"><a href="javascript:getErroriCsv()"><img src="../_V3/_img/Icons/48x48/shadow/document_chart.gif" alt="" width="48" height="48" title="VERIFICA LA RICEVUTA"/><br>
RICHIEDI FILE ERRORI CSV</a></span></ab:if></td>
                <td width="149" align="center" class="td-colored"   style="vertical-align:top"  ><ab:if wherecondition="<%=bean.getFlgStato()>=4 && bean.getFlgStato()<=9 %>">
                  <a href="javascript:chiudiPratica()"><img src="../_V3/_img/Icons/48x48/shadow/checks.gif" alt="" width="48" height="48" title="Chiudi Pratica"/><br>
CHIUDI INVIO </a><br>
<select name="flgStatoChiusura" class="mandatoryField" id="flgStatoChiusura"  >
  <option value="">--Scegli come chiudere --</option>
  <option value="10">Concluso Positivamente</option>
  <option value="99">Concluso Negativamente</option>
 
</select>
</ab:if></td>
                <td colspan="2" align="center" class="td-colored"   ><p>1- SE L'ESITO DELL'INVIO E' POSITIVO PUOI PROCEDERE CON LA VERIFICA DELLA RICEVUTA DI INVIO.<br>
                  2- SE L'ESITO DELLA VERIFICA DELL'INVIO E' POSITIVO E NON E' IN FASE DI ELABORAZIONE, RICHIEDI LA RICEVUTA PDF.</p>
                  <p>3- LA RICEVUTA PDF PUO' CONTENERE ANCHE UN ESITO NEGATIVO. <span class="red-bold">CONTROLLARE SEMPRE IL PDF</span></p></td>
              </tr>
              </ab:else></ab:else>
            </table>
      <!-- InstanceEndEditable -->
    </div>
  </form>
  <script language="JavaScript" src="../_V3/_js/refreshFrames.js" type="text/JavaScript"></script> 
</ab:if_logon_ok>
<ab:else_logon><jsp:include page="../_V3/_inc/_redirect.jsp" flush="true" /></ab:else_logon>
  <!-- InstanceBeginEditable name="footer" -->
    <!-- InstanceEndEditable --><form name="menu" id="menu" method="post" >
    <input type="hidden" name="cmd" id="cmd"> <input type="hidden" name="cmd2" id="cmd2">
    <input type="hidden" name="act" id="act"> <!-- InstanceBeginEditable name="hiddenFields" --><!-- InstanceEndEditable -->
  </form>
    <div id="jQueryWIN">
    </div><div class="modal"></div><script language="JavaScript" src="../_V3/_js/documentReady.js"></script>
</body>
<!-- InstanceEnd --></html>
