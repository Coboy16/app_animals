import 'package:dog_app/feactures/animal/domain/entities/entities.dart';

class AnimalModel extends Animal {
  AnimalModel({
    required super.id,
    required super.name,
    required super.race,
    required super.sexo,
    required super.age,
    required super.vacunate,
    required super.description,
    required super.weight,
    required super.profilePhoto,
    super.photos = const [],
    required super.type,
    required super.address,
  });

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
      id: json['_id'],
      name: json['name'] ?? '',
      race: json['race'] ?? '',
      sexo: json['sexo'] ?? '',
      age: json['age'] ?? 0,
      vacunate: json['vacunate'] ?? false,
      description: json['description'] ?? '',
      weight: json['weight'] ?? 0,
      profilePhoto: json['profilePhoto'] ?? '',
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ?? [],
      type: json['type'] ?? '',
      address: json['enterpriseId']?['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'race': race,
      'sexo': sexo,
      'age': age,
      'vacunate': vacunate,
      'description': description,
      'weight': weight,
      'profilePhoto': profilePhoto,
      'photos': photos,
      'type': type,
      'enterpriseId': {'address': address},
    };
  }

  factory AnimalModel.formEntities(Animal animal) {
    return AnimalModel(
      id: animal.id,
      name: animal.name,
      race: animal.race,
      sexo: animal.sexo,
      age: animal.age,
      vacunate: animal.vacunate,
      description: animal.description,
      weight: animal.weight,
      profilePhoto: animal.profilePhoto,
      photos: animal.photos,
      type: animal.type,
      address: animal.address,
    );
  }
}
