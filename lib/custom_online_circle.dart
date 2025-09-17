import 'package:flutter/material.dart';

class CustomOnlineCircle extends StatelessWidget {
  final String? name;
  final String? imagePath;

  const CustomOnlineCircle({
    super.key,
    this.name,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 50,
        child: Column(
          children: [
            Stack(alignment: Alignment.bottomRight, children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(imagePath!),
              ),
              const CircleAvatar(
                radius: 7,
                backgroundColor: Colors.green,
              )
            ]),
            Text(
              name!, maxLines: 1, textAlign: TextAlign.center,
              //  overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
