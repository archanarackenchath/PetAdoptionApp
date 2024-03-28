import 'package:flutter/material.dart';
import 'home_page.dart';

class HistoryPage extends StatelessWidget {
  final List<Pet> adoptedPets;

  const HistoryPage({Key? key, required this.adoptedPets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort the adopted pets based on their adoption timestamps
    adoptedPets.sort((a, b) => a.adoptedDate.compareTo(b.adoptedDate));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Adoption History'),
      ),
      body: adoptedPets.isEmpty
          ? Center(
              child: Text(
                'No pets adopted yet.',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: adoptedPets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(adoptedPets[index].imageUrl),
                  ),
                  title: Text(
                    adoptedPets[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Type: ${adoptedPets[index].type}',
                    style: TextStyle(color: Colors.white70),
                  ),
                );
              },
            ),
      backgroundColor: Colors.black,
    );
  }
}
