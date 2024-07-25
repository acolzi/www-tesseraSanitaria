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
  <input name="pageTitle" type="hidden" id="pageTitle" value="Invio Tessera Sanitaria">
  <!--  pagine di dettaglio -->
  <jsp:useBean id="bean" class="com.ablia.ts.InvioTs" type="com.ablia.ts.InvioTs" scope="request" >
  </jsp:useBean>
  <jsp:useBean id="list" scope="request" class="com.ablia.util.Vectumerator" type="com.ablia.util.Vectumerator">
  </jsp:useBean>
  <!--  pagine di ricerca --> 
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
          <li ><a href="javascript:Ab.callAbl('/admin/inviots/InvioTs',null,'back')">Elenco Gest. invio_ts</a></li>
          <li class="active">Dettaglio Invio Tessera Sanitaria</li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-4 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --> <%=bean.getLastUpdInfo()%> <!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --> <a class="btn btn-app btn-app-sm" href="javascript:newCommand()"> <i class="fa fa-file-o" title="<ab:lang>Nuovo Record</ab:lang>"></i>
            <ab:lang>Nuovo</ab:lang>
            </a><a class="btn btn-app btn-app-sm" href="javascript:saveCommand()"> <i class="fa fa-floppy-o" title="<ab:lang>Salva Record</ab:lang>"></i>
            <ab:lang>Salva</ab:lang>
            </a>
            <ab:if wherecondition="<%=bean.isGoogleTranslatorEnable()%>"><a class="btn btn-app btn-app-sm" href="javascript:Ab.translateAll()"> <i class="fa fa-globe" title="<ab:lang>Traduci</ab:lang>"></i>
              <ab:lang>Traduci</ab:lang>
              </a></ab:if>
            <a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="<ab:lang>Stampa</ab:lang>"></i>
            <ab:lang>Stampa</ab:lang>
            </a><a class="btn btn-app btn-app-sm" href="javascript:deleteCommand()"> <i class="fa  fa-trash-o" title="<ab:lang>Cancella Record</ab:lang>"></i>
            <ab:lang>Elimina</ab:lang>
            </a><!-- InstanceEndEditable --></div>
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
      <input name="pageType" type="hidden" id="pageType" value="D">
      <input name="lastUpdTmst" id="lastUpdTmst" type="hidden" value="<%= bean.getLastUpdTmstString() %>">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= bean.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= bean.getCurrentFocus() %>">
      <input name="flgMobileView" type="hidden" id="flgMobileView" value="<%= bean.getFlgMobileView() %>">
      <input type="hidden" name="id_invioTs" id="id_invioTs" value="<%=bean.getId_invioTs()%>">
      <input name="flgTipoSoggettoTS" type="hidden" id="flgTipoSoggettoTS" value="<%=bean.getFlgTipoSoggettoTS()%>">
      
      <!-- dettaglio -->
      <div class="row">
        <div class="col-lg-12">
          <div class="box box-dettaglio">
            <div class="box-body">
              <ab:if wherecondition="<%=bean.getNomeFileZip().isEmpty()%>">
                <div class="row">
                  <div class="col-lg-5 col-xs-6">
                    <label for="descrizioneInvio">Descrizione Invio:</label>
                    <br>
                    <textarea rows="4"  defaultFocus="focus" type="text" class="form-control input-sm" name="descrizioneInvio" id="descrizioneInvio"><%=bean.getDescrizioneInvio()%></textarea>
                  </div>
                  <div class="col-lg-2 col-xs-6">
                    <label for="codiceSsa">Codice Struttura:</label>
                    <br>
                    <select class="form-control input-sm select2" name="codiceSsa" id="codiceSsa">
                      <ab:optionvec  boundcolumn="codice" desccolumn="codice" vectumerator="listaCodiceSsa" value="<%=bean.getCodiceSsa()%>"> &nbsp;&nbsp;&nbsp;</ab:optionvec>
                    </select>
                  </div>
                  <div class="col-lg-3 col-xs-12">
                    <label for="codiceSsa">Carica file da inviare:</label>
                    <br>
                    <div class="loadFile">
                      <label>
                      <input name="btn-upload_file_1" type="file" id="btn-upload_file_1" size="40" maxlength="200" onChange="Ab.saveFile(0,1)">
                      <input type="hidden" id="fileNameOnServer_1" name="fileNameOnServer_1">
                      <div id="uploadFileRes_1">CARICA IL FILE</div>
                    </div>
                  </div>
                  <div class="col-lg-1 col-xs-12"><a href="javascript:caricaFileLte();"><i class="fa fa-plus fa-3x" style="color: darkgreen" aria-hidden="true"></i></a></div>
                </div>
              </ab:if>
              <ab:else>
                <div class="row">
                  <div class="col-lg-5 col-xs-12">
                    <table class="table table-striped" style="border: 1px solid #ededed;">
                      <tbody>
                        <tr>
                          <td colspan="4" align="center" ><strong>DATI INVIO
                            <ab:if wherecondition="<%=bean.isTest()%>">TEST!!!</ab:if>
                            </strong></td>
                        </tr>
                        <tr>
                          <td >Codice fiscale proprietario</td>
                          <td ><strong>
                            <input name="tsCfProprietario" type="text" class="form-control input-sm"  id="tsCfProprietario" <%=readonly%> value="<%= bean.getTsCfProprietario() %>" size="20" maxlength="20">
                            </strong></td>
                          <td >User name inviante:</td>
                          <td ><strong>
                            <input name="tsUsername" type="text" class="form-control input-sm"  id="tsUsername" <%=readonly%> value="<%= bean.getTsUsername() %>" size="20" maxlength="20">
                            </strong></td>
                        </tr>
                        <ab:if wherecondition="<%=bean.getTsTipoSoggetto()==0%>">
                          <tr>
                            <td >Codice regione:</td>
                            <td ><strong>
                              <input name="tsCodRegione" type="text" class="form-control input-sm"  id="tsCodRegione" <%=readonly%> value="<%= bean.getTsCodRegione() %>" size="20" maxlength="20">
                              </strong></td>
                            <td >Password inviante:</td>
                            <td ><strong>
                              <input name="tsPassword" type="text" class="form-control input-sm"   id="tsPassword" <%=readonly%> value="<%= bean.getTsPassword() %>" size="20" maxlength="20">
                              </strong></td>
                          </tr>
                          <tr>
                            <td >Codice ASL:</td>
                            <td ><strong>
                              <input name="tsCodAsl" type="text" class="form-control input-sm"   id="tsCodAsl" <%=readonly%> value="<%= bean.getTsCodAsl() %>" size="20" maxlength="20">
                              </strong></td>
                            <td >Pin Code Inviante:</td>
                            <td ><strong>
                              <input name="tsPinCode" type="text" class="form-control input-sm"   id="tsPinCode" <%=readonly%> value="<%= bean.getTsPinCode() %>" size="20" maxlength="20">
                              </strong></td>
                          </tr>
                          <tr>
                            <td >Codice Struttura:</td>
                            <td ><strong>
                              <ab:if wherecondition="<%=bean.getProtocollo().isEmpty() && !bean.isTest()%>">
                                <select name="codiceSsa" class="form-control input-sm select2"  id="codiceSsa"    >
                                  <ab:optionvec  boundcolumn="codice" desccolumn="codice" vectumerator="listaCodiceSsa"  value="<%=bean.getCodiceSsa()%>"> &nbsp;&nbsp;&nbsp;</ab:optionvec>
                                </select>
                              </ab:if>
                              <ab:else><%=bean.getCodiceSsa()%></ab:else>
                              </strong></td>
                            <td >&nbsp;</td>
                            <td >&nbsp;</td>
                          </tr>
                        </ab:if>
                      </tbody>
                    </table>
                  </div>
                  <div class="col-lg-3 col-xs-12">
                    <div class="row">
                      <div class="col-lg-12 col-xs-12">
                        <label for="descrizioneInvio">Descrizione Invio:</label>
                        <br>
                        <textarea rows="4"  defaultFocus="focus" type="text" class="form-control input-sm" name="descrizioneInvio" id="descrizioneInvio"><%=bean.getDescrizioneInvio()%></textarea>
                      </div>
                      <div class="col-lg-12 col-xs-12">
                        <label>FILE CARICATO PRONTO PER L'INVIO:</label>
                        <br>
                        <strong><%=bean.getNomeFileZip()%></strong><br>
                        <br>
                        Stato: <span style="font-size:14px;color:#F60004"> <%=bean.getFlgStato()%>- <%=bean.getStato()%></span> </div>
                    </div>
                  </div>
                  <div class="col-lg-4 col-xs-12">
                    <div class="row">
                      <div class="col-lg-12 col-xs-12">
                        <label for="descrizioneEsito">Descrizione Esito:</label>
                        <br>
                        <textarea rows="4"  type="text" class="form-control input-sm" name="descrizioneEsito" readonly id="descrizioneEsito"><%=bean.getDescrizioneEsito()%></textarea>
                      </div>
                      <div class="col-lg-12 col-xs-12">
                        <ab:if_file_exist filename="<%=bean.getNomeFileZip()%>" path='/_ts/invio/' >
                          <label><strong>ELENCO FILES:</strong></label>
                          <br>
                          <a href="../../_ts/invio/<%=bean.getNomeFileZip()%>" target="_blank">File zip del seguente invio</a></ab:if_file_exist>
                        <ab:if_file_exist filename="<%=bean.getFileNameRicevutaPdf()%>" path='/_ts/ricevute/' ><br>
                          <a href="../../_ts/ricevute/<%=bean.getFileNameRicevutaPdf()%>" target="_blank">Ultima ricevuta PDF scaricata</a></ab:if_file_exist>
                        <ab:if_file_exist filename="<%=bean.getFileNameErroriCsv()%>" path='/_ts/ricevute/' ><br>
                          <a href="../../_ts/ricevute/<%=bean.getFileNameErroriCsv()%>" target="_blank">Ultimo file CSV di errori</a></ab:if_file_exist>
                      </div>
                    </div>
                  </div>
                </div>
                <ab:if wherecondition="<%=bean.getProtocollo().isEmpty()%>">
                  <div class="row">
                    <div class="col-lg-6 col-xs-12" style="text-align: center"> <a href="javascript:inviaFile()"><i class="fa fa-paper-plane fa-3x" aria-hidden="true" style="color: darkgreen"></i><br>
                      INVIA ADESSO</a> </div>
                    <div class="col-lg-6 col-xs-12">IL PRIMO PASSO E' INVIARE IL FILE ALLA  AGENZIA DELL'ENTRATE</div>
                  </div>
                </ab:if>
                <ab:else>
                  <div class="row">
                    <div class="col-lg-2 col-xs-12" >
                      <label>Protocollo:</label>
                      <br>
                      <span style="font-size:16px;font-weight:bold"><%=bean.getProtocollo()%></span><br>
                      Timestamp accoglienza file:<br>
                      <strong><%= bean.getDataAccoglienzaS() %></strong> </div>
                    <div class="col-lg-1 col-xs-12" style="text-align: center">
                      <ab:if wherecondition="<%=true || bean.getFlgStato()>=2 && bean.getFlgStato()<=9%>"><span  style="vertical-align:top"><a href="javascript:richiestaEsito()"><i class="fa fa-check fa-3x" style="color: darkgreen" aria-hidden="true"></i><br>
                        VERIFICA RICEVUTA </a></span></ab:if>
                    </div>
                    <div class="col-lg-1 col-xs-12" style="text-align: center">
                      <ab:if wherecondition="<%=true || bean.getFlgStato()>=3 && bean.getFlgStato()<=9%>"><span  style="vertical-align:top"><a href="javascript:getRicevutaPdf()"><i class="fa fa-download fa-3x " style="color:darkblue" aria-hidden="true"></i><br>
                        RICHIEDI RICEVUTA PDF</a></span></ab:if>
                    </div>
                    <div class="col-lg-1 col-xs-12" style="text-align: center">
                      <ab:if wherecondition="<%=true || bean.getFlgStato()>=3  && bean.getFlgStato()<=9%>"> <span  style="vertical-align:top"><a href="javascript:getErroriCsv()"><i class="fa fa-bug fa-3x " style="color:darkred"  aria-hidden="true"></i><br>
                        RICHIEDI FILE ERRORI CSV</a></span></ab:if>
                    </div>
                    <div class="col-lg-2 col-xs-12" style="text-align: center">
                      <ab:if wherecondition="<%=true || bean.getFlgStato()>=4 && bean.getFlgStato()<=9 %>"> <a href="javascript:chiudiPratica()"><i class="fa fa-check-square fa-3x " style="color:forestgreen"  aria-hidden="true"></i><br>
                        CHIUDI INVIO </a><br>
                        <select name="flgStatoChiusura" class="form-control input-sm select2"id="flgStatoChiusura"  >
                          <option value="">--Scegli come chiudere --</option>
                          <option value="10">Concluso Positivamente</option>
                          <option value="99">Concluso Negativamente</option>
                        </select>
                      </ab:if>
                    </div>
                    <div class="col-lg-5 col-xs-12" >
                      <p>1- SE L'ESITO DELL'INVIO E' POSITIVO PUOI PROCEDERE CON LA VERIFICA DELLA RICEVUTA DI INVIO.<br>
                        2- SE L'ESITO DELLA VERIFICA DELL'INVIO E' POSITIVO E NON E' IN FASE DI ELABORAZIONE, RICHIEDI LA RICEVUTA PDF.<br>
                        3- LA RICEVUTA PDF PUO' CONTENERE ANCHE UN ESITO NEGATIVO. <span class="red-bold">CONTROLLARE SEMPRE IL PDF</span></p>
                    </div>
                  </div>
                </ab:else>
              </ab:else>
            </div>
          </div>
        </div>
      </div>
      <!-- InstanceEndEditable -->
      <input name="dummy" readonly type="text" id="dummy" style="display: none">
    </form>
  </section>
  <!-- SCRIPT DI RESET --> 
  <script language="JavaScript" src="../_V4/_js/_reset.js"></script> 
  <!-- InstanceBeginEditable name="js-pagina" --> 
  <!-- SCRIPT PERSONALIZZATI DELLA PAGINA --> 
  <script language="JavaScript" src="../inviots/_js/ab-invioTs.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </ab:if_logon_ok>
<ab:else_logon>.....<script>Ab.dashboard();</script></ab:else_logon>
<!-- InstanceEnd --> 