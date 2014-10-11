<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="EXAMPLE" value="/myShoppingCart"/>
<c:set var="SHOP_PAGE" value="/estore.jsp"/>
<c:import url="../includes/header.jsp" />
<%@ page  session="true" %>

<h3>${message}</h3>
<form action = "CheckUser" method="post">
    <table cellspacing="5" border="0">
        <tr>
            <td align="right">Email address:</td>
            <td><input type="text" name="email" id="email" value="${email}"></td>
        </tr>
        <tr>
            <td align="right">Password:</td>
            <td><input type="password" name="password" id="password" value="${password}"></td>
        </tr>
        <tr>
            <td></td>
            <td><br><input type="submit" value="Submit"></td>

        </tr>
    </table>
    <p>
        <c:url value="${EXAMPLE}${SHOP_PAGE}" var="localURL"/>
        <a href="${localURL}">Return to Home Page</a>
    </p>
</form>
<c:import url="../includes/footer.jsp" />