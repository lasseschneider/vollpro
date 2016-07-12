<%@ page import="Model.Session" %>
<%@ page import="Model.User" %>
<%@ page import="Controller.UserController" %>
<%@ page import="Controller.SessionController" %>
<%--
  Created by IntelliJ IDEA.
  User: Lasse
  Date: 03.07.2016
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/menu.jsp" %>

<%
    if(currentSession.isLoggedIn()){
    currentSession.setLoggedInUntil(new Timestamp(System.currentTimeMillis()));
        currentSession.setLoggedIn(false);
    sc.updateSession(currentSession);
      //  response.sendRedirect("index.jsp");
        %>
    Vielen Dank <%=currentSession.getUser().getLogin_name()%>. Sie haben sich erfolreich ausgeloggt.
<%
    }
    else {
        %>
        Ausloggen ist nur nach erfolgreichem einloggen möglich.
<%
    }
%>


<%@include file="includes/footer.jsp"%>