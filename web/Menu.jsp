<%-- 
    Document   : Menu.jsp
    Created on : Jul 7, 2023, 5:02:08 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--begin of menu-->
<nav class="navbar navbar-expand-md" style="background-color: #e3f2fd;">
    <div class="container">
        <a class="navbar-brand" href="home">Welcome to our World</a>
        <!--                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>-->

        <div class="collapse navbar-collapse justify-content-end" id="Categories">
            <ul class="navbar-nav m-auto">
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="manage">Manager Product</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hello ${sessionScope.acc.user}</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="logout">LOGOUT</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="Login.jsp">LOGIN</a>
                    </li>
                </c:if>               
            </ul>


            <!--                    =========================-->
            <form action="search" method="post" class="form-inline">
                <div class="input-group">
                    <input name="txt" type="text" class="form-control" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
<!--                <a class="btn btn-success btn-sm ml-3" href="show">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light">3</span>
                </a>-->
            </form>
        </div>
    </div>
</nav>



<div class="main_banner">
    <img src="https://assets.eflorist.com/images/homepage/immersion/immersion-get-well-flowers.jpg?1665626603354" style="margin: auto; width:100%;">       
</div>            
<br>