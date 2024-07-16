import 'package:article_app/src/features/home/domain/entities/content/content_entity.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<ContentEntity> shows = [];
  int currentIndex = 0;

  HomeController();

  int get length => shows.length > 8 ? 8 : shows.length;
  
  void updateIndex(double offset, double width) {
    currentIndex = (offset / width).round();
  }
}
