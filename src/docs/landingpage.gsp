<style>
.bahn.ng .landing-page a.btn-link {
  color: var(--color-white);
  text-decoration: none;
}
.bahn.ng .landing-page a.btn-link:hover {
  color: var(--color-cool-gray-100);
}
.bahn.ng .landing-page .cards {
  gap: 2rem;
}
</style>
<section style="margin-top: 0px;">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-6 col-sm-12">
        <h1>DB Systel Tech Stories</h1>
        <p>
          Finde hier spannende Infos aus der Tech-Welt der DB Systel sowie des DB-Konzerns:
          Talks, Fachartikel, Präsentationen und Aufzeichnungen von Vorträgen lassen dich tief in unsere Tech-Themen eintauchen.
        </p>
        <a class="elm-button btn-link" data-variant="primary" title="Zur Übersicht aller Tech-Stories" href='blog/index.html'>
          Alle Tech Stories <i class="fa fa-arrow-right fa-fw"></i>
        </a>
      </div>
      <div class="col-md-6 d-none d-md-block pl-5">
        <img style="max-height:40vh;" src="images/home.png" alt="" />
      </div>
    </div>
    <div class="row justify-content-center d-lg-none">
    </div>
  </div>
</section>

<section>
  <div class="container">
    <div class="cards">
      <div class="card">
        <figure>
          <img style="max-height: 80px" src="images/topics.svg" />
          <figcaption>
            <h3 class="card-title">Themen</h3>
            <p>
              <%
                  def allTagsHtml = []
                  alltags
                  .unique({ a, b -> a.toLowerCase() <=> b.toLowerCase() })
                  .sort({ a, b -> a.toLowerCase() <=> b.toLowerCase() })
                  .each { tag ->
                    allTagsHtml << "<a href='tags/${tag}.html' class='tag'>$tag</a>"
                  }
                out << allTagsHtml.join(' ')

              %>
            </p>
          </figcaption>
        </figure>
      </div>
      <div class="card">
        <figure>
          <img style="max-height: 80px" src="images/author.svg" />
          <figcaption>
            <h3 class="card-title">Autoren</h3>
            <p>
              <%
                def allAuthors = [:]
                def allAuthorsHtml = []
                published_posts.each { post ->
                  def authors = post['jbake-author']
                  authors.split(", *").each { author ->
                    if (author) {
                        if (!allAuthors[author]) {allAuthors[author]=[]}
                        allAuthors[author]<<post
                    }
                  }
                }
                allAuthors.sort().each { author, content ->
                  allAuthorsHtml << "<a href='blog/profiles/${author.replaceAll(' ','-').encodeURL()}.html' class='tag'>$author</a>"
                }
                out << allAuthorsHtml.join(' ')

              %>
            </p>
          </figcaption>
        </figure>
      </div>
    </div>
  </div>
</section>

