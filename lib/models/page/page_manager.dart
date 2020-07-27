import 'package:flutter/material.dart';

class PageManager {
  PageManager(this._pageManager);

  final PageController _pageManager;

  int page;

  void setPage(int value) {
    if(value == page) return;
    page = value;
    _pageManager.jumpToPage(value);
  }
}
