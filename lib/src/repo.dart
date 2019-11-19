import 'package:html/dom.dart';
import 'config.dart';

/// Repo class convert github trending list item as Repo instance
class Repo {
  Element repoHtml;

  /// construct function
  Repo(this.repoHtml);

  /// get repo url from dom node
  String get url {
    try {
      return site + repoHtml.querySelector('h1 a').attributes['href'];
    } catch (e) {
      return 'null';
    }
  }

  /// get repo name from dom node
  String get name =>
      repoHtml.querySelector('h1 a').attributes['href'].replaceFirst('/', '');

  /// get description name from dom node
  String get description {
    try {
      Element descritionNode = repoHtml.querySelector('.Box-row p');
      return descritionNode != null
          ? descritionNode.text.toString().trim()
          : '';
    } catch (e) {
      return 'null';
    }
  }

  /// get language name from dom node
  String get language {
    try {
      Element languageNode =
          repoHtml.querySelector('span[itemprop="programmingLanguage"]');
      return languageNode != null ? languageNode.text.trim() : 'Unkown';
    } catch (e) {
      return 'null';
    }
  }

  /// get star name from dom node
  // String get star => repoHtml.children[3].children[1].text.trim();
  String get star {
    try {
      return repoHtml
          .querySelector("svg[aria-label='star']")
          .parentNode
          .text
          .trim();
    } catch (e) {
      return 'null';
    }
  }

  /// get fork name from dom node
  String get fork {
    try {
      return repoHtml
          .querySelector("svg[aria-label='repo-forked']")
          .parentNode
          .text
          .trim();
    } catch (e) {
      return 'null';
    }
  }

  /// get buildBy name from dom node
  List<String> get buildBy {
    try {
      return repoHtml.querySelectorAll('.avatar').map((Element ele) {
        return ele.attributes['src'].toString();
      }).toList();
    } catch (e) {
      return [];
    }
  }

  /// get todayStar name from dom node
  String get todayStar {
    try {
      Element todayStarNode = repoHtml.querySelectorAll('svg')[4].parentNode;
      return todayStarNode != null ? todayStarNode.text.trim() : '';
    } catch (e) {
      return 'null';
    }
  }
}
