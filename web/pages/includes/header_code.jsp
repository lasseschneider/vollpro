<%@ page import="Controller.SessionController" %>
<%@ page import="Model.Session" %>
<%@ page import="Controller.UserController" %>
<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: Lasse
  Date: 13.07.2016
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    boolean wrongEntry;
    if(Password.equals("") && username.equals("Loginname")){
        wrongEntry = false;
    }else{
        wrongEntry = true;
    }
    if(!currentSession.isLoggedIn() && user != null)
    {
        currentSession.setLoggedIn(true);
        currentSession.setUser(user);
        sc.updateSession(currentSession);
    }
%>
