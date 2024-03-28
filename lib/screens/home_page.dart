import 'package:flutter/material.dart';
import 'details_page.dart';
import 'history_page.dart';

class Pet {
  final String name;
  final String type;
  final int age;
  final double price;
  final String imageUrl;
  final DateTime adoptedDate;

  Pet({
    required this.name,
    required this.type,
    required this.age,
    required this.price,
    required this.imageUrl,
    DateTime? adoptedDate, // Make adoptedDate optional
  }) : adoptedDate = adoptedDate ?? DateTime.now();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Pet> pets;
  late List<Pet> filteredPets;

  @override
  void initState() {
    super.initState();
    pets = [
      Pet(
        name: 'Buddy',
        type: 'Dog',
        age: 3,
        price: 200,
        imageUrl: 'assets/dog.jpg',
      ),
      Pet(
        name: 'Whiskers',
        type: 'Cat',
        age: 2,
        price: 150,
        imageUrl: 'assets/cat.jpg',
      ),
      Pet(
        name: 'Polly',
        type: 'Parrot',
        age: 1,
        price: 100,
        imageUrl: 'assets/parrot.jpg',
      ),
      Pet(
        name: 'Cockie',
        type: 'Chicken',
        age: 3,
        price: 1000,
        imageUrl: 'assets/chicken.jpg',
      ),
      Pet(
        name: 'Snick',
        type: 'Gold Fish',
        age: 4,
        price: 500,
        imageUrl: 'assets/fish.jpg',
      ),
      Pet(
        name: 'SWeety',
        type: 'Goat',
        age: 5,
        price: 2000,
        imageUrl: 'assets/goat.jpg',
      ),
      Pet(
        name: 'Fusti',
        type: 'Hamster',
        age: 3,
        price: 100,
        imageUrl: 'assets/hamster.jpg',
      ),
      Pet(
        name: 'Jack',
        type: 'Horse',
        age: 30,
        price: 10000,
        imageUrl: 'assets/horse.jpg',
      ),
      Pet(
        name: 'Loppy',
        type: 'Rabbit',
        age: 1,
        price: 100,
        imageUrl: 'assets/rabbit.jpg',
      ),
      Pet(
        name: 'Jakey',
        type: 'Cow',
        age: 10,
        price: 3000,
        imageUrl: 'assets/cow.jpg',
      ),
      Pet(
        name: 'Mars',
        type: 'Dog',
        age: 1,
        price: 100,
        imageUrl: 'assets/dog2.jpg',
      ),
      Pet(
        name: 'Begi',
        type: 'Squirrel',
        age: 3,
        price: 100,
        imageUrl: 'assets/squirrel.jpg',
      ),
      Pet(
        name: 'Squeep',
        type: 'Turtle',
        age: 1,
        price: 300,
        imageUrl: 'assets/turtle.jpg',
      ),
      Pet(
        name: 'Lufy',
        type: 'Kitten',
        age: 1,
        price: 500,
        imageUrl: 'assets/kitten.jpg',
      ),
      Pet(
        name: 'Kete',
        type: 'Donkey',
        age: 10,
        price: 800,
        imageUrl: 'assets/donkey.jpg',
      ),
      Pet(
        name: 'Silky',
        type: 'Sheep',
        age: 19,
        price: 1000,
        imageUrl: 'assets/sheep.jpg',
      ),
      // Add more pets here
    ];
    filteredPets = List.from(pets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Pet Adoption'),
        actions: [
          IconButton(
            icon: Icon(Icons.history), // Add history icon button
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryPage(
                          adoptedPets: [],
                        )), // Navigate to HistoryPage
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              cursorColor: Colors.purple,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search by pet name...',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.purple),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  filteredPets = pets
                      .where((pet) =>
                          pet.name.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPets.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.purple, width: 1),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(3.0),
                      title: Text(
                        filteredPets[index].name,
                        style: TextStyle(
                            color: Color.fromARGB(255, 193, 137, 203),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        filteredPets[index].type,
                        style: TextStyle(color: Colors.white70),
                      ),
                      leading: Hero(
                        tag: 'pet-${filteredPets[index].name}',
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage(filteredPets[index].imageUrl),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsPage(pet: filteredPets[index]),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
