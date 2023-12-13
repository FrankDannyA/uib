import 'package:flutter/material.dart';
import 'package:story/story.dart';
import 'package:uib/features/story/storage/story_data.dart';

class StoryScreen extends StatelessWidget {
  StoryScreen({Key? key}) : super(key: key);

  //Добавить анимацию прокрутки до 3 страницы
  static const String routeName = '/story_route';

  final storyData = StoryData.storyList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: StoryPageView(
          pageLength: storyData.length,
          itemBuilder: (ctx, pageInd, storyInd) {
            final theme = storyData[pageInd];
            final story = theme.storyThemes[storyInd];

            return Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(story.imageUrl),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
          storyLength: (int pageIndex) =>
              storyData[pageIndex].storyThemes.length,
        ));
  }
}
