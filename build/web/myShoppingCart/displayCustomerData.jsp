<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="eshop" uri="EShopFunctionTagLibrary" %>

<c:import url="../includes/header.jsp" />
<%@ page  session="true" %>

<c:set target = "${user}" property = "first" value="${param.first}" />
<c:set target = "${user}" property = "last" value="${param.last}" />

<c:choose>
    <c:when test='${user.first == null}'>       
        <c:set var="message" value="Please enter your first name and last name" />
    </c:when>
    <c:when test='${user.first == ""}'>       
        <c:set var="message" value="Please enter your first name and last name" />
    </c:when>
    <c:when test='${user.last == ""}'>       
        <c:set var="message" value="Please enter your first name and last name" />
    </c:when>
    <c:when test='${user.last == null}'>       
        <c:set var="message" value="Please enter your first name and last name" />
    </c:when>
    <c:otherwise>
        <c:url value="../myShoppingCart/summary.jsp" var="localURL" />
        <c:redirect url="${localURL}" />
    </c:otherwise>
</c:choose>

<h3>${message}</h3>

<form action = "displayCustomerData.jsp" method="post">
    <table cellspacing="5" border="0">
        <tr>
            <td align="right">First Name:</td>
            <TD><input type="text" size="40" name="first"
                       value='${user.first}'  /></TD>
        </tr>
        <tr>
            <td align="right">Last Name:</td>
            <TD><input type="text" size="40" name="last"
                       value='${user.last}'/></TD>
        </tr>
        <tr>
            <td align="right">Email address:</td>
            <TD><input type="text" size="40" name="email" id="email"
                       value="${user.email}" disabled /></TD>
        </tr>
        <tr>
            <td align="right">Password:</td>
            <TD><input type="text" size="24" name="phone"
                       value="${user.password}" disabled /> </TD>
        </tr>
        <tr>
            <td></td>
            <td><br><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
<c:import url="../includes/footer.jsp" />