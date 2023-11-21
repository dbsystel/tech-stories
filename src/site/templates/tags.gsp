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
                    <h3>Tags</h3>
                    <%
                        def taggedPosts = [:]
                        alltags?.
                        unique({ a, b -> a.toLowerCase() <=> b.toLowerCase() }).
                        sort({ a, b -> a.toLowerCase() <=> b.toLowerCase() }).
                        each { thisTag ->
                            thisTag = thisTag.trim().toLowerCase()
                            taggedPosts[thisTag] = posts.findAll { post ->
                                post.status == "published" && post.tags?.join(" ").toLowerCase().contains(thisTag.toLowerCase())
                            }
                            def postsCount = taggedPosts[thisTag].size()
                    %>
                    <span class="blogtag"><a class="tag" href="${content.rootpath}tags/${thisTag.replace(' ', '-')}.html">${thisTag}&nbsp;<span class="badge">${postsCount}</span></a></span><br />
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="d-none d-xl-block col-xl-2 td-toc d-print-none">
                <div class="td-page-meta ml-2 pb-1 pt-2 mb-0">
                </div>
            </div>
            <main class="col-12 col-md-9 col-xl-8 pl-md-5" role="main">
                <h1>Alle Stories mit dem Tag '#${tag}'</h1>



                <section>
                    <div class="container">

                        <div class="cards">

                            <%taggedPosts[tag.toLowerCase()].eachWithIndex {post, i ->%>
                            <% if (i!=0 && i%1==0) { %>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="container">
                        <div class="cards">
                            <% } %>
                            <div class="card">
                                <figure>
                                    <% if (post['jbake-teaser-image']) { %>
                                    <img style="max-height: 80px; max-width: 80px;" src='${content.rootpath}images/${post['jbake-teaser-image']}' />
                                    <% } else { %>
                                    <img style="max-height: 80px" src="${content.rootpath}/images/ic-db_newsletter.svg" />
                                    <% } %>
                                    <figcaption>
                                        <p>${new java.text.SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH).format(post.date)}</p>
                                        <a href="${content.rootpath}/${post.uri}" class="text-link">
                                            <h3 class="card-title">${post.card?:post.title}</h3>
                                        </a>
                                        <%
                                                def teaser = post.body
                                                if (teaser.contains("<!-- teaser -->")) {
                                                    if (teaser.contains("<!-- endtoc -->")) {
                                                        teaser = teaser.split("(?ms)<!-- endtoc -->", 2)[1]
                                                    }
                                                    teaser = teaser.split("(?ms)<!-- teaser -->", 2)[0]
                                                    teaser = teaser.replaceAll("(?ms)<[hH][0-9][^>]*>[^<]*</[hH][0-9]>","")
                                                } else {
                                                    teaser = ""
                                                }
                                        %>
                                        <%= teaser %>
                                    </figcaption>
                                </figure>

                            </div>
                            <%}%>
                        </div>
                    </div>
                </section>

            </main>

        </div>
    </div>


    <%include "footer.gsp"%>

</body>
</html>

