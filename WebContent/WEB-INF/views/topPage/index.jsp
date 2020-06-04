<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>日報 一覧</h2>
        <table>
            <tr>
                <th>社員番号</th>
                <th>氏名</th>
                <th>操作</th>
            </tr>
            <c:forEach var="employee" items="${employees}" varStatus="status">
                <tr class="row${status.count % 2}">
                    <td><c:out value="${employee.code}"/></td>
                    <td><c:out value="${employee.name}"/></td>
                    <td>
                        <c:choose>
                             <c:when test="${employee.delete_flag == 1}">
                                 (削除済み)
                             </c:when>
                             <c:otherwise>
                                  <a href="${pageContext.request.contextPath}/employees/show?id=${employee.id}">詳細を表示</a>
                             </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <div id="pagination">
            (全 ${employees_count} 件) <br />
            <c:forEach var="i" begin="1" end="${(employees_count - 1) / 15 + 1}" step="1">
                <c:choose>
                    <c:when test="${page == i}">
                        <c:out value="${i}"></c:out>&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/index?page=${i}"><c:out value="${i}"></c:out></a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p><a href="<c:url value='/employees/new' />">新規従業員の登録</a></p>
    </c:param>
</c:import>