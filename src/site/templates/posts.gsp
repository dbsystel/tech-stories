<section>
    <div class="container">

        <div class="cards">

            <%content.myPosts.eachWithIndex {post, i ->%>
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
                    <img style="margin-top: 40px; margin-left: 0.5em; max-height: 80px; max-width: 80px; object-fit: contain;" src='${content.rootpath}images/${post['jbake-teaser-image']}' />
                    <% } else { %><p>-</p>
                    <img style="margin-top: 40px; margin-left: 0.5em; max-height: 80px;" src="${content.rootpath}/images/ic-db_newsletter.svg" />
                    <% } %>
                    <figcaption>
                        <p>${new java.text.SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH).format(post.date)}</p>
                        <a href="${content.rootpath}${post.uri}" class="text-link">
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
