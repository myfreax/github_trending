import 'package:github_trending/github_trending.dart';

main() async {
  GithubTrending githubTrending = GithubTrending();
  // 
  try {
    // default time language
    List<Map<String, dynamic>> defaultArray = await githubTrending.toList();
    print(defaultArray);
  } catch (e) {
    // get origin response
    githubTrending.response;
    print(e);
  }
  

  // rust language and default time
  List<Map<String, dynamic>> rustArray = await githubTrending.toList(language: 'rust');
  print(rustArray);
  
  // rust language and last weekly
  List<Map<String, dynamic>> rustWeekArray = await githubTrending.toList(language: 'rust',since: 'weekly');
  print(rustWeekArray);

  // return default trending when pass error time and language params.
  List<Map<String, dynamic>> rustWeekArrayerror = await githubTrending.toList(language: 'error',since: 'error');
  print(rustWeekArrayerror);
}
