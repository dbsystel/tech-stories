<%
    //let's build some urls.
    //what's the correct source file name with path?
    def sourceFileName = content?.uri?.replaceAll("[.]html", (content.file =~ /[.][^.]+$/)[0])
    if (content?.sourcefilename) {
        sourceFileName = content.sourcefilename
    }
    def subject = java.net.URLEncoder.encode("Docs: Feedback for '${content?.title}'", "UTF-8")
%>
<% if (config.site_gitRepoUrl) { %>
        <a href="${content?.gitrepourl?:config.site_gitRepoUrl}/${sourceFileName}"
           target="_blank"><i class="fa fa-edit fa-fw"></i> Improve this doc</a>
        <a href="${content?.gitrepourl?:config.site_gitHistoryUrl}/${sourceFileName}"
           target="_blank"><i class="fa fa-edit fa-fw"></i> History</a>
<% } %>
<% if (config.site_issueUrl) {
        if (config.site_issueUrl.contains("/github.com/")) {  %>
            <a href="${content?.issueurl?:config.site_issueUrl}?title=${subject}&body=%0A%0A%5BEnter%20feedback%20here%5D%0A%0A%0A---%0A%23page: ${content?.gitrepourl?:config.site_gitRepoUrl}/${sourceFileName}%0A%23branch: ${config.site_branch}" target="_blank"><i
                class="fab fa-github fa-fw"></i> Create an issue</a>
        <% } else { %>
            <a href="${content?.issueurl?:config.site_issueUrl}?issue%5Btitle%5D=${subject}&issue%5Bdescription%5D=%0A%0A%5BEnter%20feedback%20here%5D%0A%0A%0A---%0A%23page: ${content?.gitrepourl?:config.site_gitRepoUrl}/${sourceFileName}%0A%23branch: ${config.site_branch}" target="_blank"><i
                class="fab fa-github fa-fw"></i> Create an issue</a>
<%        }
   } %>
        ${content?.rightcolumnhtml?.replaceAll("&lt;","<")?.replaceAll("&gt;",">")?:''}
        <hr />
<% if (content['jbake-discussion']) { %>
<!--script>
    var discussionId = ${content['jbake-discussion']};
    alert(discussionId);
</script>
<% } %>
<% if (content['jbake-discussion']) { %>
<script>

    function showNumberOfComments() {
        console.log("DiscussionId: ${content['jbake-discussion']}");

        const query = `
            query {
                repository(owner: "docToolchain", name: "docToolchain") {
                    discussion(number: ${content['jbake-discussion']}) {
                        comments {
                            totalCount
                        }
                    }
                }
            }
        `;

        fetch('https://api.github.com/graphql', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer GITHUB_TOKEN',
        },
        body: JSON.stringify({ query }),
        })
        .then((response) => response.json())
        .then((data) => document.getElementById("noOfComments").innerHTML = data.data.repository.discussion.comments.totalCount);

    }

    document.addEventListener('DOMContentLoaded', function(event) {
        showNumberOfComments();
    });

</script-->
<div id="noOfComments" style="border: solid 0px red; font-size: 16pt;"></div>
<% } %>

<%include "toc.gsp" %>
