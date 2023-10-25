<head>
<style>
a[href^="//"]:after,
a[href^="http://"]:after,
a[href^="https://"]:after {
    content: "" !important;
    margin: 0 0 0 0;
}

</style>
<%
// for markdown content
def metakeys="menu order teaser-image title author discussion card tags".split()
metakeys.each { key ->
    if (content['jbake-'+key] && !content[key]) {
        content[key] = content['jbake-'+key]
    }
}
%>
    <%
        //let's fix the context root
        if (content.rootpath) {

        } else {
            //if we are in the main folder, we need no rootpath
            content.rootpath = ''
            //but if we are deeper in the folder structure...
            if (content.sourceuri) {
                content.rootpath = '../' * (content.sourceuri?.split('/')?.size()-1)
            }
        }
        //this is mainly a fix for the imagesdir which is set to /images
        content.body = content.body?.replaceAll('src="/','src="'+content.rootpath)

        String.metaClass.encodeURL = {
            java.net.URLEncoder.encode(delegate, "UTF-8")
        }

        def teaser = content.body?:""
        if (teaser.contains("<!-- teaser -->")) {
            if (teaser.contains("<!-- endtoc -->")) {
                teaser = teaser.split("(?ms)<!-- endtoc -->", 2)[1]
            }
            teaser = teaser.split("(?ms)<!-- teaser -->", 2)[0]
            teaser = teaser.replaceAll("(?ms)<[hH][0-9][^>]*>[^<]*</[hH][0-9]>","")
        } else {
            teaser = ""
        }
        content.teaser = teaser
    %>
    <script>var toRoot = '${content.rootpath}';</script>
    <!-- ${content.sourceuri} -->
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
    <meta content="jbake" name="generator">
    <meta content="INDEX, FOLLOW" name="ROBOTS">

    <title><%if (content.title) {%>${content.title}<% } else { %>${config.site_title}<% }%></title>
    <meta content="${content.card?:content.title}" property="og:title">
    <meta content="${teaser.encodeURL()}" property="og:description">
    <meta content="website" property="og:type">
    <meta content="${config.site_title}" property="og:site_name">
    <meta content="docToolchain" itemprop="name">
    <meta content="build your dev docs the easy way..." itemprop="description">
    <meta content="summary" name="twitter:card">
    <meta content="docToolchain" name="twitter:title">
    <meta content="build your dev docs the easy way..." name="twitter:description">

    <link as="style" href="${content.rootpath}css/main.min.docsy.css" rel="preload">
    <link href="${content.rootpath}css/main.min.docsy.css" integrity="" rel="stylesheet">
    <link href="${content.rootpath}css/asciidoctor.css" rel="stylesheet">
    <link href="${content.rootpath}css/prettify.css" rel="stylesheet">
    <link href="${content.rootpath}css/bahn-ng-theme.css" rel="stylesheet">
    <link href="${content.rootpath}css/tabbed-blocks.css" rel="stylesheet">
    <link href="${content.rootpath}css/tech-stories.css" rel="stylesheet">

    <!-- favicon generated with https://www.favicon-generator.org/ -->
    <link rel="shortcut icon" href="${content.rootpath}favicon.ico">
    <link rel="apple-touch-icon" sizes="57x57" href="${content.rootpath}apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="${content.rootpath}apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${content.rootpath}apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${content.rootpath}apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${content.rootpath}apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${content.rootpath}apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${content.rootpath}apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${content.rootpath}apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${content.rootpath}apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="${content.rootpath}android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${content.rootpath}favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${content.rootpath}favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${content.rootpath}favicon-16x16.png">
    <link rel="manifest" href="${content.rootpath}manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="${content.rootpath}ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <script src="${content.rootpath}js/jquery-3.5.1.min.js"></script>


    <link rel="stylesheet" href="${content.rootpath}css/micrositemaster.db-ui-core.css" rel="stylesheet">

</head>
