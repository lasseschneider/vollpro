<%--
  Created by IntelliJ IDEA.
  User: Lasse
  Date: 01.06.2016
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Model.User" %>
<%@ page import="Controller.*" %>
<%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*"
%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%
    ArrayList<String> nachrichten = new ArrayList<String>();
    String vorn;
    String nachn;
    String registerSub;
    //ToDo: Geburtsdatum einfügen
    SimpleDateFormat sf = new SimpleDateFormat("dd.MM.YYYY");

    java.sql.Date datuum = new java.sql.Date(sf.parse("12.12.2016").getTime());
    String pw = "";
    String pw2 = "";
    String loginn;
    boolean isVornameValid = false;
    boolean isNachnameValid = false;
    boolean isGebDatumValid = false;
    boolean isLoginnameValid = false;
    boolean isPWValid = false;
    boolean isBirthdayValid = false;
    String birthday;
    java.sql.Date gebTag = null;
    vorn = request.getParameter("vorname");
    nachn = request.getParameter("nachname");
    //gebd = request.getParameter("geburtsdatum").toString();
    pw = request.getParameter("password");
    pw2 = request.getParameter("password2");
    loginn = request.getParameter("login_name");
    registerSub = request.getParameter("registerSubmit");
    birthday = request.getParameter("geburtsdatum");

    try{
        if(!birthday.equals("null"))
        {
            try{
                gebTag = new java.sql.Date( sf.parse(birthday).getTime());
            }catch(ParseException pe)
            {
                pe.printStackTrace();
                gebTag = null;
                nachrichten.add("Geburtstag im Format TT.MM.JJJJ eingeben");
                birthday = "";
            }
        }
    }catch(NullPointerException npe)
    {
        npe.printStackTrace();
        gebTag = null;
        birthday="";
    }

    //check if Vorname is valid and not null
    try {
        if(!vorn.equals("null")) {
            //nachrichten.add("Benutzer " + vorn + " angelegt");
            isVornameValid = true;
        }
    }catch (NullPointerException npe){
        vorn = "";
        nachrichten.add("Bitte Vornamen eintragen");
        isVornameValid = false;
    }
    //check if nachname is valid and not null
    try {
        if(!nachn.equals("null")) {
            isNachnameValid = true;
        }
    }catch (NullPointerException npe){
        nachn = "";
        nachrichten.add("Bitte Nachnamen eintragen");
        isNachnameValid = false;
    }
   try{
       if(!loginn.equals("null")) {
           isLoginnameValid = User.isUserNameValid(loginn);
           if (!isLoginnameValid) {
               nachrichten.add("Username ist schon vergeben");
           }
       }
   }catch(NullPointerException npe)   {
       npe.printStackTrace();
       isLoginnameValid = false;
       loginn = "";
       nachrichten.add("Username ist leer");
   }
try{
    if(!pw.equals("null") && !pw2.equals("null")){
        isPWValid = true;
    }
}catch(NullPointerException npe){
    npe.printStackTrace();
    pw = "";
    pw2 = "";
    nachrichten.add("Passwörter neu eingeben");
}

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="includes/header.jsp" %>
<%@ include file="includes/menu.jsp" %>

<%--
<div class="container">

    <h1>Registrieren</h1>

    <h2><a href="../index.jsp">Index</a> <a href="insert.jsp">Insert</a> <a href="register.jsp">Registrieren</a> </h2>

    <h3>JUNGE!!!</h3>
    <div class="spacer40">
    </div>
--%>
    <div>
        <%if(!isLoginnameValid && !isNachnameValid && !isVornameValid && !isPWValid && !isGebDatumValid){
            %>
        Bitte Folgendes Formular ausgefüllt abschicken<br>

    </div>

    <div class="register">
        <form action="register.jsp" METHOD="POST">

            <em>Vorname:</em><input type="text" name="vorname" value="<%=vorn%>" /><br />

            <em>Nachname:</em><input type="text" name="nachname" value="<%=nachn%>"/><br />


            <em>Geburtdatum:</em><input type="text" name="geburtsdatum"value="<%=birthday%>" /><br />


            <em>Login Name:</em><input type="text" name="login_name" value="<%=loginn%>"/><br />

            <em>Passwort:</em><input type="password" name="password" value="<%=pw%>" /><br />
            <em>Passwort wiederholen:</em><input type="password" name="password2" value="<%=pw2%>" /><br />

            <div class="spacer20"> </div>

            <input type="submit" name ="registerSubmit" value="Registrieren" />
        </form>
    </div>
<%
}else if( !isLoginnameValid || !isNachnameValid || !isVornameValid || !isPWValid || !isGebDatumValid ){
    for(int i=0;i<nachrichten.size();i++){
%><p>
    <%=nachrichten.get(i)%>
</p>

<%
    }

    }else{
        UserController uc = new UserController();
        PersonController pc = new PersonController();
        uc.insertNewUser(loginn,null,pw);
        pc.insertNewPerson(nachn,vorn,gebTag);

        %><br>
        Registrierung war erfolgreich<br>
        Es kann sich mit dem Username <%=loginn%> angemeldet werden.
<%

    }

%>

</div>
<%@ include file="includes/footer.jsp" %>