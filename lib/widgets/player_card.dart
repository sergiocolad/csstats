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
      cardDecoration = const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/golden_background.png'),
          fit: BoxFit.cover,
        ),
      );
    } else if (index == 2) {
      cardDecoration = const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/silver_background.png'),
          fit: BoxFit.cover,
        ),
      );
    } else if (index == 3) {
      cardDecoration = const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bronze_background.png'),
          fit: BoxFit.cover,
        ),
      );
    } else {
      cardDecoration = const BoxDecoration(
        color: Color.fromARGB(255, 210, 233, 245),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        decoration: cardDecoration,
        padding: const EdgeInsets.all(12.0),
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
            AvatarWidget(avatarUrl: player.avatarUrl, radius: 25),
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
                          fontSize: 18.0,
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
}
