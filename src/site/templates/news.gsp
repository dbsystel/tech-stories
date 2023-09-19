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
                    <!--%include "rightcolumn.gsp" %-->
                </div>
            </div>
            <main class="col-12 col-md-9 col-xl-8 pl-md-5" role="main">
                <%
                    def splitBody = content.body
                    if (splitBody.contains("<!-- endtoc -->")) {
                        splitBody = splitBody.split("(?ms)<!-- endtoc -->", 2)[1]
                    }
                    out << splitBody
                %>

                <%
                    alltags?.sort().each { tag ->
                        tag = tag.trim()
                        def postsCount = posts.findAll { post ->
                            post.status == "published" && post.tags?.contains(tag)
                        }.size()
                %>
                <span class="blogtag"><a href="${content.rootpath}tags/${tag.replace(' ', '-')}.html"># ${tag}&nbsp;<span class="badge">${postsCount}</span></a></span>
                <%
                    }
                %>
                <% content.myPosts = published_posts %>
                <%include "posts.gsp"%>
                <% if (config.site_issueUrl && config.site_feedbackForm != 'false') {%>
                <%include "feedback.gsp" %>
                <% } %>

            </main>

        </div>
    </div>


    <%include "footer.gsp"%>

</body>
</html>

