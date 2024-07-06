import 'package:flutter/material.dart';

class RankBadge extends StatelessWidget {
  final String rank;

  const RankBadge({
    super.key,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF000C44),
        image: const DecorationImage(
          image: NetworkImage('https://static.csstats.gg/images/ranks/cs2/rating.rare.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Text(
        rank,
        style: const TextStyle(
          fontSize: 16.0,
          color: Color(0xFF4B69FF),
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(0.5, 0.5),
              blurRadius: 1.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
