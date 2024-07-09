import 'package:csstats/widgets/search_period.dart';
import 'package:flutter/material.dart';
import '../models/player.dart';
import '../services/scraping_service.dart';
import '../widgets/sorting_buttons.dart';
import '../widgets/players_list.dart';

const List<int> playerIds = [
  76561198202426681,
  76561198021538191,
  76561198201310973,
  76561198176928878,
  76561199111243297,
  76561197989156009,
  76561198117018657,
  76561199065352535,
];

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({super.key});

  @override
  PlayersScreenState createState() => PlayersScreenState();
}

class PlayersScreenState extends State<PlayersScreen> {
  late Future<List<Player>> futurePlayers;
  List<Player> players = [];
  String sortBy = 'kd';
  int searchPeriod = 0;

  @override
  void initState() {
    super.initState();
    futurePlayers = fetchPlayers(searchPeriod);
  }

  Future<List<Player>> fetchPlayers(int searchPeriod) async {
    ScrapingService scrapingService = ScrapingService();
    List<Player> fetchedPlayers =
        await scrapingService.fetchPlayersInfos(playerIds, searchPeriod);
    setState(() {
      players = fetchedPlayers;
      sortPlayers();
    });
    return fetchedPlayers;
  }

  void sortPlayers() {
    if (sortBy == 'kd') {
      players.sort((a, b) {
        int compare = double.parse(b.kd.replaceAll(',', ''))
            .compareTo(double.parse(a.kd.replaceAll(',', '')));
        if (compare == 0) {
          compare = double.parse(b.hltvRating.replaceAll(',', ''))
              .compareTo(double.parse(a.hltvRating.replaceAll(',', '')));
          if (compare == 0) {
            compare = b.adr.compareTo(a.adr);
            if (compare == 0) {
              compare = int.parse(b.rank.replaceAll(',', ''))
                  .compareTo(int.parse(a.rank.replaceAll(',', '')));
            }
          }
        }
        return compare;
      });
    } else if (sortBy == 'adr') {
      players.sort((a, b) {
        int compare = b.adr.compareTo(a.adr);
        if (compare == 0) {
          compare = double.parse(b.kd.replaceAll(',', ''))
              .compareTo(double.parse(a.kd.replaceAll(',', '')));
          if (compare == 0) {
            compare = double.parse(b.hltvRating.replaceAll(',', ''))
                .compareTo(double.parse(a.hltvRating.replaceAll(',', '')));
            if (compare == 0) {
              compare = int.parse(b.rank.replaceAll(',', ''))
                  .compareTo(int.parse(a.rank.replaceAll(',', '')));
            }
          }
        }
        return compare;
      });
    } else if (sortBy == 'rating') {
      players.sort((a, b) {
        int compare = double.parse(b.hltvRating.replaceAll(',', ''))
            .compareTo(double.parse(a.hltvRating.replaceAll(',', '')));
        if (compare == 0) {
          compare = double.parse(b.kd.replaceAll(',', ''))
              .compareTo(double.parse(a.kd.replaceAll(',', '')));
          if (compare == 0) {
            compare = b.adr.compareTo(a.adr);
            if (compare == 0) {
              compare = int.parse(b.rank.replaceAll(',', ''))
                  .compareTo(int.parse(a.rank.replaceAll(',', '')));
            }
          }
        }
        return compare;
      });
    } else if (sortBy == 'rank') {
      players.sort((a, b) => int.parse(b.rank.replaceAll(',', ''))
          .compareTo(int.parse(a.rank.replaceAll(',', ''))));
    }
  }

  void updateSorting(String criterion) {
    setState(() {
      sortBy = criterion;
      sortPlayers();
    });
  }

  void updateSearchPeriod(int period) {
    setState(() {
      searchPeriod = period;
      futurePlayers = fetchPlayers(searchPeriod);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking dos patetas'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchPeriod(
            searchPeriod: searchPeriod,
            fetchPlayers: updateSearchPeriod,
          ),
          SortingButtons(
            sortBy: sortBy,
            updateSorting: updateSorting,
          ),
          Expanded(
            child: FutureBuilder<List<Player>>(
              future: futurePlayers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No player data found.'));
                } else {
                  return PlayersList(players: players);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
