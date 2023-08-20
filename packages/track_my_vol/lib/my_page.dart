import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      // body: SingleChildScrollView(
      //   child: Center(
      //     child: Column(
      //       children: <Widget>[
      //         buildTotalContainer(),
      //         buildActivityListView(),
      //       ],
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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

  Widget buildTotalContainer() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(blurRadius: 10),
        ],
        color: Colors.pink[200],
      ),
      padding: const EdgeInsets.all(8),
      child: const Text(
        'Total: ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget buildActivityListView() {
    a() async {
      // print('call a!');
      // CollectionReference vols = FirebaseFirestore.instance.collection('vols');

      // QuerySnapshot snapshot = await vols
      //     .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
      //     .get();
      // print(snapshot.docs);

      // for (var doc in snapshot.docs) {
      //   print(doc.data());
      // }
    }

    a();

    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('vols').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          for (var data in snapshot.data!.docs) {
            print(data);
          }
          return Text("Full Name: ");
        }

        return Text("loading");
      },
    );
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                color: Colors.blueAccent,
                width: double.infinity,
                height: 80,
                child: const Center(child: Text('Activity Name')),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.grey[100],
                height: 80,
                width: double.infinity,
                child: const Center(child: Text('Hours')),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                color: Colors.blueAccent,
                width: double.infinity,
                height: 80,
                child: const Center(child: Text('Activity Name')),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.grey[100],
                height: 80,
                width: double.infinity,
                child: const Center(child: Text('Hours')),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                color: Colors.blueAccent,
                width: double.infinity,
                height: 80,
                child: const Center(child: Text('Activity Name')),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.grey[100],
                height: 80,
                width: double.infinity,
                child: const Center(child: Text('Hours')),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                color: Colors.blueAccent,
                width: double.infinity,
                height: 80,
                child: const Center(child: Text('Activity Name')),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.grey[100],
                height: 80,
                width: double.infinity,
                child: const Center(child: Text('Hours')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
