import 'package:jungle_adveture/story_step.dart';

class StoryController {
  bool _isFetched = false;
  bool get isFetched => _isFetched;

  int _curentStoryStepIndex = 0;
  int get curentStoryStepIndex => _curentStoryStepIndex;

  List<StoryStep> _story = [];
  List<StoryStep> get story => [..._story];

  StoryStep get storyStep => _story[_curentStoryStepIndex];

  void nextStepStory(int answer) {
    _curentStoryStepIndex = answer;
  }

  void fromJson(dynamic jsonObjectArray) {
    List serverStory = jsonObjectArray
        .map((e) => StoryStep(
              text: e['text'],
              answer1: e['answer1'],
              next1: e['next1'],
              answer2: e['answer2'],
              next2: e['next2'],
            ))
        .toList();
    _story = [...serverStory];
    _isFetched = true;
  }

  void clear() {
    _story.clear();
    _isFetched = false;
    _curentStoryStepIndex = 0;
  }
}
