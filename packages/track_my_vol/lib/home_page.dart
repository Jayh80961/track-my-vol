import 'package:flutter/material.dart';

// packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final dateTextEditingController = TextEditingController();
  final categoryTextEditingController = TextEditingController();
  final nameTextEditingController = TextEditingController();
  final timeTextEditingController = TextEditingController();
  final descriptionTextEditingController = TextEditingController();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final date = dateTextEditingController.text;
          final category = categoryTextEditingController.text;
          final name = nameTextEditingController.text;
          final time = timeTextEditingController.text;
          final description = descriptionTextEditingController.text;

          CollectionReference vols =
              FirebaseFirestore.instance.collection('vols');
          vols.add({
            'date': date,
            'category': category,
            'name': name,
            'time': time,
            'description': description,
            'createdAt': Timestamp.fromDate(DateTime.now()),
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildPhotoContainer() {
    return InkWell(
      onTap: () {
        final ImagePicker picker = ImagePicker();
        picker.pickMultiImage();
      },
      child: Card(
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
        child: TextField(
          controller: dateTextEditingController,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          decoration: const InputDecoration.collapsed(
            hintText: 'date: ',
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
        child: TextField(
          controller: categoryTextEditingController,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          decoration: const InputDecoration.collapsed(
            hintText: 'Category : ',
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
        child: TextField(
          controller: nameTextEditingController,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          decoration: const InputDecoration.collapsed(
            hintText: 'name : ',
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
        child: TextField(
          controller: timeTextEditingController,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          decoration: const InputDecoration.collapsed(
            hintText: 'time : ',
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
          controller: descriptionTextEditingController,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
