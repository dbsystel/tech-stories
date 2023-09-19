<!doctype html>
<html lang="de">
<%include "header.gsp"%>
<body onload="prettyPrint()" class="td-section bahn ng">
<header>
	<%include "menu.gsp"%>
	<style>
	figcaption div.sect1 {
	    padding-bottom: 0px;
	}
	</style>
</header>
<div class="container-fluid">
	<div class="td-main">
		<div class="row flex-xl-nowrap">
			<div class="col-12 col-md-3 col-xl-2 td-sidebar d-print-none">
				<div class="td-sidebar__inner" id="td-sidebar-menu" >
					<%include "submenu-blog.gsp"%>
				</div>
			</div>
			<div class="d-none d-xl-block col-xl-2 td-toc d-print-none">
				<div class="td-page-meta ml-2 pb-1 pt-2 mb-0">
					<%include "rightcolumn_wotoc.gsp" %>
				</div>
			</div>
			<main class="col-12 col-md-9 col-xl-8 pl-md-5" role="main">
				<%include "main.gsp"%>
				<% content.myPosts = published_posts.findAll{it.author=='Bertram Fey'} %>
				<%include "posts.gsp"%>
				<% if (config.site_issueUrl && config.site_feedbackForm != 'false') {%>
				<%include "feedback.gsp" %>
				<% } %>

			<%
			def allTags = []
			content.myPosts.each { post ->
			    allTags += post.tags
			}
			out << allTags.unique()
			%>
			</main>
		</div>
	</div>
	<%include "footer.gsp"%>
</body>
</html>

