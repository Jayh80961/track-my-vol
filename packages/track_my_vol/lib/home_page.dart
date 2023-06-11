import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              buildPhotoContainer(),
              buildDateContainer(),
              buildCategoryContainer(),
              buildNameContainer(),
              buildTimeContainer(),
              buildDescriptionContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPhotoContainer() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 250,
        color: Colors.pink[200],
        padding: const EdgeInsets.all(8),
        child: const Text(
          'Photo: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget buildDateContainer() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 150,
        color: Colors.purple,
        padding: const EdgeInsets.all(8),
        child: const Text(
          'date: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget buildCategoryContainer() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 150,
        color: Colors.purple,
        padding: const EdgeInsets.all(8),
        child: const Text(
          'Category : ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget buildNameContainer() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 150,
        color: Colors.purple,
        padding: const EdgeInsets.all(8),
        child: const Text(
          'name: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget buildTimeContainer() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 150,
        color: Colors.purple,
        padding: const EdgeInsets.all(8),
        child: const Text(
          'time: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget buildDescriptionContainer() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 150,
        color: Colors.purple,
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
