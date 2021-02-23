<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h3>【いいねした人一覧】</h3>
        <table id ="good_list">
            <tbody>
              <tr>
                <th class="good_name">氏名</th>
                <th class="good_date">日付</th>
              </tr>
              <c:forEach var="good" items="${goods}" varStatus="status">
                <tr>
                    <td class="good_name"><c:out value="${good.employee.name}" /></td>
                    <td class="good_date"><fmt:formatDate value='${good.created_at}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
                </tr>
              </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            (全 ${goods_count}件) <br />
            <c:forEach var="i" begin="1" end="${((goods_count -1) / 10) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/goods/index?page=${i}&id=${report.id}' />"><c:out value="${i}" /></a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/reports/index' />">一覧に戻る</a></p>
    </c:param>
</c:import>

