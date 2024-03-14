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
Herzlich willkommen!
</p>
<p>
Die DB Systel Tech Stories sind ein Open-Source-Projekt der DB Systel.
Als Digitalpartner treiben wir die Digitalisierung der Deutschen Bahn für die Mobilität der Zukunft mit digitalen Innovationen, Lösungen und Services voran.
</p>
<p>
Mit den Tech Stories teilen unsere Expert:innen spannende Infos aus der Tech-Welt der DB Systel sowie des DB-Konzerns.
Als leidenschaftliche und innovative Tech-Company möchten wir auf diese Weise die Welt der IT bereichern.
Wir wollen neugierig machen und zu Diskussionen anregen.
Unser Pool an Fachartikeln, Präsentationen und Videos wächst stetig und liefert wertvolles Wissen zu unterschiedlichsten Themenfeldern.
        </p>
<!--
Welcome to the DB Systel Tech Stories!

The DB Systel Tech Stories are an open source project of DB Systel.
As a digital partner, we are driving forward the digitalization of Deutsche Bahn for the mobility of the future with digital innovations, solutions and services.

With the Tech Stories, our experts share exciting information from the tech world of DB Systel and the DB Group.
As a passionate and innovative tech company, we want to enrich the world of IT in this way.
We want to arouse curiosity and stimulate discussion.
Our pool of specialist articles, presentations and videos is constantly growing and provides valuable knowledge on a wide range of topics.
-->        
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

