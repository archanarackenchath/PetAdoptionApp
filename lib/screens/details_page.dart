import 'package:flutter/material.dart';
import 'home_page.dart'; // Importing HomePage for Pet model

class DetailsPage extends StatefulWidget {
  final Pet pet;

  const DetailsPage({Key? key, required this.pet}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _adopted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Pet Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          alignment: Alignment.center,
          height: 450,
          color: Color.fromARGB(255, 215, 158, 225),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _showImageDialog(widget.pet.imageUrl);
                },
                child: Hero(
                  tag: 'pet-${widget.pet.name}',
                  child: Image.asset(
                    widget.pet
                        .imageUrl, // Assuming this is the path to your local image asset
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.pet.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Type: ${widget.pet.type}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Age: ${widget.pet.age}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Price: \$${widget.pet.price.toString()}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                  Colors.purple,
                )),
                onPressed: _adopted ? null : _adoptPet,
                child: Text(
                  _adopted ? 'Already Adopted' : 'Adopt Me',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  void _adoptPet() {
    setState(() {
      _adopted = true;
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adopt ${widget.pet.name}'),
        content: Text('You\'ve now adopted ${widget.pet.name}!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showImageDialog(String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.asset(imageUrl),
      ),
    );
  }
}
