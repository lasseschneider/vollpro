<%@ page import="Model.MD5" %>
<%@ page import="Controller.UserController" %>
<%@ page import="Model.User" %>
<%@ page import="Controller.SessionController" %>
<%@ page import="Model.Session" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %><%--
  Created by IntelliJ IDEA.
  User: Lasse
  Date: 01.06.2016
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%--ToDo: Implementieren von Post methode (prüfen, ob Pfad nicht null ist und dann
            insertTournament methode über den TournamentController aufrufen
--%>


<%--@ page session="true" --%>
<%--
<!DOCTYPE html>
<html>

<head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" type="text/css" href="./css/style.css" media="screen"/>


    <title>

        LASSE SCHNEIDER - DATEI HOCHLADEN

    </title>

</head>




<body>
--%>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/menu.jsp" %>
<%


    if(!currentSession.isLoggedIn()){

        %>
            Please Login first.
          <%
    }else {

%>

       <%-- <div class="container">

            <h1>Datei hochladen</h1>

            <h2><a href="../index.jsp">Index</a> <a href="insert.jsp">Insert</a> <a href="register.jsp">Registrieren</a> </h2>


            <h3>Überschrift 3</h3>
--%>

            <div class="spacer40">
            </div>

            <div class="file">
                <form action="insert.jsp" METHOD="POST">
                    <em>Datei:</em><input type="file" name="file_to_upload" /><br />

                    <div class="spacer20"> </div>

                    <input type="submit" value="Hochladen" />
                </form>
            </div>

        </div>
<%
    } //gehört zum else oben

%>

<%@ include file="includes/footer.jsp" %>
