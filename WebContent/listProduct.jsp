<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.supinfo.sun.supcommerce.bo.SupProduct"%>
<%@ page import="com.supinfo.sun.supcommerce.doa.SupProductDao"%>
<%@ page import="java.util.List"%>

<%
String error = "No product registered !";
Boolean remove = false;
final List<SupProduct> products = SupProductDao.getAllProducts();

//Remove possibility
if(session.getAttribute("username") != null && session.getAttribute("username") instanceof String)
	remove = true;
%>

<!DOCTYPE html>
<html lang="en">
 				
<head>
 	<meta charset="UTF-8">
 	<meta content="IE=edge" http-equiv="X-UA-Compatible">
 	<meta content="width=device-width, initial-scale=1.0" name="viewport">
 	<title>ListProduct | SupCommerce</title>
 	<%-- CSS --%> 
 	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/sticky-footer.css">
 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">					
</head>
 					
<body>

<div id="wrap">	

	<%@include file="/WEB-INF/template/header.jsp" %>
	
	<section id="main-container" class="container">
		<div class="page-header">
			<h1>Product List</h1>
		</div>
		
		<% if(products.isEmpty()) { %>
			<p class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <%= error %></p>
		<% } else { %>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th><span class="badge">Id</span></th>
						<th>Name</th>
						<th>Description</th>
						<th>Price</th>
						<% if(remove) { %>
							<th><span class="glyphicon glyphicon-wrench"></span>&nbsp; </th>
						<% } %>
					</tr>
				</thead>
				<tbody>
					<% for(SupProduct p : products) { %>
						<tr>							
							<td><a href="${pageContext.servletContext.contextPath}/showProduct.jsp?id=<%= p.getId()%>"><span class="badge"><%= p.getId()%></span></a></td>
							<td class="text-muted"><%= p.getName() %></td>
							<td class="text-muted"><%= p.getContent() %></td>
							<td class="text-muted"><%= p.getPrice() %> €</td>
							<% if(remove) { %>							
							<td>
								<form action="${pageContext.servletContext.contextPath}/auth/removeProduct?id=<%= p.getId() %>" method="post">
									<button type="submit" class="close" >&times;</button>
								</form>
							</td>
						<% } %>
						</tr>
					<% } %>
				</tbody>
			</table>
		<% } %>
		
	</section>
	
	<div id="push"></div>
	
</div>	
	 
<%@include file="/WEB-INF/template/footer.jsp" %>

</body>
</html>