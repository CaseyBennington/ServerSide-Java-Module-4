<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="eshop" uri="EShopFunctionTagLibrary" %>

<c:set var="EXAMPLE" value="/myShoppingCart"/>
<c:set var="SHOP_PAGE" value="/estore.jsp"/>
<c:import url="../includes/header.jsp" />
<%@ page  session="true" %>

<p>Thank you for shopping with us!<br>
    Purchased On: ${eshop:getCurrentDate()} /><br>
    Your Information:</p>
<table cellspacing="5" border="0">
    <tr>
        <td align="left">First Name: ${user.first}</td>
    </tr>
    <tr>
        <td align="left">Last Name: ${user.last}</td>
    </tr>
    <tr>
        <td align="left">Email: ${user.email}</td>
    </tr>
    <tr>
        <td align="left">User ID: ${user.userID}</td>
    </tr>        
</table>
<table width="600">
    <tr>
        <td>
            <h1></h1>
            <table border="1" width="600">
                <tr><th colspan="4">Your Purchase Summary</th></tr>
                <tr><th align="center">Quantity</th>
                    <th align="center">Item</th>
                    <th align="center">Price</th>
                    <th align="center">SubTotal</th>
                    <c:forEach var="curItem" items="${lineitems}">
                        <c:set var="myQuan" value="${curItem.quantity}"/>
                        <c:set var="myDesc" value="${curItem.desc}"/> 
                        <c:set var="myPrice" value="${curItem.price}"/>
                        <c:set var="subTotal" value="${myPrice * myQuan}"/>                       
                        <c:set var="tax" value="${subTotal*.08}"/>
                        <c:set var="grandTotal" value="${tax + subTotal}"/>
                    <tr>
                        <td align="center">${myQuan}</td>
                        <td align="center">${myDesc}</td>
                        <td align="center"><fmt:formatNumber value="${myPrice/100}" type="currency"/></td>
                        <td align="center"><fmt:formatNumber value="${subTotal/100}" type="currency"/></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4"> &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><b>Tax:</b></td>
                    <td align="center"><fmt:formatNumber value="${tax/100}" type="currency"/></td>
                    <%-- <c:set var="grandTotal" value="${myExtTotal/100 + myExtTotal * .08/100}" /> --%>
                </tr>
                <tr>
                    <td colspan="3" align="right"><b>Total:</b></td>
                    <td align="center"><fmt:formatNumber value="${grandTotal/100}" type="currency"/></td>
                </tr>
            </table>
        </td>
    </tr>
    <p>
        <c:url value="${EXAMPLE}${SHOP_PAGE}" var="localURL"/>
        <a href="${localURL}">Return to Home Page</a>
    </p>
</table>
<c:import url="../includes/footer.jsp" />