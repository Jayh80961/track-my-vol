import 'package:flutter/material.dart';

class VolPageViewMobile extends StatelessWidget {
  const VolPageViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track My Vol',
        ),
        elevation: 1,
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Dialog with hero icon'),
                      content: Text(
                        'A dialog is a type of modal window that '
                        'appears in front of app content to provide '
                        'critical information, or ask for a decision.',
                      ),
                      actions: [
                        TextButton(child: Text("Enabled"), onPressed: () {}),
                        TextButton(child: Text("Enabled"), onPressed: () {}),
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete_outlined,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Image(
            image: AssetImage('assets/images/icon.png'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            children: <Widget>[
              const SizedBox(width: 8),
              Icon(size: 80, Icons.account_circle_outlined),
              const SizedBox(width: 16),
              Text('Jay'),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text('title'),
          Text('description'),
        ],
      ),
    );
  }
}
