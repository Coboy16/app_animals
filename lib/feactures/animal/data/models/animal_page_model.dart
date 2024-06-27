import 'package:dog_app/feactures/animal/data/models/models.dart';

class AnimalPageModel {
  final Map<String, List<AnimalModel>> animalsListPage;

  AnimalPageModel({required this.animalsListPage});

  factory AnimalPageModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<AnimalModel>> animalMap = {};
    json.forEach((key, value) {
      animalMap[key] = List<AnimalModel>.from(value.map((x) => AnimalModel.fromJson(x)));
    });
    return AnimalPageModel(animalsListPage: animalMap);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = {};
    animalsListPage.forEach((key, value) {
      jsonMap[key] = List<dynamic>.from(value.map((x) => x.toJson()));
    });
    return jsonMap;
  }
}
