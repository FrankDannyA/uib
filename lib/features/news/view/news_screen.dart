import 'package:flutter/material.dart';
import 'package:uib/features/news/storage/news_storage.dart';
import 'package:uib/features/news/view/widget/animated_card.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  static const String routeName = "/news_screen";

  final newsList = NewsData.newsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return AnimatedNewsTile(news: newsList[index]);
        },
      ),
    );
  }
}
