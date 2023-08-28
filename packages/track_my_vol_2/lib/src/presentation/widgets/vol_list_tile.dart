import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VolListTile extends StatelessWidget {
  const VolListTile({
    super.key,
    required this.title,
    required this.category,
    required this.fullName,
    required this.description,
    required this.image,
    required this.date,
    required this.minutes,
    this.onLongPress,
  });

  final String title;
  final String category;
  final String fullName;
  final String description;
  final String date;
  final int minutes;
  final ImageProvider image;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.go('/vol/123');
      },
      onLongPress: onLongPress,
      child: SizedBox(
        height: 140,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16),
            Image(width: 96, height: 96, image: image),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),
                Text('$fullName | $date'),
                Text('Minutes : $minutes'),
                Text('Category : $category'),
                Text(title),
                Text(description),
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
    properties.add(StringProperty('category', category));
    properties.add(StringProperty('fullName', fullName));
    properties.add(
        ObjectFlagProperty<void Function()?>.has('onLongPress', onLongPress));
  }
}
