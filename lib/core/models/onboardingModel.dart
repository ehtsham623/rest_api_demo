import 'package:rest_api_demo/constants/labels.dart';

class UnbordingContent {
  String image;
  String title;
  String subtitle;
  String description;

  UnbordingContent(
      {required this.image, required this.title, required this.description, required this.subtitle});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: Label.getStarted,
    subtitle: Label.testYourFrontndAgainstRealAPI,
    image: 'assets/images/reqresLogo.png',
    description: Label.testYourFrontndAgainstRealAPI,
  ),
  UnbordingContent(
    title: Label.fakeData,
    subtitle: Label.fakeDataDisc,
    image: 'assets/images/reqresLogo.png',
    description: Label.fakeDataDisc,
  ),
  UnbordingContent(
    title: Label.realResponses,
    subtitle: Label.realResponsesDisc,
    image: 'assets/images/reqresLogo.png',
    description: Label.realResponsesDisc,
  ),
  UnbordingContent(
    title: Label.alwaysOn,
    subtitle: Label.alwaysOnDisc,
    image: 'assets/images/reqresLogo.png',
    description: Label.alwaysOnDisc,
  ),
];
