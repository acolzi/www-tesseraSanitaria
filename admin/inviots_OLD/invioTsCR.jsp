<!DOCTYPE html>
<html><!-- InstanceBegin template="/Templates/3beanCR.dwt" codeOutsideHTMLIsLocked="false" -->
<%@ taglib uri="/WEB-INF/ablia.tld" prefix="ab" %>
<%@ page language="java" import="com.ablia.jsp.*" %>
<!-- InstanceBeginEditable name="taglib" --><!-- InstanceEndEditable --> 
<head>
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="grantMsg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="nf" scope="request" type="java.text.NumberFormat" >
</jsp:useBean>
<jsp:useBean id="df" class="com.ablia.util.SimpleDateFormat" scope="request" type="com.ablia.util.SimpleDateFormat" >
</jsp:useBean>
<!-- InstanceBeginEditable name="title" -->
<title>::Invio Tessera Sanitarlia - Ricerca 0.0</title>
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
</head>
<jsp:include page="../_V3/_inc/_allJs2.jsp" flush="true" />
<body><!-- #BeginEditable "Script" -->
<script language="JavaScript" src="_js/ab-invioTs.js"></script>
<!-- #EndEditable -->
<jsp:useBean id="utenteLogon" type="com.ablia.common.UsersI" class="com.ablia.common.Users" scope="session" >
</jsp:useBean>
<!-- InstanceBeginEditable name="Bean" -->
<jsp:useBean id="CR" class="com.ablia.ts.InvioTsCR" type="com.ablia.ts.InvioTsCR" scope="request" >
</jsp:useBean>
<jsp:useBean id="list" scope="request" class="com.ablia.util.Vectumerator" type="com.ablia.util.Vectumerator">
</jsp:useBean>
<!-- InstanceEndEditable -->
<ab:if_logon_ok trueifnotsecure="true">
  <div id="togglePlaceholder" style="width:30px;float:left;margin-left:3px"></div>
  <form method="post" action="" name="main" id="main" onSubmit="if(checkSearchFields()) formSearching();else return false;">
    <jsp:include page="../_V3/_inc/_formMainFields.jsp" flush="true" />    
    <input name="pageType" type="hidden" id="pageType" value="R">
    <input name="currentTab" type="hidden" id="currentTab" value="<%= CR.getCurrentTab() %>">
    <input name="currentFocus" type="hidden" id="currentFocus" value="<%= CR.getCurrentFocus() %>">
    <ab:if wherecondition='<%=CR.getFlgReport().equals("")%>' >
      <div class="path" style="margin-left:40px">
        <p><a href="javascript:menu();">Menu</a><!-- InstanceBeginEditable name="navbar" --><a href="javascript:menu();"> &raquo; </a>Elenco Invii Tessera Sanitaria<!-- InstanceEndEditable -->
          
        <h1 style="float:right"><!-- InstanceBeginEditable name="pageTitle" -->Invio Tessera Sanitaria
            <input name="pageTitle" type="hidden" id="pageTitle" value="::Parametri - Ricerca 0.0">
        <!-- InstanceEndEditable -->&nbsp;<a href="javascript:help();"><img src="../_V3/_img/icone/userbar/ico_help.png" alt="Help" title="Help" width="32" height="27" class="noborder"></a></h1>
        </p>
      </div>
      <div id="inside" class="body">
      <div class="toolbar"> <!-- InstanceBeginEditable name="toolbar" -->
      <div class="user_menu"><a href="javascript:newCommand()"><img src="../_V3/_img/icone/32/new_doc_32.png" alt="Nuovo Record" width="32" height="32" class="noborder" title="Nuovo Record"></a><ab:if wherecondition="<%=utenteLogon.getId_users()==1%>"></ab:if>
        <a href="javascript:sendTestEmail();"><img src="../_V3/_img/icone/32/email_32.png" alt="Invia Mail di Test" width="32" height="32" title="Invia Mail di Test"></a></div>
 <!-- InstanceEndEditable --><div id="messaggi" class="msg"><jsp:include page="../_V3/_inc/beanMsg.jsp" flush="true"  /> <!-- InstanceBeginEditable name="msg" --><!-- InstanceEndEditable --></div></div>
        <div class="body-container">
    <!-- InstanceBeginEditable name="criteriRicerca" -->
          <table class="table-container" cellpadding="0" cellspacing="0" width="100%">

                <tr>
                  <td width="301" class="td-colored">Nome File:
                    <input type="hidden" name="actionPage" id="actionPage" value="InvioTs.abl">
                    <input name="id_invioTs" id="id_invioTs" type="hidden" value="<%=CR.getId_invioTs()%>">
                    <br>
                    <input type="text" id="nomeFileZip"  <%=Ab.jsCrS()%> name="nomeFileZip" size="25" maxlength="30" value="<%=CR.getNomeFileZip()%>">
                  <%=Ab.jsSetFocus("searchTxt")%></td>
                  <td colspan="2" class="td-colored">Protocollo:<br>
                  <input type="text" id="protocollo"  <%=Ab.jsCrS()%> name="protocollo" size="25" maxlength="30" value="<%=CR.getProtocollo()%>"></td>
            </tr>
                <tr>
                  <td class="td-colored"><ab:if wherecondition="<%=CR.getFlgTipoSoggettoTS()==0%>"> CODICE STRUTTURA:<br>
                    <select name="codiceSsa" class="mandatoryField" id="codiceSsa"  >
                      <ab:optionvec  boundcolumn="codice" desccolumn="codice" vectumerator="listaCodiceSsa" value="<%=CR.getCodiceSsa()%>"> &nbsp;&nbsp;&nbsp;</ab:optionvec>
                  </select></ab:if>&nbsp;</td>
                  <td width="130" class="td-colored"></td>
                  <td width="636" align="right" class="td-colored"><a href="javascript:searching()"><img src="../_V3/_img/buttons/btn_cerca.png" alt="Cerca"  title="Cerca" width="53" height="47" border="0"></a><a href="javascript:report()"><img src="../_V3/_img/buttons/btn_report.png" alt="Report"  title="Report" width="53" height="47" border="0"></a></td>
            </tr>
                
            </table>
      <!-- InstanceEndEditable -->  </div>
      <table class="table-container" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td class="td-paginazione align-centre" width="33%">Record Trovati: <strong><%=list.getTotNumberOfRecords()%></strong></td>
          <td class="td-paginazione align-centre" width="33%"><ab:prevvec link="javascript:prevPage();"  vectumerator="list"> <img src="../_V3/_img/icone/16/left_16.png" alt=">>"></ab:prevvec>
            &nbsp;&nbsp;Pagina <%=list.getPageNumber()%> di <%=list.getTotNumberOfPages()%> &nbsp; &nbsp;
            <ab:nextvec link="javascript:nextPage();"  vectumerator="list"> <img src="../_V3/_img/icone/16/right_16.png" alt=">>"></ab:nextvec></td>
          <td class="td-paginazione align-right" width="33%">Vai a pagina
            <input name="pageNumberGo" id="pageNumberGo" size="4" <%=Ab.jsCrS("goPage()")%> title="Inserisci il numero di pagina e premi invio o 'Procedi'">
            <a href="javascript:goPage();">Procedi &raquo;</a></td>
        </tr>
      </table>
      <!-- InstanceBeginEditable name="body" -->
