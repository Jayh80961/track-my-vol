import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              buildTotalContainer(),
              buildActivityListView(),
            ],
          ),
        ),
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
