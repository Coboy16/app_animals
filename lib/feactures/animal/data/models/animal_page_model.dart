class AnimalPageModel {
  final String id;
  final String name;
  final String race;
  final String profilePhoto;

  AnimalPageModel({
    required this.id,
    required this.name,
    required this.race,
    required this.profilePhoto,
  });

  factory AnimalPageModel.fromJson(json) {
    return AnimalPageModel(
      id: json['id'],
      name: json['name'],
      race: json['race'],
      profilePhoto: json['profilePhoto'],
    );
  }
}
