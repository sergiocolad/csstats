import 'package:flutter/material.dart';

class RankBadge extends StatelessWidget {
  final String rank;

  const RankBadge({
    super.key,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    var rankDouble = double.parse(rank.replaceAll(',', ''));
    if (rankDouble <= 4999) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF222222),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://static.csstats.gg/images/ranks/cs2/rating.common.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: 65,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text(
          rank,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFFB1C3D9),
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 1.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    } else if (rankDouble > 4999 && rankDouble <= 9999) {
      return Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 7, 15),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://static.csstats.gg/images/ranks/cs2/rating.uncommon.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: 65,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text(
          rank,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFF5E98D7),
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 1.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    } else if (rankDouble > 9999 && rankDouble <= 14999) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF000418),
          image: const DecorationImage(
            image: NetworkImage(
                'https://static.csstats.gg/images/ranks/cs2/rating.rare.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: 65,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text(
          rank,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFF4B69FF),
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 1.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    } else if (rankDouble > 14999 && rankDouble <= 19999) {
      return Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 15, 9, 26),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://static.csstats.gg/images/ranks/cs2/rating.mythical.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text(
          rank,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFF8846FF),
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 1.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    } else if (rankDouble > 19999 && rankDouble <= 24999) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A011D),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://static.csstats.gg/images/ranks/cs2/rating.legendary.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: 65,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text(
          rank,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFFD22CE6),
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 1.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    } else if (rankDouble > 24999 && rankDouble <= 29999) {
      return Container(
        decoration: const BoxDecoration(
            color: Color(0xFF720E0E),
            image: DecorationImage(
                image: NetworkImage(
                    'https://static.csstats.gg/images/ranks/cs2/rating.ancient.png'),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text(
          rank,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFFEB4B4B),
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 1.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF615303),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://static.csstats.gg/images/ranks/cs2/rating.unusual.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: 65,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text(
          rank,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFFFED700),
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 1.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    }
  }
}
