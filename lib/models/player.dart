class Player {
  final String nickName;
  final String socketID;
  final double points;
  final String playerType;

  Player(
      {required this.nickName,
      required this.socketID,
      required this.points,
      required this.playerType});


  Map<String, dynamic> toMap() {
    return {
      'nickName': nickName,
      'socketID': socketID,
      'points': points,
      'playerType': playerType,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickName: map['nickName'] ?? '',
      socketID: map['socketID'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      playerType: map['playerType'] ?? '',
    );
  }

  Player copyWith({
    String? nickname,
    String? socketID,
    double? points,
    String? playerType,
  }) {
    return Player(
      nickName: nickname ?? this.nickName,
      socketID: socketID ?? this.socketID,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }
}
