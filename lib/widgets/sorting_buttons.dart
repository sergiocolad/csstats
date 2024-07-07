import 'package:flutter/material.dart';

class SortingButtons extends StatelessWidget {
  final String sortBy;
  final void Function(String) updateSorting;

  const SortingButtons({super.key, required this.sortBy, required this.updateSorting});

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
              onPressed: () => updateSorting('kd'),
              style: ElevatedButton.styleFrom(
                backgroundColor: sortBy == 'kd' ? Colors.grey[700] : Colors.grey[500],
                minimumSize: const Size(50, 30),
              ),
              child: const Text(
                'K/D',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 4),
            ElevatedButton(
              onPressed: () => updateSorting('adr'),
              style: ElevatedButton.styleFrom(
                backgroundColor: sortBy == 'adr' ? Colors.grey[700] : Colors.grey[500],
                minimumSize: const Size(50, 30),
              ),
              child: const Text(
                'ADR',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 4),
            ElevatedButton(
              onPressed: () => updateSorting('rating'),
              style: ElevatedButton.styleFrom(
                backgroundColor: sortBy == 'rating' ? Colors.grey[700] : Colors.grey[500],
                minimumSize: const Size(60, 30),
              ),
              child: const Text(
                'HLTV Rating',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 4),
            ElevatedButton(
              onPressed: () => updateSorting('rank'),
              style: ElevatedButton.styleFrom(
                backgroundColor: sortBy == 'rank' ? Colors.grey[700] : Colors.grey[500],
                minimumSize: const Size(50, 30),
              ),
              child: const Text(
                'Rank',
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
