import 'package:flutter/material.dart';

class CustomProductWidget extends StatelessWidget {
  final String? title;
  final String? thumbnail;
  final double? price;
  final String? category;
  const CustomProductWidget({
    super.key,
    this.title,
    this.thumbnail,
    this.price,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(alignment: Alignment.bottomRight, children: [
          CircleAvatar(
            backgroundColor: Colors.pink[50],
            radius: 25,
            backgroundImage: NetworkImage(thumbnail!),
          ),
          CircleAvatar(
            radius: 7,
            backgroundColor: Colors.grey[400],
            child: const Icon(
              Icons.add,
              size: 10,
            ),
          )
        ]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 200,
                    child: Text(
                      category!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                Text("$price \$"),
              ],
            )
          ],
        )
      ],
    );
  }
}