<table cellspacing="0" cellpadding="0" class="table-container th-riga alternating" width="98%"><tr >
                <th width="3%" >&nbsp;</th>
                <th width="31%" >Descrizione</th>
               <ab:if wherecondition="<%=CR.getFlgTipoSoggettoTS()==0%>"> <th width="5%" >Codice Struttura</th></ab:if>
                <th width="7%" >Tmst Accoglienza file</th>
                <th colspan="2">Stato</th>
                <th width="5%">Protocollo</th>
                <th width="33%"> Esito</th>
                </tr>
              <ab:whilevec  rowbeanclass="com.ablia.ts.InvioTs"  vectumerator="list">
			
                <tr >
                  <td > 
                    <table width="100%" border="0">
                      <tbody>
                        <tr>
                          <td><a href="javascript:modifyCommand(<%=rowBean.getId_invioTs()%>);"><img src="../_V3/_img/icone/16/edit.png" alt="Modifica Record" width="16" height="16" border="0"></a></td>
                          <td><ab:if wherecondition="<%=utenteLogon.getId_users()==1%>"><a href="javascript:deleteCommandCR(<%=rowBean.getId_invioTs()%>,'<%= rowBean.getLastUpdTmstString() %>');"><img src="../_V3/_img/icone/16/delete_16.png" alt="Cancella Record" width="16" height="16" border="0"> </a></ab:if></td>
                        </tr>
                      </tbody>
                    </table>
                 </td>
                  <td width="31%" ><%=rowBean.getDescrizioneInvio()%> file: <%=rowBean.getNomeFileZip()%></td>
                  <ab:if wherecondition="<%=CR.getFlgTipoSoggettoTS()==0%>"><td width="5%"  ><%=rowBean.getCodiceSsa()%></td></ab:if>
                  <td width="7%"  ><%= rowBean.getDataAccoglienzaS() %></td>
                  <td colspan="2"><ab:if wherecondition="<%=rowBean.getFlgStato()==10 %>"><img src="../_V3/_img/Icons/48x48/shadow/check.gif" width="16" height="16" alt=""/></ab:if><ab:if wherecondition="<%=rowBean.getFlgStato()==99 %>"><img src="../_V3/_img/Icons/48x48/shadow/bullet_ball_glass_red.gif" width="16" height="16" alt=""/></ab:if> <%= rowBean.getStato() %> </td>
                  <td><%= rowBean.getProtocollo() %></td>
                  <td><%= rowBean.getCodiceEsito() %> - <%= rowBean.getDescrizioneEsito() %></td>
                </tr>
				
				
              </ab:whilevec>
            </table>
      <!-- InstanceEndEditable -->
      <table class="table-container" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td class="td-paginazione align-centre" width="33%">Record Trovati: <strong><%=list.getTotNumberOfRecords()%></strong></td>
          <td class="td-paginazione align-centre" width="33%"><ab:prevvec link="javascript:prevPage();"  vectumerator="list"> <img src="../_V3/_img/icone/16/left_16.png" alt=">>"></ab:prevvec>
            &nbsp;&nbsp;Pagina <%=list.getPageNumber()%> di <%=list.getTotNumberOfPages()%> &nbsp; &nbsp;
            <ab:nextvec link="javascript:nextPage();"  vectumerator="list"> <img src="../_V3/_img/icone/16/right_16.png" alt=">>"></ab:nextvec></td>
          <td class="td-paginazione align-right" width="33%">Vai a pagina
            <input name="pageNumberGo2" id="pageNumberGo2" size="4" <%=Ab.jsCrS("goPage2()")%> title="Inserisci il numero di pagina e premi invio o 'Procedi'">
            <a href="javascript:goPage2();">Procedi &raquo;</a></td>
        </tr>
      </table></div>
    </ab:if>
    <ab:if wherecondition='<%=!CR.getFlgReport().equals("")%>' >
    <div id="insideR" class="body">  <!-- InstanceBeginEditable name="report" -->xxx<!-- InstanceEndEditable --></div></ab:if>
    
  </form>
  <script language="JavaScript" src="../_V3/_js/refreshFrames.js" type="text/JavaScript"></script></ab:if_logon_ok>
<ab:else_logon> <jsp:include page="../_V3/_inc/_redirect.jsp" flush="true" /></ab:else_logon>
  <!-- InstanceBeginEditable name="footer" -->
  <!-- InstanceEndEditable --><form name="menu" id="menu" method="post" >
    <input type="hidden" name="cmd" id="cmd"><input type="hidden" name="cmd2" id="cmd2">
    <input type="hidden" name="act" id="act"> <!-- InstanceBeginEditable name="hiddenFields" --><!-- InstanceEndEditable -->
  </form>
<div class="modal"></div><script language="JavaScript" src="../_V3/_js/documentReady.js"></script></body>
<!-- InstanceEnd --></html>
