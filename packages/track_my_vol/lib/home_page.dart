import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dateTextEditingController = TextEditingController();
  final categoryTextEditingController = TextEditingController();
  final nameTextEditingController = TextEditingController();
  final timeTextEditingController = TextEditingController();
  final descriptionTextEditingController = TextEditingController();

  final List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    const HomePage(key: ValueKey(1));

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
              buildSubmitButton(),
              const SizedBox(height: 30),
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

          // CollectionReference vols =
          //     FirebaseFirestore.instance.collection('vols');
          // vols.add({
          //   'date': date,
          //   'category': category,
          //   'name': name,
          //   'time': time,
          //   'description': description,
          //   'createdAt': Timestamp.fromDate(DateTime.now()),
          // });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/login');
              break;
            case 2:
              context.go('/my');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'new'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'my'),
        ],
      ),
    );
  }

  Widget buildPhotoContainer() {
    List<Widget> imageWidgets = [];
    for (var image in images) {
      imageWidgets.add(Image(image: FileImage(File(image.path))));
    }

    return InkWell(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        images.addAll(await picker.pickMultiImage());
        setState(() {});
      },
      onLongPress: () {
        const snackBar = SnackBar(
          content: Text('Image Reset'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        images.clear();
        setState(() {});
      },
      child: Card(
        elevation: 10,
        child: Container(
          width: 350,
          // height: 250,
          color: Colors.pink[200],
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Text(
                'Photo: ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              ...imageWidgets,
            ],
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

  Widget buildSubmitButton() {
    return InkWell(
      onTap: () async {
        final date = dateTextEditingController.text;
        final category = categoryTextEditingController.text;
        final name = nameTextEditingController.text;
        final time = timeTextEditingController.text;
        final description = descriptionTextEditingController.text;

        // CollectionReference vols =
        //     FirebaseFirestore.instance.collection('vols');

        List<String> imageUrls = [];

        for (var image in images) {
          late final UploadTask uploadTask;
          Reference ref = FirebaseStorage.instance
              .ref()
              .child('vol_images')
              .child('/${DateTime.now().microsecondsSinceEpoch}');
          final metadata = SettableMetadata(
            contentType: 'image/jpeg',
            customMetadata: {'picked-file-path': image.path},
          );

          if (kIsWeb) {
            // uploadTask = ref.putData(await file.readAsBytes(), metadata);
          } else {
            uploadTask = ref.putFile(File(image.path), metadata);
          }
          await uploadTask;
          imageUrls.add(await ref.getDownloadURL());
        }

        // vols.add({
        //   'date': date,
        //   'category': category,
        //   'name': name,
        //   'time': time,
        //   'description': description,
        //   'createdAt': Timestamp.fromDate(DateTime.now()),
        //   'images': imageUrls,
        //   'email': FirebaseAuth.instance.currentUser?.email,
        // });
        const snackBar = SnackBar(
          content: Text('Submit Button'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Card(
        elevation: 10,
        child: Container(
          width: 350,
          height: 80,
          color: Colors.purple,
          padding: const EdgeInsets.all(8),
          child: const Center(child: Text('submit!')),
        ),
      ),
    );
  }
}
