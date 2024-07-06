import 'package:flutter/material.dart';
import '../models/player.dart';
import 'player_card.dart';

class PlayersList extends StatelessWidget {
  final List<Player> players;

  const PlayersList({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        Player player = players[index];
        return PlayerCard(player: player, index: index + 1);
      },
    );
  }
}
