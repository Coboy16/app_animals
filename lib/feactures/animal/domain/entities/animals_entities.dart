class Animal {
  final String id;
  final String name;
  final String race;
  final String profilePhoto;
  final String type;
  final String sexo;
  final int age;
  final bool vacunate;
  final String description;
  final int weight;
  final List<String> photos;
  final String address;

  Animal({
    required this.id,
    required this.name,
    required this.race,
    required this.profilePhoto,
    required this.type,
    this.sexo = '',
    this.age = 0,
    this.vacunate = false,
    this.description = '',
    this.weight = 0,
    this.photos = const [],
    this.address = '',
  });
}
