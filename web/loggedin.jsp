<%-- 
    Document   : loggedin
    Created on : 01-03-2017, 15:39:01
    Author     : Bloch
--%>

<%@page import="entyties.OrderLine"%>
<%@page import="cake.CakeBottom"%>
<%@page import="cake.CakeTopping"%>
<%@page import="java.util.List"%>
<%@page import="entyties.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%User user = (User) session.getAttribute("user");%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">        
        <title>Hello <%=user.getName()%></title>
    </head>
    <body onload="myFunction4()">
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
                            <li class="active"><a href="#">Home</a></li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <%
                                        List<OrderLine> cartList = (List<OrderLine>) request.getSession().getAttribute("cartList");
                                    %>
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
                    <h1>MAKE A CUPCAKE!</h1>
                    <div class="row">
                        <form action="Controller1" method="post">
                            <div class="col-sm-4 col-md-3">                                
                                <h2>Choose Topping</h2>
                                <%
                                    List<CakeTopping> topList = (List<CakeTopping>) request.getSession().getAttribute("topList");
                                    for (CakeTopping cakeTopping : topList)
                                    {
                                %>
                                <div class="radio">
                                    <label><input type="radio" id="radio1" name="toppings" onclick="myFunction1(<%=cakeTopping.getPrice()%>);myFunction3();myFunction5(<%=user.getBalance()%>);" value="<%=cakeTopping.getName()%>" required/> <%=cakeTopping.getName()%></label>
                                </div>
                                <%
                                    }
                                %>
                                <p1 id="result1">0</p1>                                
                            </div>
                            <div class="col-sm-4 col-md-3">                                
                                <h2>Choose Bottom</h2>
                                <%
                                    List<CakeBottom> botList = (List<CakeBottom>) request.getSession().getAttribute("botList");
                                    for (CakeBottom cakeBottom : botList)
                                    {
                                %>
                                <div class="radio">
                                    <label><input type="radio" id="radio2" name="bottoms" onclick="myFunction2(<%=cakeBottom.getPrice()%>);myFunction3();myFunction5(<%=user.getBalance()%>);" value="<%=cakeBottom.getName()%>" required/> <%=cakeBottom.getName()%></label>
                                </div>
                                <%
                                    }
                                %>
                                <p1 id="result2">0</p1>
                            </div>
                            <div class="col-sm-4 col-md-3">
                                <h2>Quantity<input class="form-control" name="quantity" min="1" value="1" type="number" id="numbCakes" onclick="myFunction3();myFunction5(<%=user.getBalance()%>);" onkeyup="myFunction3();myFunction5(<%=user.getBalance()%>);" required></h2>
                            </div>
                            <div class="col-sm-4 col-md-3">
                                <h3 id="balance1" value="<%=user.getBalance()%>">Your Balance:<br><%=user.getBalance()%></h3>
                                <h3>Price of Cupcake:<br><span id="price" value="0">0</span></h3>
                                <input type="hidden" name="addtocart" value="addtocart"/>
                                <input class="btn btn-primary" type="submit" id="adder" name="add to cart" value="add to cart"/>
                            </div>
                        </form>
                    </div>
                    <div class="jumbotron" >
                        <form action="Controller1" method="post">
                            <div class="row">
                                <div class="col-sm-4 col-md-3">
                                    <h2><%=user.getName()%>'s cart</h2>
                                </div>
                                <div class="col-sm-4, col-md-offset-10">
                                    <h3 id="totalPrice" value="0"></h3>

                                </div>
                            </div>
                            <ul class="list-group" name ="hest" id="zeCart">
                                <%
                                    for (OrderLine orderLine : cartList)
                                    {
                                %>

                                <li class="list-group-item" name="test" value="<%=orderLine.getPrice()%>"><%=orderLine%>
                                    <a href="Controller1?removeOrderLine=<%=orderLine.getInfo()%>">remove</a></li>

                                <%
                                    }
                                %>                            
                            </ul>
                            <input type="hidden" name="submitOrder" value="submitOrder"/>
                            <input class="btn btn-primary" type="submit" name="Submit Order" value="Submit order!"/>
                        </form>
                    </div>
                </div>
        </div>
    </main>
</div>
</body>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myscripts.js"></script>
</html>
