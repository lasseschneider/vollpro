<%@ page import="Controller.PersonController" %>
<%--
  Created by IntelliJ IDEA.
  User: Lasse
  Date: 13.07.2016
  Time: 22:37
  To change this template use File | Settings | File Templates.
  From: PRG4 JSP Vorlseung
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header_code.jsp" %>

<%@ include file="includes/header.jsp" %>
<%@ include file="includes/menu.jsp" %>
<div id="content">

    <%
        PersonController perCon = new PersonController();

            int personId = Integer.parseInt(request.getParameter("id"));
        boolean success = perCon.deletePerson(personId);

        if( success )
        {
    %>
    <h2>Person deleted.</h2>
    <%
    }
    else
    {
    %>
    <h2>Person could not be deleted.</h2>
    <%
        }
    %>
    <a href="refereeList.jsp" class="btn btn-default" >Go back</a>
</div>


<%@ include file="includes/footer.jsp" %>