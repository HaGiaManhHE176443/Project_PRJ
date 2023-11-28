<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="container">
                <div class="row">
                    <div class="col-sm-3">  
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-info text-white"><i class="fa fa-list"></i> CHOOSE YOUR DEMAND</div>
                            <ul class="list-group">
                            <c:forEach items="${listCC}" var="o">
                                <!--=========category=========-->
                                <li class="list-group-item text-white"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                                </c:forEach>

                        </ul>
                    </div>
                    <div class="card bg-light mb-3">

                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQMNQlKhacsDQfCJuNQ5PtHldRF1FM-kCFsA&usqp=CAU" alt="voucher"/>

                    </div>
                </div>

                <div class="col-sm-9">
                    <div class="row">
                        <c:forEach items="${listP}" var="o">
                            <div class="col-sm-4">    
                                <div class="card">
                                    <div class="image">
                                        <a href="detail?pid=${o.id}"> <img src="${o.image}" alt="Show Detail"/> </a>
                                    </div>

                                    <div class="card-body">
                                        <!--==========detail========-->
                                        <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                        <p class="card-text show_txt">${o.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block text-dark    " style="background-color: #e3f2fd;">$ ${o.price}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>



        <jsp:include page="Footer.jsp"></jsp:include>    

    </body>
</html>

