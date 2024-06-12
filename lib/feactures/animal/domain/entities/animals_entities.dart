class Animal {
  final String id;
  final String name;
  final String race;
  final String sexo;
  final int age;
  final bool vacunate;
  final String description;
  final int weight;
  final String profilePhoto;
  final List<String> photos;
  final String type;

  Animal({
    required this.id,
    required this.name,
    required this.race,
    required this.profilePhoto,
    required this.sexo,
    required this.age,
    required this.vacunate,
    required this.description,
    required this.weight,
    this.photos = const [],
    required this.type,
  });
}
