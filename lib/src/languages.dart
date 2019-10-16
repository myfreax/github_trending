
import 'package:html/dom.dart';

class Languages {
  Document document;
  Languages(this.document);

  get list{
    List<Element> languagesHtml = document.querySelectorAll(
        '.filter-list>li>a,div[data-filterable-for="text-filter-field"]>a> .select-menu-item-text');
    List<String> languages =  languagesHtml.map((Element ele) {
      return ele.text.toString().trim();
    }).toList();
    languages.insert(0, 'all');
    return languages;
  }
}