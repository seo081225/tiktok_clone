import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';

class HomePage extends StatelessWidget {
  final List<Post> posts = [
    Post(
      type: PostType.text,
      nickname: "pubity",
      content: 'This is a text post.',
      image: [],
    ),
    Post(
      type: PostType.image,
      nickname: "thetinderblog",
      content: 'Hello',
      image: ['https://placedog.net/500'],
    ),
    Post(
      type: PostType.image,
      nickname: "tropicalseductions",
      content: 'See my pet',
      image: ['https://placedog.net/501'],
    ),
    Post(
      type: PostType.text,
      nickname: "terracottacoco",
      content: 'How do you do, fellow kids?',
      image: [],
    ),
    Post(
      type: PostType.text,
      nickname: "shityoushouldcareabout",
      content: 'my phone feels like a vibrator',
      image: [],
    ),
    Post(
      type: PostType.image,
      nickname: "thetinderblog",
      content: 'Hi',
      image: [
        'https://placedog.net/503',
        'https://placedog.net/510',
        'https://placedog.net/404'
      ],
    ),
    Post(
      type: PostType.image,
      nickname: "tropicalseductions",
      content: 'Show',
      image: ['https://placedog.net/505', 'https://placedog.net/400'],
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          if (post.type == PostType.text) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(post.nickname.substring(0, 1),
                              style: const TextStyle(
                                  height: 1,
                                  fontSize: Sizes.size32,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  post.nickname,
                                  style: const TextStyle(
                                      fontSize: Sizes.size20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Text('2m',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: Sizes.size16)),
                                      Gaps.h10,
                                      FaIcon(
                                        FontAwesomeIcons.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(post.content,
                                style: const TextStyle(fontSize: Sizes.size20))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gaps.v10,
                  const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        FaIcon(FontAwesomeIcons.heart),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.message),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.arrowsRotate),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.paperPlane),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (post.type == PostType.image) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(post.nickname.substring(0, 1),
                              style: const TextStyle(
                                  height: 1,
                                  fontSize: Sizes.size32,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  post.nickname,
                                  style: const TextStyle(
                                      fontSize: Sizes.size20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Text('5m',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: Sizes.size16)),
                                      Gaps.h10,
                                      FaIcon(
                                        FontAwesomeIcons.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(post.content,
                                style: const TextStyle(fontSize: Sizes.size20))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gaps.v5,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Gaps.h60,
                        for (var img in post.image)
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Sizes.size8),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * (2 / 3),
                                width: 330,
                                child: Image.network(img, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Gaps.v10,
                  const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        FaIcon(FontAwesomeIcons.heart),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.message),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.arrowsRotate),
                        Gaps.h16,
                        FaIcon(FontAwesomeIcons.paperPlane),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return null;
          //  return const SizedBox.shrink();
        },
      ),
    );
  }
}

enum PostType { text, image }

class Post {
  final PostType type;
  final String nickname, content;
  final List image;

  Post({
    required this.type,
    required this.nickname,
    required this.content,
    required this.image,
  });
}
