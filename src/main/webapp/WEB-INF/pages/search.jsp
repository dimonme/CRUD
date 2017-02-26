<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
  <title>Результат поиска</title>

  <style type="text/css">
    .tg {
      border-collapse: collapse;
      border-spacing: 0;
      border-color: #ccc;
    }

    .tg td {
      font-family: Arial, sans-serif;
      font-size: 14px;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #fff;
    }

    .tg th {
      font-family: Arial, sans-serif;
      font-size: 14px;
      font-weight: normal;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #f0f0f0;
    }

    .tg .tg-4eph {
      background-color: #f9f9f9
    }
  </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>
<form name="searchForm" action="/search" method="get" >
  <td align="center" colspan="2">
    Имя: <input type="text" id="requestName" name="requestName">
    <input type="submit" value="Поиск" /></td>
</form>
<br/>
<br/>

<h1>Результат поиска</h1>

<c:if test="${!empty listUsers}">
  <table class="tg">
    <tr>
      <th width="70">id</th>
      <th width="100">Имя</th>
      <th width="10">Возраст</th>
      <th width="70">Администратор</th>
      <th width="100">Дата создания</th>
      <th width="60">Редактировать</th>
      <th width="60">Удалить</th>
    </tr>
    <c:forEach items="${listUsers}" var="user">
      <tr>
        <td>${user.id}</td>
        <td><a href="/userdata/${user.id}" target="_blank">${user.name}</a></td>
        <td>${user.age}</td>
        <td>${user.admin}</td>
        <td>${user.createdDate}</td>
        <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
        <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
      </tr>
    </c:forEach>
  </table>
</c:if>


<h1>Добавить пользователя</h1>

<c:url var="addAction" value="/users/add"/>

<form:form action="${addAction}" commandName="user">
  <table>
    <c:if test="${!empty user.name}">
      <tr>
        <td>
          <form:label path="id">
            <spring:message text="ID"/>
          </form:label>
        </td>
        <td>
          <form:input path="id" readonly="true" size="8" disabled="true"/>
          <form:hidden path="id"/>
        </td>
      </tr>
    </c:if>
    <tr>
      <td>
        <form:label path="name">
          <spring:message text="Имя"/>
        </form:label>
      </td>
      <td>
        <form:input path="name"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="age">
          <spring:message text="Возраст"/>
        </form:label>
      </td>
      <td>
        <form:input path="age"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="admin">
          <spring:message text="Администратор"/>
        </form:label>
      </td>
      <td>
        <form:input path="admin"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="createdDate">
          <spring:message text="Дата создания"/>
        </form:label>
      </td>
      <td>
        <form:input path="createdDate"/>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <c:if test="${!empty user.name}">
          <input type="submit"
                 value="<spring:message text="Изменить Пользователя"/>"/>
        </c:if>
        <c:if test="${empty user.name}">
          <input type="submit"
                 value="<spring:message text="Добавить пользователя"/>"/>
        </c:if>
      </td>
    </tr>
  </table>
</form:form>

<h3>Всего записей ${listUsers.size()}</h3>

<input type="button" onclick="location.href='/users'" value="На главную" >
</body>
</html>
