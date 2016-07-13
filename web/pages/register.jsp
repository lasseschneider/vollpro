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
<%@ include file="includes/header_code.jsp" %>
<%
    ArrayList<String> nachrichten = new ArrayList<String>();
    String vorn;
    String nachn;
    SimpleDateFormat sf         = new SimpleDateFormat("dd.MM.yyyy");
    String pw                   = "";
    String pw2                  = "";
    String loginn;
    boolean isVornameValid      = false;
    boolean isNachnameValid     = false;
    boolean isGebDatumValid     = false;
    boolean isLoginnameValid    = false;
    boolean isPWValid           = false;
    String birthday;
    java.sql.Date gebTag        = null;
    vorn                        = request.getParameter("vorname");
    nachn                       = request.getParameter("nachname");
    pw                          = request.getParameter("password");
    pw2                         = request.getParameter("password2");
    loginn                      = request.getParameter("login_name");
    birthday                    = request.getParameter("geburtsdatum");

    //check, if Date Format is Valid and not null
    try{
        if(!birthday.equals("null"))
        {
            try{
                gebTag = new java.sql.Date( sf.parse(birthday).getTime());
                isGebDatumValid = true;
            }catch(ParseException pe)
            {
                pe.printStackTrace();
                gebTag = null;
                nachrichten.add(" Geburtstag im Format TT.MM.JJJJ eingeben. ");
                birthday = "";
            }
        }
    }catch(NullPointerException npe)
    {
        npe.printStackTrace();
        gebTag      = null;
        birthday    = "";
    }

    //check if First Name is valid and not null
    try {
        if(!vorn.equals("null")) {
            isVornameValid = true;
        }
    }catch (NullPointerException npe){
        vorn                = "";
        nachrichten.add("Bitte Vornamen eintragen");
        isVornameValid      = false;
    }
    //check if last name is valid and not null
    try {
        if(!nachn.equals("null")) {
            isNachnameValid = true;
        }
    }catch (NullPointerException npe){
        nachn               = "";
        nachrichten.add("Bitte Nachnamen eintragen");
        isNachnameValid     = false;
    }

    //check if username is valid and not null
   try{
       if(!loginn.equals("null")) {
           isLoginnameValid = User.isUserNameValid(loginn);
           if (!isLoginnameValid) {
               nachrichten.add("Username ist schon vergeben");
           }
       }
   }catch(NullPointerException npe)   {
       npe.printStackTrace();
       isLoginnameValid     = false;
       loginn               = "";
       nachrichten.add("Username ist leer");
   }

    //Check if both passwords are equal and not null
try{
    if(!pw.equals("null") && !pw2.equals("null")){
        isPWValid = true;
    }
}catch(NullPointerException npe){
    npe.printStackTrace();
    pw              = "";
    pw2             = "";
    nachrichten.add("Passwörter neu eingeben");
}

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="includes/header.jsp" %>
<%@ include file="includes/menu.jsp" %>

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
        UserController userCon   = new UserController();
        PersonController perCo = new PersonController();
        User newUser = userCon.insertNewUser(loginn,pw);
        perCo.insertNewPerson(nachn,vorn,gebTag);
        if (newUser != null) {

        %><br>
        Registrierung war erfolgreich<br>
        Es kann sich mit dem Username <%=newUser.getLogin_name()%> angemeldet werden.
<%  }
else{%>
Alles Scheiße<br>
<%}  } %>
</div>
<%@ include file="includes/footer.jsp" %>