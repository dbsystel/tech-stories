<%
    if (config.site_menu=="") {
        config.site_menu=[:]
    }
    def menu = content.menu[content['jbake-menu']]

    def printTitle(entry) {
        def title

        if (entry instanceof String) {
            title  = entry
            }
        else {
            title = entry.title
        }
        if (config.site_menu[title]) {
            title = config.site_menu[title]
            }
        return title
    }


    def printMenu(def c, int index, def entries) {
        String result = ''
        if(entries) {
            String htmlClass = (index == 0) ? 'td-sidebar-nav__section ' : '';
            result = result + """
                        <ul class="${htmlClass}ul-$index">"""
            entries.each { entry ->
                if (!entry.date && entry.title ==~ /^[0-9][0-9][0-9][0-9]$/) {
                    entry.date = Date.parse("yyyy", entry.title)
                }
            }
            entries?.sort{a, b -> b.date <=> a.date ?: a.order <=> b.order ?: a.title <=> b.title }.each { entry ->
                def hasChild = (entry.children) ? 'with-child' : 'without-child'
                def isActive = (c.uri==entry.uri) ? 'active' : ''
                result = result + """
                            <li class="td-sidebar-nav__section-title td-sidebar-nav__section $hasChild">"""
                if (entry.uri) {
                    result = result + """
                                <a class="align-left pl-0 pr-2 pt-2 td-sidebar-link td-sidebar-link__section $isActive"
                                   href="${c.rootpath}${entry.uri}">${printTitle(entry)}</a>"""
                } else {
                    def title = entry.title?:entry
                    if (config.site_menu[title]) {
                        title = config.site_menu[title]
                    }
                    result = result + """<span class="label">${printTitle(entry)}</span>"""
                }
                if (entry.children) {
                    result = result + printMenu(c, index + 1, entry.children)
                }
                result = result + '''
                            </li>'''
            }
            result = result + '''
                        </ul>'''
        }
        return result
    }
%>
        <form class="td-sidebar__search d-flex align-items-center d-lg-none" action="${content.rootpath}search.html">

            <input aria-label="Suchen" name="q" autocomplete="off" class="form-control td-search-input"
                   placeholder="Suchen" type="search">


            <button aria-controls="td-docs-nav" aria-expanded="false"
                    aria-label="Toggle section navigation" class="btn btn-link td-sidebar__toggle d-md-none p-0 ml-3 fas fa-bars" data-target="#td-section-nav"
                    data-toggle="collapse" type="button">
            </button>
        </form>

        <nav aria-label="Submenu" class="collapse td-sidebar-nav" id="td-section-nav" >

            <ul class="td-sidebar-nav__section">
                <li class="td-sidebar-nav__section-title">
                    <span class="align-left pl-0 pr-2 pt-2 active td-sidebar-link td-sidebar-link__section"><%= printTitle(content['jbake-menu']) %></span>
                </li>
                <li>
                  <ul>
                      <li class="collapse show" id="docs">
                          <%= printMenu(content, 0, menu) %>
                      </li>
                  </ul>
                </li>
	   </ul>
        </nav>
