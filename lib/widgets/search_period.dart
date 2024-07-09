import 'package:flutter/material.dart';

class SearchPeriod extends StatelessWidget {
  final int searchPeriod;
  final void Function(int) fetchPlayers;

  const SearchPeriod(
      {super.key, required this.searchPeriod, required this.fetchPlayers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 2),
            ElevatedButton(
              onPressed: () => fetchPlayers(0),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    searchPeriod == 0 ? Colors.grey[700] : Colors.grey[500],
              ),
              child: const Text(
                'All time',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 2),
            ElevatedButton(
              onPressed: () => fetchPlayers(30),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    searchPeriod == 30 ? Colors.grey[700] : Colors.grey[500],
              ),
              child: const Text(
                '30 days',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 2),
            ElevatedButton(
              onPressed: () => fetchPlayers(7),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    searchPeriod == 7 ? Colors.grey[700] : Colors.grey[500],
              ),
              child: const Text(
                '7 days',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
