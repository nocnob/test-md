private static String buildProjectTweetContent(String content, String name, String pathWithNamespace, long projectId) {
  String gitProjectUrl = LinkTool.git(pathWithNamespace);
  StringBuffer tweetHtml = new StringBuffer();
  tweetHtml.append(FormatTool.html(content))
    .append(" ")
    .append(" <a href='")
    .append(gitProjectUrl)
    .append("' class='project' target='_blank' data-namespace='")
    .append(FormatTool.html(pathWithNamespace))
    .append("' data-project='")
    .append(projectId)
    .append("' title='")
    .append(FormatTool.html(name))
    .append("'>")
    .append(FormatTool.html(name))
    .append("</a>");
  return tweetHtml.toString();
}
