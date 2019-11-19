import 'package:html/dom.dart';
import 'repo.dart';

/// Repos class convert github trending list as Repos instance
class Repos {
  Document document;
  List<Element> reposHtml;

  /// construct function
  /// 
  /// only accept [Document] a parameter document
  Repos(Document document) {
    this.document = document;    
    reposHtml = document.querySelectorAll('.Box .Box-row'); 
  }

  /// The list include many [Repo] instance
  List<Repo> get list {
    return reposHtml.map((Element repoHtml) {
      return Repo(repoHtml);
    }).toList();
  }
}