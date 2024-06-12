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
    super.photos,
    required super.type,
  });

  factory AnimalModel.fromJson(json) {
    return AnimalModel(
      id: json['id'],
      name: json['name'],
      race: json['race'],
      sexo: json['sexo'],
      age: json['age'],
      vacunate: json['vacunate'],
      description: json['description'],
      weight: json['weight'],
      profilePhoto: json['profilePhoto'],
      photos: json['photos'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      type: animal.type,
    );
  }
}
