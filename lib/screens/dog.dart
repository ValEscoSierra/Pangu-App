import 'infosalud.dart';

class Dog {
  String name;
  String imagePath;
  late InfoSalud infoSalud;

  Dog({
    required this.name,
    required this.imagePath,
  });
}

class DogManager {
  static final DogManager _instance = DogManager._internal();

  factory DogManager() {
    return _instance;
  }

  DogManager._internal();

  List<Dog> dogs = [];

  void addDog(String name, String imagePath) {
    Dog dog = Dog(name: name, imagePath: imagePath);
    dogs.add(dog);
  }

  void removeDog(String name) {
    dogs.removeWhere((dog) => dog.name == name);
  }

  List<Dog> getDogs() {
    return dogs;
  }
}
