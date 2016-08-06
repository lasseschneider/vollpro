<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>

<%@ page import="Model.*" %>
<%@ page import="Controller.*" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Lasse
  Date: 01.06.2016
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header_code.jsp" %>
<%
    String mes = "";
if(currentSession.isLoggedIn()) {
    String file = "string";
    System.out.println("File1=" + file);
    try {
        file = request.getParameter("file_to_upload");
    } catch (NullPointerException npe) {
        System.out.println("NPE für file aufgetreten");
        npe.printStackTrace();
    }

    //System.out.println("File2length=" + file.length());
    try{
        if (file.compareTo("string") == 0) {
            System.out.println("File3=" + file);
        } else {
            System.out.println("File4=" + file);
            ArrayList<Person> persList = CSVParser.getPersonList(file);
            PersonController per = new PersonController();
            boolean personInserted = per.insertPersons(persList);
            int     newOid = per.getNewOID();
            if(personInserted){
                mes = "Personen eingef&uuml;gt";

            }



        }
    }catch(NullPointerException npe){
        npe.printStackTrace();
    }

 }
%>

<%@ include file="includes/header.jsp" %>
<%@ include file="includes/menu.jsp" %>
<%--=file--%><br>
<%
    String Message = "";
    if(!currentSession.isLoggedIn()){
        %>Please Login first.<%
    }else {
  %>
        <%=mes%>
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
