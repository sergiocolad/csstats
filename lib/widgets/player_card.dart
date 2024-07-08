import 'package:flutter/material.dart';
import '../models/player.dart';
import 'player_info_row.dart';
import 'avatar_widget.dart';
import 'custom_text.dart';
import 'rank_badge.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  final int index;

  const PlayerCard({super.key, required this.player, required this.index});

  @override
  Widget build(BuildContext context) {
    BoxDecoration cardDecoration;

    if (index == 1) {
      cardDecoration = getCardBackground('assets/images/golden_background.png');
    } else if (index == 2) {
      cardDecoration = getCardBackground('assets/images/silver_background.png');
    } else if (index == 3) {
      cardDecoration = getCardBackground('assets/images/bronze_background.png');
    } else {
      cardDecoration = getCardBackground('assets/images/pearl_background.png');
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Container(
        decoration: cardDecoration,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: getOrdinal(index),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(width: 16.0),
            AvatarWidget(avatarUrl: player.avatarUrl, radius: 30),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: player.name,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      RankBadge(rank: player.rank),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  PlayerInfoRow(label: 'K/D', value: player.kd),
                  PlayerInfoRow(label: 'ADR', value: player.adr.toString()),
                  PlayerInfoRow(label: 'HLTV Rating', value: player.hltvRating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getOrdinal(int number) {
    if (number == 1) return '1st';
    if (number == 2) return '2nd';
    if (number == 3) return '3rd';
    return '${number}th';
  }

  BoxDecoration getCardBackground(String? imgPath) {
    if (imgPath != null) {
      return BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgPath), fit: BoxFit.cover),
      );
    } else {
      return const BoxDecoration(
        color: Color(0xFFFFFFFF),
      );
    }
  }
}
