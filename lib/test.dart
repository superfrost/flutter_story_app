import 'package:jungle_adveture/fetch_story.dart';
import 'package:jungle_adveture/story_controller.dart';

void main() async {
  final serverStory = await fetchStory();
  final myStory = StoryController();
  myStory.fromJson(serverStory);
  print(myStory.story[0].text);
}

