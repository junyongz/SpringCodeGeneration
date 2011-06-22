<%-- REMEMBER TO REPLACE $\{ --%>

<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<portlet:defineObjects />

<portlet:renderURL var="${$item.camelize(class_name)}SaveUrl" windowState="MAXIMIZED">
	<portlet:param name="path" value="/${$item.camelize(class_name)}/commands" />
	<portlet:param name="action" value="save" />
</portlet:renderURL>

<div class="module-header">${class_name}</div>

<div class="module-form">
<form:form modelAttribute="${$item.camelize(class_name)}" id="${$item.camelize(class_name)}" action="$\{${$item.camelize(class_name)}SaveUrl}" method="post">
<form:hidden path="id" />
<form:hidden path="version" />
{{each(i,p) properties}}
<div class="field">
  <div class="label">${p.name}</div>
  <div class="input">
	<form:input path="${p.name}" id="${p.name}" />
	<form:errors path="${p.name}" cssClass="error" />
  </div>
</div>
{{/each}}
<input type="Submit" value="create" />
</form:form>
</div>

