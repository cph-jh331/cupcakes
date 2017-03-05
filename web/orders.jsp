<%-- 
    Document   : newjsp
    Created on : 04-03-2017, 15:17:47
    Author     : Bloch
--%>

<%@page import="entyties.Order"%>
<%@page import="entyties.User"%>
<%@page import="entyties.OrderLine"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%User user = (User) session.getAttribute("user");%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <title>Orders</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="wrapper">
                <nav class="navbar navbar-default navbar-fixed-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Glårious Cupcakes</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="#">Home</a></li>

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <%= user.getName()%>
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Balance: <%= user.getForBal()%></a></li>
                                        <li><a href="#">action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li role="separator" class="divider"></li>                                    
                                        <li>
                                            <a href="#">
                                                <form action="Controller1" method="post">
                                                    <input type="hidden" name="testorigin" value="logout">
                                                    <input type="submit" name="Logout" value="Logout">
                                                </form> 
                                            </a>
                                        </li>                                  
                                    </ul>
                                </li>
                                </li>
                                <li class="active"><a href="#">Orders</a></li>
                                <li><a href="#contact">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>    

                <header class="container">
                    <div class="jumbotron">
                        <h1>Glårious Cupcakes</h1> 
                    </div>
                </header>

                <main>
                    <div class="container">
                        <div class="collapse">
                            <ul class="list-group">                              
                                
                                
                            </ul>
                        </div>



                </main>

            </div>




    </body>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</html>
