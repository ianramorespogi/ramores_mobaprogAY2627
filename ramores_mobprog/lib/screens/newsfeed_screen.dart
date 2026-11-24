import 'package:flutter/material.dart';

import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // Post without an image
        NewsFeedCard(
          userName: 'Ian Joshua Ramores',
          postContent: 'Kamusta',
          numOfLikes: 100,
          date: 'October 11',
          profileImagePath: 'assets/images/ian.jpg',
        ),
        // Post with an image
        NewsFeedCard(
          userName: 'Roben Juanatas',
          postContent: 'Kicking off the holiday season with ICpEP-NCR!',
          numOfLikes: 200,
          date: 'December 2',
          profileImagePath: 'assets/images/Manny-Pacquiao_NYE.jpg',
          imagePath: 'assets/images/christmas_post.png',
        ),
      ],
    );
  }
}
