<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--Main Navigation-->
<header>
<nav class="navbar navbar-expand-lg navbar-dark default-color-dark fixed-top">
    <a class="navbar-brand" href="/">App Name</a>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item">
                <a style="color:#FFFFFF" href="#">${pageContext.request.userPrincipal.name}</a>
            </li>
            <li class="nav-item">
            	<a class="nav-link" onclick="document.forms['logoutForm'].submit()">Logout</a>
            </li>
         </ul>
         </div>
    </c:if>
</nav>
</header>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
		
		<div class="row col-md-9 col-md-offset-2 custyle">
	        <h3>Document List</h3>
		</div>
       
        
        
	    <div class="row col-md-6 col-md-offset-2 custyle">
	    	<c:choose>
	        	<c:when test="${not empty docsList}">
				    <table class="table table-striped custab">
					    <thead>
					        <tr>
					            <th>Title</th>
				        		<th>Description</th>
					            <th class="text-center">Action</th>
					        </tr>
					    </thead>
					    <c:forEach var="doc" items="${docsList}">
				            <tr>
				                <td><c:out value="${doc.title}"/></td>
		   						<td><c:out value="${doc.description}"/></td>
				                <td class="text-center"><a class='btn btn-info btn-xs' href="${doc.link}" download><span class="glyphicon glyphicon-download"></span> Download</a></td>
				            </tr>
			            </c:forEach>
			    	</table>
		    	</c:when>
		    	<c:otherwise>
		        	<h5>No document to display</h5>
		        </c:otherwise>
	        </c:choose>
	    </div>
    </c:if>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
