import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  final _pageController = PageController(initialPage: 0);
  final _titles = ["Home", "Projects", "Contact"];

  PageController get pageController => _pageController;

  List<String> get titles => _titles;

  void animateToPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void setActivePage(int index) {

  }
}
