
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		
	
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div id="results">
<div id="results-placeholder">
<ul data-role="list-view" id="list" class="ui-listview">
<g:each in="${result.resultList}" status="i" var="item">
					<li id="${item.id}" data-corners="false" data-shadow="false" data-iconshadow="true" data-wrapperels="div" data-icon="arrow-r" data-iconpos="right" data-theme="c" class="ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-btn-up-c">
					<div class="ui-btn-inner ui-li">
<div class="ui-btn-text">
						  ${item.title}
						   </div>
						  </div>
					
						
					</li>
				</g:each>
</ul>

			<div class="pagination">
				  <g:paginate total="${result.total}" max="15" params="[q:q, fq:fq]"/>
			</div>
			 <g:if test="${result.total == 0}">
    No Results found
    </g:if>
</div>
</div>

	
		
		
		
	</body>
</html>
