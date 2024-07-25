<!-- InstanceBegin template="/Templates/4LTEContent.dwt" codeOutsideHTMLIsLocked="false" -->
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/ablia.tld" prefix="ab" %>
<%@ page language="java" import="com.ablia.jsp.*" %>
<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean>
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="logon" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="grantMsg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<input type="hidden" name="_async" id="_async">
<jsp:useBean id="encType" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<input name="beanMsg" type="hidden" id="beanMsg" value="<%=Ab.formatBeanMsg( msg,  grantMsg)%>">
<input name="logonRes" type="hidden" id="logonRes" value="<%=logon%>">
<jsp:useBean id="utenteLogon" type="com.ablia.common.UsersI" class="com.ablia.common.Users" scope="session" >
</jsp:useBean>
<jsp:useBean id="df" class="com.ablia.util.SimpleDateFormat" scope="request" type="com.ablia.util.SimpleDateFormat" >
</jsp:useBean>
<jsp:useBean id="nf" scope="request" type="java.text.NumberFormat" >
</jsp:useBean>
<jsp:useBean id="readonly" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<ab:if_logon_ok trueifnotsecure="true"><!-- InstanceBeginEditable name="bean" -->
  <input name="pageTitle" type="hidden" id="pageTitle" value="Invii Tessera Sanitaria">
  <jsp:useBean id="list" scope="request" class="com.ablia.util.Vectumerator" type="com.ablia.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="CR" class="com.ablia.ts.InvioTsCR" type="com.ablia.ts.InvioTsCR" scope="request" >
  </jsp:useBean>
  <!-- InstanceEndEditable --> 
  <!--- intestazione stampa -->
  <div class="row visible-print-block">
    <div class="col-lg-12">
      <div id="printTitleContent" class="pageTitle pull-left">Stampa</div>
    </div>
  </div>
  <div class="content-toolbar hidden-print">
    <div class="row  row-breadcrumb">
      <div class="col-lg-8">
        <ol class="breadcrumb">
          <!-- InstanceBeginEditable name="breadcrumb" -->
          <li><a href="javascript:Ab.dashboard()"><i class="fa fa-dashboard"></i> Home</a></li>
          <li class="active">Elenco Invii Tessera Sanitaria </li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-4 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --><!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --><a class="btn btn-app btn-app-sm" href="javascript:newCommand()"> <i class="fa fa-file-o" title="<ab:lang>Nuovo Record</ab:lang>"></i>
            <ab:lang>Nuovo</ab:lang>
            </a>
            <ab:if wherecondition="<%=CR.isGoogleTranslatorEnable()%>"><a class="btn btn-app btn-app-sm" href="javascript:Ab.translateAllCR()"> <i class="fa fa-globe" title="<ab:lang>Traduci</ab:lang>"></i>
              <ab:lang>Traduci</ab:lang>
              </a></ab:if>
            <a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="<ab:lang>Stampa Pagina</ab:lang>"></i>
            <ab:lang>Stampa</ab:lang>
            </a><a class="btn btn-app btn-app-sm " href="javascript:report()"> <i class="fa fa-bar-chart" title="<ab:lang>Report</ab:lang>"></i>
            <ab:lang>Report</ab:lang>
            </a><a class="btn btn-app btn-app-sm pull-right" href="javascript:searching()"> <i class="fa fa-search" title="Cerca"></i>Cerca </a> <!-- InstanceEndEditable --></div>
          <div class="col-lg-4" >
            <p id="messaggi" class="messaggi"><%=Ab.formatBeanMsg( msg,  grantMsg)%></p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <section class="content">
    <form method="post" action="" name="main" id="main" <%=encType%>>
      <jsp:include page="../_V4/_inc/_formMainFields.jsp" flush="true" />
      <!-- InstanceBeginEditable name="logonOk" -->
      <input type="hidden" name="actionPage" id="actionPage" value="../inviots/InvioTs.abl">
      <input name="pageType" type="hidden" id="pageType" value="R">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= CR.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= CR.getCurrentFocus() %>">
      <input name="flgMobileView" type="hidden" id="flgMobileView" value="<%= CR.getFlgMobileView() %>">
      <input type="hidden" name="id_invioTs" id="id_invioTs" value="<%=CR.getId_invioTs()%>">
      <input type="hidden" name="createTmst" id="createTmst" value="??undefined type??">
      <div class="row hidden-print">
        <div class="col-lg-12">
          <div class="box box-ricerca">
            <div class="box-body">
              <div class="row">
                <div class="col-lg-3 col-xs-6">
                  <label for="flgStato">Stato:</label>
                  <br>
                  <select  class="form-control input-sm select2" name="flgStato" id="flgStato" onChange="searching()">
                    <ab:optionflg boundcolumn="flgStato" valuelist="-1,0,1,2,3,4,9,10,99">&nbsp;</ab:optionflg>
                  </select>
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="nomeFileZip">Nome File:</label>
                  <br>
                  <input type="text" class="form-control input-sm" name="nomeFileZip" id="nomeFileZip" value="<%=CR.getNomeFileZip()%>" maxlength="40" onChange="searching()">
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="protocollo">Protocollo:</label>
                  <br>
                  <input type="text" class="form-control input-sm" name="protocollo" id="protocollo" value="<%=CR.getProtocollo()%>" maxlength="40" onChange="searching()">
                </div>
                <ab:if wherecondition="<%=CR.getFlgTipoSoggettoTS()==0%>">
                  <div class="col-lg-2 col-xs-6">
                    <label for="protocollo">Codice Struttura:</label>
                    <br>
                    
                    <select name="codiceSsa" class="form-control input-sm select2"  id="codiceSsa" onChange="searching()" >
                      <ab:optionvec  boundcolumn="codice" desccolumn="codice" vectumerator="listaCodiceSsa" value="<%=CR.getCodiceSsa()%>"> &nbsp;&nbsp;&nbsp;</ab:optionvec>
                    </select>
                  </div>
                </ab:if>
                <div class="col-lg-1 col-xs-6"><a class="btn btn-app btn-app-sm pull-right hidden-print" href="javascript:searching()"> <i class="fa fa-search"title="Cerca"></i>Cerca </a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="box"> 
            <!-- .box-header -->
            <div class="box-header clearfix hidden-print">
              <jsp:include page="../_V4/_inc/_inc_paginazione_top.jsp" flush="true" />
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive mobileSwitch" name="listaInvioTs" id='<%=CR.getFlgMobileView()==1?"no-more-tables":""%>'>
              <table class="table table-bordered table-hover table-striped dataTable table-condensed ">
                <thead>
                  <tr>
                    <th>&nbsp;</th>
                   
                    <th>Descrizione Invio</th> <th>Codice Struttura</th>
                    <th>Data Accoglienza</th>
                    <th>Stato</th>
                    <th>Protocollo</th>
                    <th>Descrizione Esito</th>
                  </tr>
                </thead>
                <ab:whilevec rowbeanclass="com.ablia.ts.InvioTs" vectumerator="list">
                  <tr>
                    <td class="comandi text-center"><div class="inline text-center hidden-print"><a href="javascript:modifyCommand('<%=rowBean.getId_invioTs()%>');"><i class="fa fa-edit fa-2x" title="<ab:lang>Modifica Record</ab:lang>"></i></a> <a href="javascript:deleteCommandCR('<%=rowBean.getId_invioTs()%>','<%= rowBean.getLastUpdTmstString() %>');"><i class="fa fa-trash-o fa-2x" title="<ab:lang>Cancella Record</ab:lang>"></i></a></div></td>
                    <td data-title="Descrizione"><%=rowBean.getDescrizioneInvio()%></td>
                    <td data-title="Codice Struttura"><%=rowBean.getCodiceSsa()%></td>
                    <td data-title="Data Accoglienza"><%=rowBean.getDataAccoglienza()%></td>
                    <td data-title="Stato"><ab:if wherecondition="<%=rowBean.getFlgStato()==10 %>"><i class="fa fa-check-circle-o" style="color: darkgreen"></i></ab:if><ab:if wherecondition="<%=rowBean.getFlgStato()==99 %>"><i class="fa fa-ban" style="color: darkred"></i></ab:if> <%=rowBean.getStato()%></td>
                    <td data-title="Protocollo"><%=rowBean.getProtocollo()%></td>
                    <td data-title="Descrizione Esito"><%=rowBean.getDescrizioneEsito()%></td>
                  </tr>
                </ab:whilevec>
              </table>
            </div>
            <div class="box-footer clearfix hidden-print">
              <jsp:include page="../_V4/_inc/_inc_paginazione.jsp" flush="true" />
            </div>
          </div>
        </div>
      </div>
      <!-- InstanceEndEditable -->
    </form>
  </section>
  <!-- SCRIPT DI RESET --> 
  <script language="JavaScript" src="../_V4/_js/_reset.js"></script> 
  <!-- InstanceBeginEditable name="js-pagina" --> 
  <!-- SCRIPT PERSONALIZZATI DELLA PAGINA --> 
  <script language="JavaScript" src="../inviots/_js/ab-invioTs.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </ab:if_logon_ok>
<ab:else_logon> ..... </ab:else_logon>
<!-- InstanceEnd --> 