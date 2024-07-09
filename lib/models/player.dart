class Player {
  final int id;
  final String name;
  final String kd;
  final String hltvRating;
  final String avatarUrl;
  final int adr;
  final String rank;

  Player({
    required this.id,
    required this.name,
    required this.kd,
    required this.hltvRating,
    required this.avatarUrl,
    required this.adr,
    required this.rank,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rank': rank,
      'kd': kd,
      'hltvRating': hltvRating,
      'adr': adr,
      'avatarUrl': avatarUrl
      // Adicione outros campos conforme necessário
    };
  }
}
