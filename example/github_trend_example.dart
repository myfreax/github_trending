import 'package:github_trend/github_trend.dart';
import 'package:html/dom.dart';

main() async {
  GithubTrend githubTrend = GithubTrend();
  try {
    Document document = await githubTrend.fetchTrending();
    List<Repo> repos = Repos(document).list;
    List<String> languages = Languages(document).list;
    repos[0].name;
    print(languages);
  } catch (e) {
    // handle error
  }
}