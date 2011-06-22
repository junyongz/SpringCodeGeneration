<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<portlet:defineObjects />

<portlet:renderURL var="${$item.camelize(class_name)}CreateUrl" windowState="MAXIMIZED">
	<portlet:param name="path" value="/${$item.camelize(class_name)}/commands" />
	<portlet:param name="action" value="create" />
</portlet:renderURL>

<script type="text/javascript">
	function confirmRemove(url) {
		if (confirm('Are you sure to remove?')) {
			window.location = url;
		}
	}
</script>

<link style="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

<div class="module-header">${$item.capitalize(class_name)}</div>
<div class="module-actions">
	<div class="action-item"><a href="<portlet:renderURL />">Home</a></div>
	<div class="action-item"><a href="<%=studentCreateUrl%>">Register New Student</a></div>
</div>
<div class="module-contents">
	<div class="contents-list-header">
		<div class="contents-list-item">SN</div>
		
	</div>
	<c:forEach var="${$item.capitalize(class_name)}" items="${requestScope.students}" varStatus="st">
	
	<portlet:renderURL var="studentEditUrl" windowState="MAXIMIZED">
		<portlet:param name="path" value="/student/commands" />
		<portlet:param name="action" value="edit" />
		<portlet:param name="id" value="${student.id }" />
	</portlet:renderURL>
	
	<portlet:renderURL var="studentRemoveUrl" windowState="MAXIMIZED">
		<portlet:param name="path" value="/student/commands" />
		<portlet:param name="action" value="remove" />
		<portlet:param name="id" value="${student.id }" />
	</portlet:renderURL>
	
	<div class="contents-list-entry">
		<div class="contents-list-item">${st.index + 1 }</div>
		<div class="contents-list-item">${student.firstName },${student.lastName}</div>
		<div class="contents-list-item">111</div>
		<div class="contents-list-item">!!</div>
		<div class="contents-list-item"><a href="${studentEditUrl }">Edit</a>#<a href="#" onclick="javascript:confirmRemove('${studentListUrl}')">Remove</a></div>
	</div>
	</c:forEach>
</div>