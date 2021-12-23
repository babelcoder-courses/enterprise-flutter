import 'package:enterprise_flutter/modules/users/models/user_item.dart';
import 'package:flutter/material.dart';

class AuthorView extends StatelessWidget {
  final User author;

  const AuthorView({Key? key, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                author.avatar,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(author.name),
                    const Text('Creator of this article'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
