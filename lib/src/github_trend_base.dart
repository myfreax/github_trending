import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'dart:async';

const String url = 'https://github.com';
const String trendingUrl = url + '/trending/';

class GithubTrend {
  http.Response response;
  String _uri = trendingUrl;
  List<String> languages = [];

  /// fetch github trending repos
  Future<List<Map<String, dynamic>>> fetchRepos(
      {language = 'all', String since = 'daily'}) async {
    _uri = trendingUrl;
    if (language != 'all') {
      _uri = trendingUrl + '$language?since=$since';
    }
    print(_uri);
    this.response = await http.get(_uri.toLowerCase());
    Document document = parse(this.response.body);
    List<Element> reposHtml = document.querySelectorAll('.repo-list li');

    List<Map<String, dynamic>> repos = reposHtml.map((Element repoHtml) {
      Map<String, dynamic> repo = {};

      // repo url
      String uri = repoHtml.querySelector('h3 a').attributes['href'];
      repo['url'] = url + uri;

      // name
      String name = repoHtml
          .querySelector('h3 a')
          .attributes['href']
          .replaceFirst('/', '');
      repo['name'] = name;

      // description
      Element descritionNode = repoHtml.querySelector('.py-1 p');
      String description =
          descritionNode != null ? descritionNode.text.trim() : '';
      repo['description'] = description;

      // language
      Element languageNode =
          repoHtml.querySelector('span[itemprop="programmingLanguage"]');
      String language =
          languageNode != null ? languageNode.text.trim() : 'Unkown';
      repo['language'] = language;

      // star
      String star =
          repoHtml.querySelector('a[href="/$name/stargazers"]').text.trim();
      repo['star'] = star;

      // fork

      Element forkNode =
          repoHtml.querySelector('a[href="/$name/network/members"]');
      String fork = forkNode != null ? forkNode.text.trim() : '';
      repo['fork'] = fork;

      // build by
      List<String> buildBy =
          repoHtml.querySelectorAll('.avatar').map((Element ele) {
        return ele.attributes['src'].toString();
      }).toList();
      repo['buildBy'] = buildBy;

      //today star
      Element todayStarNode = repoHtml.querySelector('.float-sm-right');
      String todayStar = todayStarNode != null ? todayStarNode.text.trim() : '';
      repo['todayStar'] = todayStar;

      return repo;
    }).toList();
    return repos;
  }

  /// fetch github trending html page
  Future<List<String>> fetchLanguages() async {
    if (this.languages.isNotEmpty) {
      return this.languages;
    }
    if (this.response == null) {
      this.response = await http.get(_uri);
    }
    Document document = parse(this.response.body);
    List<Element> languagesHtml = document.querySelectorAll(
        '.filter-list>li>a,div[data-filterable-for="text-filter-field"]>a>span');
    this.languages = languagesHtml.map((Element ele) {
      return ele.text.toString();
    }).toList();
    return this.languages;
  }
}
