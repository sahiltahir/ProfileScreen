import 'package:flutter/material.dart';
import 'social_details.dart';


import 'bubble_stories.dart';

class UserDetails extends StatelessWidget {
  UserDetails({
    Key? key,
  }) : super(key: key);

  final List names = ['Cat', 'Dog', 'elephane'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              social_details(
                count: "Shane Mathias",
                name: 'Co founder',
                fontSize: 20,
              )
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          //stories
          SizedBox(
            height: 110,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: names.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BubbleStories(text: names[index]);
                }),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Expanded(child: social_details(count: "12", name: "Posts")),
                VerticalDivider(
                  indent: 1,
                  thickness: 2,
                  color: Colors.black,
                ),
                Expanded(
                    child: social_details(count: "122", name: "Followers")),
                VerticalDivider(
                  indent: 1,
                  thickness: 2,
                  color: Colors.black,
                ),
                Expanded(
                    child: social_details(count: "290", name: "Following")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
