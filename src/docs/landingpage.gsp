<style>
  /* custom style for langing page */
a.tag {
  font-family: DB Screen Sans;
  xfont-size: .75rem;
  font-style: normal;
  xfont-weight: 400;
  line-height: 1.4;
  border-radius: 4px;
  color: var(--color-cool-gray-800) !important;
  display: inline-block;
  line-height: 1.25rem;
  margin-bottom: .5rem;
  padding: 0 8px;
  background-color: var(--color-cool-gray-200);
  text-decoration: none !important;
  border: 1px solid var(--color-cool-gray-600)
}
</style>
<section style="margin-top: 0px;">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-6 col-sm-12">
        <h1>DB Systel Tech-Stories</h1>
        <p>
          Finde hier spannende Infos aus der Tech-Welt der DB Systel sowie des DB-Konzerns:
          Talks, Fachartikel, Präsentationen und Aufzeichnungen von Vorträgen lassen Dich tief in unsere Tech-Themen eintauchen.
        </p>
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
          <img style="max-height: 80px" src="images/all.svg" />
          <figcaption>
            <h3 class="card-title">Alle Beiträge</h3>
            <p>
              <a href='blog/index.html' class='tag'>Alles ungefiltert</a>
            </p>
          </figcaption>
        </figure>
      </div>
      <div class="card">
        <figure>
          <img style="max-height: 80px" src="images/topics.svg" />
          <figcaption>
            <h3 class="card-title">Themen</h3>
            <p>
              <%
                  def allTagsHtml = []
                  alltags.sort().each { tag ->
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
                  def author = post['jbake-author']
                  if (!allAuthors[author]) {allAuthors[author]=[]}
                  allAuthors[author]<<post
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

