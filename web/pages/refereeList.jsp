<%@ page import="Controller.PersonController" %>
<%@ page import="Model.Person" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Lasse
  Date: 13.07.2016
  Time: 20:40
  To change this template use File | Settings | File Templates.
  From: PRG4 - JSP - Vorlesung
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="includes/header_code.jsp" %>
<%
String Message = "";
    if(!currentSession.isLoggedIn())
    {
        Message = "Bitter erst einloggen.";
    }
%>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/menu.jsp" %>
<%
if(currentSession.isLoggedIn()){
%>
<div id="content">
    <h2>Person List</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Vorname</th>
            <th>Nachname</th>
            <th>Geburtstag</th>
        </tr>
        </thead>
        <tbody>
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
            PersonController persController = new PersonController();
            List<Person> person = persController.getPersonList();
            for( int i = 0; i < person.size(); ++i )
            {
        %>
        <tr>
            <td><%=person.get(i).getOID() %></td>
            <td><%=person.get(i).getName() %></td>
            <td><%=person.get(i).getLastName() %></td>
            <td><%=sdf.format(person.get(i).getBirthday()) %></td>
            <td>
                <%--<a href="edit_person_form.jsp?id=<%=person.getId() %>"
                   class="btn btn-default btn-xs“>Edit</a>--%>
<a href="delete_person.jsp?id=<%=person.get(i).getOID() %>"
class="btn btn-danger btn-xs">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
<%}
else{
    %>
<%=Message%><br>
<%
}%>
<%@ include file="includes/footer.jsp" %>
