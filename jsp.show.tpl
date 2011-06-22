<%-- REMEMBER TO REPLACE $\{ --%>

<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link style="text/css" rel="stylesheet" href="$\{pageContext.request.contextPath}/css/style.css" />

<portlet:defineObjects />

<portlet:renderURL var="${$item.camelize(class_name)}ListUrl" windowState="MAXIMIZED">
	<portlet:param name="path" value="/${$item.camelize(class_name)}/commands" />
	<portlet:param name="action" value="list" />
</portlet:renderURL>

<div class="module-header">${class_name}</div>

<div class="module-actions"><a href="$\{${$item.camelize(class_name)}ListUrl}">Back</a></div>

<div class="module-show">
{{each(i,p) properties}}
<div class="field">
  <div class="label">${p.name}</div>
  <div class="output">
  	$\{requestScope.${$item.camelize(class_name)}.${p.name}}
  </div>
</div>
{{/each}}
</div>


