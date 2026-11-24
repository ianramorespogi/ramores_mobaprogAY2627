# Ian Joshua A. Ramores
### INF247
### 2024-1003616

Laboratory 0: Lorem Ipsum

Lab Activity 1: I replaced the bool hasImage in newsfeed_card.dart with an optional String? imagePath. Inside the card I used "if (imagePath != null)" so the Image.asset is only shown when a post has an image; if it is null, nothing is added and no empty space is left. In newsfeed_screen.dart, my post has no imagePath while Roben Juanatas' post has one, so one NewsFeedCard widget handles both cases. I also made a ProfileAvatar widget that shows a profile photo or a default icon, and a PostActions widget that uses setState to update the like count when Like is tapped.
