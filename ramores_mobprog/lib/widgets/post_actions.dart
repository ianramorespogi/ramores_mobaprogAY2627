import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_text.dart';

// Enhancement 3: Like / Comment / Share as its own widget.
// It remembers if the post is liked and updates the like count.
class PostActions extends StatefulWidget {
  final int numOfLikes;

  const PostActions({super.key, this.numOfLikes = 0});

  @override
  State<PostActions> createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {
  late int _likes;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _likes = widget.numOfLikes;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likes += _isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color likeColor = _isLiked ? FB_PRIMARY : FB_DARK_PRIMARY;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: _toggleLike,
          icon: Icon(
            _isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
            color: likeColor,
          ),
          label: CustomFont(
            text: _likes.toString(),
            fontSize: ScreenUtil().setSp(12),
            color: likeColor,
            fontWeight: _isLiked ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.comment_outlined,
            color: FB_DARK_PRIMARY,
          ),
          label: CustomFont(
            text: 'Comment',
            fontSize: ScreenUtil().setSp(12),
            color: FB_DARK_PRIMARY,
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.redo,
            color: FB_DARK_PRIMARY,
          ),
          label: CustomFont(
            text: 'Share',
            fontSize: ScreenUtil().setSp(12),
            color: FB_DARK_PRIMARY,
          ),
        ),
      ],
    );
  }
}
