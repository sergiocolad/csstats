import 'package:flutter/material.dart';
import 'screens/player_screen.dart';

void main() {
  runApp(const CSStatsApp());
}

class CSStatsApp extends StatelessWidget {
  const CSStatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ranking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlayersScreen(),
    );
  }
}
