<%-- 
    Document   : addProduct
    Created on : 4 May 2020, 10:26:24
    Author     : hyoku
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
      
        <form:form method="POST" action="/A2PartD/product/addProduct"  modelAttribute="product">
            <table>
                <tr> 
                    <td><form:label path="code">Code</form:label></td>
                    <td><form:input path="code"/></td> 
                    <td style="color:red"><form:errors path="code"/> </td>
               </tr> 
                <tr>
                    <td><form:label path="name">Name</form:label></td>
                    <td><form:input path="name" /></td>
                    <td style="color:red"><form:errors path="name"/> </td>
                </tr>
                <tr>
                    <td><form:label path="description">Description</form:label></td>
                    <td><form:input path="description"/></td>
                    <td style="color:red"><form:errors path="description"/> </td>
                    
                </tr>
                <tr>
                    <td><form:label path="buyPrice">Buy Price</form:label></td>
                    <td><form:input path="buyPrice"/></td>
                    <td style="color:red"> <form:errors path="buyPrice"/> </td>
                </tr>
               <tr>
                    <td><form:label path="sellPrice">Sell Price</form:label></td>
                    <td><form:input path="sellPrice"/></td>
                    <td style="color:red"> <form:errors path="sellPrice"/> </td>
                </tr>
               
                <tr>
                    
                    <td><form:label path="quantityInStock">Quantity In Stock</form:label></td>
                    <td><form:input type="quantityInStock" path="quantityInStock"/></td>
                    <td style="color:red"> <form:errors path="quantityInStock"/> </td>
                   
                </tr>
                <tr>
                    <td><input type="submit" value="Add Product"/></td>
                </tr>
            </table>
        </form:form>
    </body>
</html>