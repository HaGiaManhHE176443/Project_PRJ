<%-- 
    Document   : Cate_Content
    Created on : Jul 9, 2023, 12:03:46 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-info text-white"><i class="fa fa-list"></i> CATEGORIES</div>
        <ul class="list-group">
            <!--                    <ul class="list-group category_block">-->
            <c:forEach items="${listCC}" var="o">
                <!--=========category=========-->
                <li class="list-group-item text-white"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                </c:forEach>

        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div class="card bg-light mb-3">

            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQMNQlKhacsDQfCJuNQ5PtHldRF1FM-kCFsA&usqp=CAU" alt="voucher"/>

        </div>
    </div>
</div>

