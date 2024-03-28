import 'dart:async';
import '../screens/home_page.dart';
// Assuming Pet model is defined in home_page.dart

class PetBloc {
  // StreamController to manage the state of adopted pets
  final _adoptedPetsController = StreamController<List<Pet>>();

  // Sink to add adopted pets to the stream
  Sink<List<Pet>> get _inAdoptedPets => _adoptedPetsController.sink;

  // Stream to expose adopted pets to the UI
  Stream<List<Pet>> get adoptedPets => _adoptedPetsController.stream;

  // List to hold adopted pets
  List<Pet> _adoptedPets = [];

  // Function to add a pet to the adopted pets list
  void adoptPet(Pet pet) {
    _adoptedPets.add(pet);
    _inAdoptedPets.add(_adoptedPets);
  }

  // Dispose method to close the StreamController
  void dispose() {
    _adoptedPetsController.close();
  }
}
