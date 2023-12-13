import 'package:uib/core/models/strory.dart';
import 'package:uib/core/models/themes_story.dart';

class StoryData {
  static List<StoryThemes> get storyList => [
        StoryThemes(
          storyThemes: [
            Story(
              imageUrl:
                  'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=2728&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            Story(
              imageUrl:
                  'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxlYXJuaW5nfGVufDB8fDB8fHwy',
            ),
            Story(
              imageUrl:
                  'https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
          ],
        )
      ];
}
