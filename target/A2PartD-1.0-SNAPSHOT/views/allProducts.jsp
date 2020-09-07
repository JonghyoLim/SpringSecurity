<%-- 
    Document   : allProducts
    Created on : 4 May 2020, 10:25:27
    Author     : hyoku
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  

<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Products</title>
    </head>         
    
    <security:authorize access="!isAuthenticated()"><a href="/A2PartD/login">Login</a></security:authorize>
    <security:authorize access="isAuthenticated()">   Welcome <security:authentication property="principal.username"/> <a href="/A2PartD/logout">Logout</a></security:authorize>
   
    
   <body>
        <table style="width:100%">
            <tr>
            <th align="left">Code</th>
             <th align="left">Name</th>
             <th align="left">Description</th>
             <th align="left">Buy Price</th>
             <th align="left">Sell Price</th>
             <th align="left">Qty In Stock</th>
             <th align="left">Actions</th>
            </tr>
            <c:forEach items="${productList}" var="product"> 
                <tr>
                    <td>${product.code}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td><fmt:formatNumber value="${product.buyPrice}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/> </td>
                    <td><fmt:formatNumber value="${product.sellPrice}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/> </td>
                    <td>${product.quantityInStock}</td>
                    
                    <security:authorize access="hasRole('Admin')">
                    <td>
                        <a href="/A2PartD/product/delete?code=${product.code}" class="button-link" onclick="return confirm('Are you sure you want to delete product?')">Delete</a>  
                    </td>
                    </security:authorize>
                    
                    <security:authorize access="hasRole('SuperAdmin')">
                    <td><a href="/A2PartD/product/add">Insert<a>
                        <a href="/A2PartD/product/delete?code=${product.code}" class="button-link" onclick="return confirm('Are you sure you want to delete product?')">Delete</a>  
                    </td>
                    </security:authorize>
                    
                    
               
                    
                </tr>
            </c:forEach>
        </table>
             
    </body>
</html>