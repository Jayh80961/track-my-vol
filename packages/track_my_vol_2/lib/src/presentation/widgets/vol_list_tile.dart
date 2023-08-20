import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VolListTile extends StatelessWidget {
  const VolListTile({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.minutes,
  });

  final String title;
  final String description;
  final String date;
  final int minutes;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.go('/vol/123');
      },
      child: SizedBox(
        height: 128,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16),
            Image(width: 96, height: 96, image: image),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),
                Text(title),
                Text(description),
                Text(date),
                Text('Minutes : $minutes'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ImageProvider<Object>>('image', image));
    properties.add(StringProperty('description', description));
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('date', date));
    properties.add(IntProperty('hours', minutes));
  }
}
