<!doctype html>
<html lang="de">
<%include "header.gsp"%>
<body onload="prettyPrint()" class="td-section bahn ng">
<header>
  <%include "menu.gsp"%>
</header>
<div class="container-fluid">
  <div class="td-main">
    <div class="row flex-xl-nowrap">
      <div class="col-12 col-md-3 col-xl-2 td-sidebar d-print-none">
        <div class="td-sidebar__inner" id="td-sidebar-menu">
          <%include "submenu-blog.gsp"%>
        </div>
      </div>
      <div class="d-none d-xl-block col-xl-2 td-toc d-print-none">
        <div class="td-page-meta ml-2 pb-1 pt-2 mb-0">
          <%include "rightcolumn.gsp" %>
        </div>
      </div>
      <main class="col-12 col-md-9 col-xl-8 pl-md-5" role="main">
        <!-- Date, Author -->
        <p class="increase-zindex">
          <em>${new java.text.SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH).format(content.date)},
          <a href="${content.rootpath}blog/profiles/${(content.author?:'').replaceAll(' ','-').encodeURL()}.html">${content.author?:''}</a></em>
        </p>
        <!-- Share buttons above headline -->
        <%include "social-media.gsp" %>
        <!-- Content -->
        <%
          def splitBody = content.body
          if (splitBody.contains("<!-- endtoc -->")) {
              splitBody = splitBody.split("(?ms)<!-- endtoc -->", 2)[1]
          }
          splitBody = splitBody.replace("</h2>","</h2><img src='${content.rootpath}images/${content['jbake-teaser-image']}' style='float:right;max-width: 10em; margin-left: 1em;' />")
          out << splitBody
        %>
        <!-- tags -->
        <p>
        <%
          def tags = []
          content.tags.forEach { tag ->
            tags += "<a class='tag' href='${content.rootpath}tags/${tag}.html'>$tag</a>"
          }
          out << tags.join(' ')
        %>
        </p>
        <!-- Share buttons below content -->
        <%include "social-media.gsp" %>
        <% if (config.site_issueUrl && config.site_feedbackForm != 'false') {%>
        <%include "feedback.gsp" %>
        <% } %>

      </main>
    </div>
  </div>
  <%include "footer.gsp"%>
</body>
</html>
