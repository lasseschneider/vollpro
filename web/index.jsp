<%@ page import="Controller.*" %>
<%@ page import="Model.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Lasse
  Date: 10.05.2016
  Time: 15:13
  To change this template use File | Settings | File Templates.

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="pages/includes/header_code.jsp" %>


<%@ include file="pages/includes/header.jsp" %>
<%@ include file="pages/includes/menu.jsp" %>

<%
RefereeController rc = new RefereeController();
    ArrayList<Referee> arList = rc.getAllReferees();
    for (int i = 0; i < arList.size(); ++i){
%>
    <%--=arList.get(i).getPerson().getName()--%><br>
<%}
    ArrayList<Person> persList = CSVParser.getPersonList("C:\\Users\\Lasse\\Documents\\Studium\\Praxisprojekt\\Turnierinsert.csv");
%>
<%=persList.get(1).getName()%>
<%
PersonController per = new PersonController();
    boolean abc = per.insertPersons(persList);
    int newOid = per.getNewOID();
%><%=abc%><br><%=newOid%>
<%@ include file ="pages/includes/footer.jsp" %>



