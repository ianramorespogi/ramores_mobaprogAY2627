import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Enhancement 2: reusable profile avatar.
// Shows the user's photo if imagePath is given, otherwise a person icon.
class ProfileAvatar extends StatelessWidget {
  final String? imagePath;
  final double radius;

  const ProfileAvatar({
    super.key,
    this.imagePath,
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: ScreenUtil().setSp(radius),
      backgroundColor: Colors.grey[300],
      backgroundImage: imagePath != null ? AssetImage(imagePath!) : null,
      child: imagePath == null
          ? Icon(
              Icons.person,
              color: Colors.white,
              size: ScreenUtil().setSp(radius * 1.4),
            )
          : null,
    );
  }
}
