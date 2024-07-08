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
      return getPlayerBadge(const Color(0xFF222222), const Color(0xFFB1C3D9),
          'https://static.csstats.gg/images/ranks/cs2/rating.common.png', rank);
    } else if (rankDouble > 4999 && rankDouble <= 9999) {
      return getPlayerBadge(
          const Color(0xFF00070F),
          const Color(0xFF5E98D7),
          'https://static.csstats.gg/images/ranks/cs2/rating.uncommon.png',
          rank);
    } else if (rankDouble > 9999 && rankDouble <= 14999) {
      return getPlayerBadge(const Color(0xFF000418), const Color(0xFF4B69FF),
          'https://static.csstats.gg/images/ranks/cs2/rating.rare.png', rank);
    } else if (rankDouble > 14999 && rankDouble <= 19999) {
      return getPlayerBadge(
          const Color(0xFF0F091A),
          const Color(0xFF8846FF),
          'https://static.csstats.gg/images/ranks/cs2/rating.mythical.png',
          rank);
    } else if (rankDouble > 19999 && rankDouble <= 24999) {
      return getPlayerBadge(
          const Color(0xFF1A011D),
          const Color(0xFFD22CE6),
          'https://static.csstats.gg/images/ranks/cs2/rating.legendary.png',
          rank);
    } else if (rankDouble > 24999 && rankDouble <= 29999) {
      return getPlayerBadge(
          const Color(0xFF720E0E),
          const Color(0xFFEB4B4B),
          'https://static.csstats.gg/images/ranks/cs2/rating.ancient.png',
          rank);
    } else {
      return getPlayerBadge(
          const Color(0xFF615303),
          const Color(0xFFFED700),
          'https://static.csstats.gg/images/ranks/cs2/rating.unusual.png',
          rank);
    }
  }

  Widget getPlayerBadge(
      Color badgeColor, Color fontColor, String badgeImgPath, rank) {
    return Container(
      width: 65,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: badgeColor,
        image: DecorationImage(
          image: NetworkImage(badgeImgPath),
          fit: BoxFit.cover,
        ),
      ),
      child: getFormatedRank(rank, fontColor),
    );
  }

  Widget getFormatedRank(String rank, Color fontColor) {
    var commaIndex = rank.indexOf(',');
    var strRank = rank.substring(0, commaIndex + 1);
    var strRankX = rank.substring(commaIndex + 1);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: strRank,
            style: getFontStyle(fontColor, 16),
          ),
          TextSpan(
            text: strRankX,
            style: getFontStyle(fontColor, 14),
          ),
        ],
      ),
    );
  }

  TextStyle getFontStyle(Color fontColor, double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      color: fontColor,
      fontWeight: FontWeight.bold,
      shadows: const [
        Shadow(
          offset: Offset(1.5, 1.5),
          blurRadius: 1.0,
          color: Colors.black,
        ),
      ],
    );
  }
}
