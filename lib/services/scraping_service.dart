import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import '../models/player.dart';
import 'package:flutter/foundation.dart';

class ScrapingService {
  Future<Player> fetchPlayerInfo(int id, int searchPeriod, {int retries = 5}) async {
    String url = '';

    if (searchPeriod == 0) {
      url = 'https://csstats.gg/player/$id';
    } else {
      url = 'https://csstats.gg/player/$id?date=$searchPeriod''d';
    }

    for (int attempt = 0; attempt < retries; attempt++) {
      try {
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          if (kDebugMode) {
            print('Success for player $id.');
          }
          return compute(parsePlayer, response.body);
        } else {
          if (kDebugMode) {
            print('Failed to load webpage for player $id, status code: ${response.statusCode}');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching player $id: $e');
        }
      }

      // Adicionar um pequeno atraso antes de tentar novamente
      await Future.delayed(const Duration(seconds: 1));
      if (kDebugMode) {
        print('Retrying... (${attempt + 1}/$retries)');
      }
    }

    throw Exception('Failed to load webpage for player $id after $retries attempts');
  }

  Future<List<Player>> fetchPlayersInfos(List<int> ids, int searchPeriod) async {
    List<Player> players = [];

    for (var id in ids) {
      try {
        Player player = await fetchPlayerInfo(id, searchPeriod);
        players.add(player);
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching player $id: $e');
        }
      }
    }

    return players;
  }
}

Player parsePlayer(String responseBody) {
  var document = parser.parse(responseBody);
  var playerNameElement = document.getElementById('player-name');
  var kdElement = document.getElementById('kpd')?.querySelector('span');
  var hltvRatingElement = document.getElementById('rating')?.querySelector('span');
  var avatarElement = document.getElementById('player-avatar')?.querySelector('img');

  // Encontrar a div com a classe total-stat e a label com "Damage" e "Rounds"
  var totalLabelElements = document.querySelectorAll('.total-label');
  String damageValueStr = '0';
  String roundsValueStr = '0';

  for (var element in totalLabelElements) {
    if (element.text.trim() == 'Damage') {
      var damageElement = element.nextElementSibling;
      if (damageElement != null && damageElement.classes.contains('total-value')) {
        damageValueStr = damageElement.text.trim().replaceAll(',', '');  // Remove commas if any
      }
    }
    if (element.text.trim() == 'Rounds') {
      var roundsElement = element.nextElementSibling;
      if (roundsElement != null && roundsElement.classes.contains('total-value')) {
        roundsValueStr = roundsElement.text.trim().replaceAll(',', '');  // Remove commas if any
      }
    }
  }

  int damageValue = int.tryParse(damageValueStr) ?? 0;
  int roundsValue = int.tryParse(roundsValueStr) ?? 0;
  int adrValue = roundsValue > 0 ? (damageValue / roundsValue).round() : 0;

  // Extrair Rank
  var rankElement = document.querySelector('.rank .cs2rating');
  String rankValue = 'Unknown Rank';
  if (rankElement != null) {
    var spanElement = rankElement.querySelector('span');
    if (spanElement != null) {
      rankValue = spanElement.text.trim();
    }
  }

  String playerName = playerNameElement != null ? playerNameElement.text.trim() : 'Unknown Player';
  String avatarUrl = avatarElement != null ? avatarElement.attributes['src'] ?? 'No avatar found' : 'No avatar found';

  return Player(
    name: playerName,
    kd: kdElement != null ? kdElement.text.trim() : 'Unable to load Player K/D',
    hltvRating: hltvRatingElement != null ? hltvRatingElement.text.trim() : 'Unable to load Player HLTV Rating',
    avatarUrl: avatarUrl,
    adr: adrValue,
    rank: rankValue,
  );
}
