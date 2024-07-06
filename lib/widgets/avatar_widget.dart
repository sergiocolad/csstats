import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String avatarUrl;
  final double radius;

  const AvatarWidget({
    super.key,
    required this.avatarUrl,
    this.radius = 25,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
      radius: radius,
      child: avatarUrl.isEmpty ? const Icon(Icons.person) : null,
    );
  }
}
