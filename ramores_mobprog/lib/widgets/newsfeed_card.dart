import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';
import 'post_actions.dart';
import 'profile_avatar.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final String? imagePath; // Enhancement 1: null = no image
  final String? profileImagePath; // Enhancement 2: null = default icon
  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    this.imagePath,
    this.profileImagePath,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileAvatar(imagePath: profileImagePath),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomFont(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(3),
                        ),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: ScreenUtil().setSp(15),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(5)),
            // Post Content
            CustomFont(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            // Enhancement 1: show the image only if the post has one
            if (imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().setSp(8)),
                child: Image.asset(
                  imagePath!,
                  width: double.infinity,
                  height: ScreenUtil().setHeight(220),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: ScreenUtil().setHeight(220),
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
            // Enhancement 3: Like / Comment / Share widget
            PostActions(numOfLikes: numOfLikes),

            Row(
              children: [
                const ProfileAvatar(radius: 14),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setSp(10), 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  height: ScreenUtil().setHeight(25),
                  width: ScreenUtil().setWidth(320),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setSp(10))),
                  ),
                  child: CustomFont(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CustomFont(
                text: 'View comments',
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ],
        ),
      ),
    );
  }
}
