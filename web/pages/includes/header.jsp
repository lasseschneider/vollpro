<%@ page import="Model.Session" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Lasse
  Date: 03.07.2016
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%
    String session_id = session.getId();
    SessionController sc = new SessionController();
    boolean sessionFlag = sc.doesSessionExists(session_id);
    boolean isUserLoggedIn = sc.isSessionValid(session_id);
    if(!sc.doesSessionExists(session_id))
    {
        sc.setNewSession(session_id);
    }
    Session currentSession = sc.getSessionBySessionID(session_id);
    UserController userController = new UserController();
    String logout = request.getParameter("logout");
    String username = request.getParameter("loginname");
    String Password = request.getParameter("loginpass");
    try{
        if(username.equals("null"))    {
            username = "Loginname";
            Password = "";
        }
    }catch (NullPointerException npe)    {
        npe.printStackTrace();
        username = "Loginname";
        Password = "";
    }
    User user = userController.isUserValidByLoginName(username,Password);
    if(!currentSession.isLoggedIn() && user != null)
    {
        currentSession.setLoggedIn(true);
        currentSession.setUser(user);
        sc.updateSession(currentSession);
    }
%>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title>VollPro bRef</title>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <style>
        body { padding: 30px; }
        tr:nth-child(even) { background-color: #eeeeee; }
        #content { float: left; padding: 20px; }
        #menu { float: left; width: 200px; padding: 20px; }
        .login_container{float:right;}
    </style>
</head>
<body>
<h1>VollPro bRef</h1>
<div class = "login_container">
    <%
        if(currentSession.isLoggedIn()){
            %>
    Eingelogged als <%=currentSession.getUser().getLogin_name()%>.<br>
    Login gültig bis <%=( currentSession.getLoggedInUntil())%>.
    <%
        }else{
    %>
    <form action="../index.jsp" method="POST">
        User:<input type="text" name="loginname" value=<%=username%> /><br />
        Pass:<input type="password" name="loginpass"value=<%=Password%> /><br />
        <input type="submit" name="anmelden" value="Anmelden" /><br />
        <%--<input type="submit" name="registrieren" value="noch nicht registriert?" />--%>
    </form>
<%
    }//ende else zweig
%>
</div>
