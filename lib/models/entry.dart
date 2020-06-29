class Entry {
  String id;
  String userId;
  String challengeId;
  String image;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Entry({
    this.id,
    this.userId,
    this.challengeId,
    this.image,
  });

  Entry copyWith({
    String id,
    String userId,
    String challengeId,
    String image,
  }) {
    return new Entry(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      challengeId: challengeId ?? this.challengeId,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'Entry{id: $id, userId: $userId, challengeId: $challengeId, image: $image}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Entry &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          challengeId == other.challengeId &&
          image == other.image);

  @override
  int get hashCode =>
      id.hashCode ^ userId.hashCode ^ challengeId.hashCode ^ image.hashCode;

  factory Entry.fromMap(Map<String, dynamic> map) {
    return new Entry(
      id: map['id'] as String,
      userId: map['userId'] as String,
      challengeId: map['challengeId'] as String,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'userId': this.userId,
      'challengeId': this.challengeId,
      'image': this.image,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
