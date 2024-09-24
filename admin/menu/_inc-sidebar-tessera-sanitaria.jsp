<!-- _inc-sidebar-miser-tessera-sanitaria.jsp -->
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/ablia.tld" prefix="ab" %>
<%@ taglib uri="/WEB-INF/contab.tld" prefix="contab" %>
<%@ page language="java" import="com.ablia.jsp.*" %>

<jsp:useBean id="utenteLogon" type="com.ablia.common.UsersI" class="com.ablia.common.Users" scope="session" >
</jsp:useBean>
<ab:if_logon_ok trueifnotsecure="true">
  <ab:ifusergrant grant="INVIO_TS" rw="1">
    <li class="treeview"><a href="#"> <i class="fa fa-circle"></i> <span>Tessera Sanitaria</span> <i class="fa fa-angle-left pull-right"></i> </a>
      <ul class="treeview-menu">
        <li><a href="javascript:Ab.callAbl('/admin/inviots/InvioTs','body')"> <i class="fa fa-circle"></i> Invio Ts</a></li>
      </ul>
    </li>
  </ab:ifusergrant> 
</ab:if_logon_ok>
