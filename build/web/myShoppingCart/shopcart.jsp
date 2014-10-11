<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="eshop" uri="EShopFunctionTagLibrary" %>

<c:set var="EXAMPLE" value="/myShoppingCart"/>
<c:set var="SHOP_PAGE" value="/estore.jsp"/>
<c:set var="CART_PAGE" value="/shopcart.jsp"/>
<c:set var="CHECKOUT_PAGE" value="/checkOut.jsp"/>
<c:set var="SUMMARY_PAGE" value="/summary.jsp"/>

<c:import url="../includes/header.jsp" />
<%@ page  session="true" %>

<c:if test="${!(empty param.sku)}">
    <c:set var="prod" value="${eshop:getItem(param.sku)}"/>
</c:if>

<jsp:useBean id="lineitems" class="java.util.ArrayList" scope ="session"/>

<c:choose>
    <c:when test="${param.action == 'clear'}">
        ${eshop:clearList(lineitems)}
    </c:when>

    <c:when test="${param.action == 'remove'}">
        <c:forEach var="curItem" items="${lineitems}">
            <c:if test="${(curItem.sku) == (prod.sku)}">
                <c:choose>
                    <c:when test="${(curItem.quantity) == 1}">
                        <c:choose>
                            <c:when test="${(lineitems.size()) == 1}">

                                <c:url value="${EXAMPLE}${CART_PAGE}" var="localURL">
                                    <c:param name="action" value="clear"/>
                                </c:url>                                                               
                                <c:redirect url="${localURL}" />
                            </c:when>
                            <c:otherwise>
                                ${eshop:removeFromList(lineitems,curItem)}
                            </c:otherwise>
                        </c:choose>                             
                    </c:when>
                    <c:otherwise>
                        <jsp:setProperty name="curItem" property="quantity" 
                                         value="${curItem.quantity - 1}"/>       
                    </c:otherwise>
                </c:choose>
            </c:if>            
        </c:forEach>       
    </c:when>

    <c:when test="${param.action == 'inc' || param.action=='buy'}">
        <c:set var="found" value="false"/>
        <c:forEach var="curItem" items="${lineitems}">
            <c:if test="${(curItem.sku) == (prod.sku)}">                
                <jsp:setProperty name="curItem" property="quantity" value="${curItem.quantity + 1}"/> 
                <c:set var="found" value="true" />
            </c:if>        
        </c:forEach>
        <c:if test="${!found}">
            <c:remove var="tmpitem"/>
            <jsp:useBean id="tmpitem" class="cart.LineItem">
                <jsp:setProperty name="tmpitem" property="quantity" value="1"/> 
                <jsp:setProperty name="tmpitem" property="sku" value="${prod.sku}"/> 
                <jsp:setProperty name="tmpitem" property="desc" value="${prod.name}"/> 
                <jsp:setProperty name="tmpitem" property="price" value="${prod.price}"/>
            </jsp:useBean>
            ${eshop:addList(lineitems, tmpitem)}
        </c:if>
    </c:when>
</c:choose>  

<c:set var="total" value ="0"/>

<table width="600">
    <tr>
        <td>
            <h1></h1>
            <table border="1" width="600">
                <tr><th colspan="6">Your Shopping Cart</th></tr>
                <tr><th align="center">Quantity</th>
                    <th align="center">Item</th>
                    <th align="center">Price</th>
                    <th align="center">SubTotal</th>
                    <th align="center">Add  </th>
                    <th align="center">Remove  </th></tr>
                    <c:forEach var="curItem" items="${lineitems}">
                        <c:set var="subTotal" value="${curItem.quantity * curItem.price}"/>
                        <c:set var="tax" value="${subTotal * .08}"/> 
                        <c:set var="withTax" value="${tax + subTotal}"/> 
                    <tr>
                        <td>${curItem.quantity}</td>
                        <td>${curItem.desc}</td>
                        <td align="right"><fmt:formatNumber value="${curItem.price / 100}" type="currency"/></td>
                        <td align="right"><fmt:formatNumber value="${subTotal / 100}" type="currency"/></td>
                        <td>
                            <c:url value="${EXAMPLE}${CART_PAGE}" var="localURL">
                                <c:param name="action" value="inc"/>
                                <c:param name="sku" value="${curItem.sku}"/>
                            </c:url>
                            <a href="${localURL}"><b><img src="../images/add_1.jpg" width="50" height="50"></b></a>
                        </td>
                        <td>
                            <c:url value="${EXAMPLE}${CART_PAGE}" var="localURL">
                                <c:param name="action" value="remove"/>
                                <c:param name="sku" value="${curItem.sku}"/>
                            </c:url>
                            <a href="${localURL}"><b><img src="../images/remove_1.jpg" width="50" height="50"></b></a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="6"> &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><b>Tax:</b></td>
                    <td align="right"><fmt:formatNumber value="${tax/100}" type="currency"/></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><b>Total:</b></td>
                    <td align="right"><fmt:formatNumber value="${withTax/100}" type="currency"/></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <c:url value="${EXAMPLE}${CART_PAGE}" var="localURL">
                        <c:param name="action" value="clear"/>
                    </c:url>
                <a href="${localURL}">Clear the cart</a>
    </tr>
    <tr>
        <td colspan="6">
            <c:url value="${EXAMPLE}${SHOP_PAGE}" var="localURL"/>
            <a href="${localURL}">Return to Shopping</a>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <c:url value="${EXAMPLE}${CHECKOUT_PAGE}" var="localURL">
            </c:url>
            <a href="${localURL}">Checkout</a>
        </td>
    </tr>
</table>
</td>
</tr>
</table>
<c:import url="../includes/footer.jsp" />