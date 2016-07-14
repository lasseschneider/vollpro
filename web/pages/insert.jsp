<%@ page import="Controller.UserController" %>
<%@ page import="Controller.SessionController" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>

<%@ page import="Model.*" %><%--
  Created by IntelliJ IDEA.
  User: Lasse
  Date: 01.06.2016
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header_code.jsp" %>
<%
String file = request.getParameter( "file_to_upload" );
    if(!file.equals("null")){
        //ToDo: Fehlerfreies Uploaden
    }
%>

<%@ include file="includes/header.jsp" %>
<%@ include file="includes/menu.jsp" %>
<%=file%><br>
<%
    String Message = "";
    if(!currentSession.isLoggedIn()){
        %>Please Login first.<%
    }else {
  %>
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
