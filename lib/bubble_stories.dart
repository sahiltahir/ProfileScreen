import 'package:flutter/material.dart';

class BubbleStories extends StatelessWidget {
  final String text;
  final String image;
  const BubbleStories(
      {Key? key,
      required this.text,
      this.image = 'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(image))),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text.length > 5 ? '${text.substring(0, 5)}..' : text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
