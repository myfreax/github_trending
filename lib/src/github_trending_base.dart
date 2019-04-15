import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'dart:async';


class GithubTrending{
  var response;
  String _uri = 'https://github.com/trending';

  Future  toList({language ='all',since = 'daily'}) async{
    if (language != 'all') {
      this._uri = this._uri + '/$language?since=$since';
    }
    this.response = await http.get(this._uri);
    Document document = parse(this.response.body);
    List<Element> reposHtml = document.querySelectorAll('.repo-list li');

    List<Map<String, dynamic>> repos = reposHtml.map((Element repoHtml) {
      Map<String, dynamic> repo = {};

      // name
      String name = repoHtml
          .querySelector('h3 a')
          .attributes['href']
          .replaceFirst('/', '');
      repo['name'] = name;
      // description
      String description = repoHtml.querySelector('.py-1 p').text.trim();
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
      String fork =
          repoHtml.querySelector('a[href="/$name/network"]').text.trim();
      repo['fork'] = fork;
      List<String> buildBy =
          repoHtml.querySelectorAll('.avatar').map((Element ele) {
        return ele.attributes['src'].toString();
      }).toList();
      repo['buildBy'] = buildBy;

      //today star
      String todayStar = repoHtml.querySelector('.float-sm-right').text.trim();
      repo['todayStar'] = todayStar;
      return repo;
    }).toList();
    return repos;
  }
}