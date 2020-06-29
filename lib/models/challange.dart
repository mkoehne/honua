class Challenge {
  String id;
  String title;
  String image;
  String description;
  int category;
  int points;
  String website;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Challenge({
    this.id,
    this.title,
    this.image,
    this.description,
    this.category,
    this.points,
    this.website,
  });

  Challenge copyWith({
    String id,
    String title,
    String image,
    String description,
    int category,
    int points,
    String website,
  }) {
    return new Challenge(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
      category: category ?? this.category,
      points: points ?? this.points,
      website: website ?? this.website,
    );
  }

  @override
  String toString() {
    return 'Challenge{id: $id, title: $title, image: $image, description: $description, category: $category, points: $points, website: $website}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Challenge &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          image == other.image &&
          description == other.description &&
          category == other.category &&
          points == other.points &&
          website == other.website);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      image.hashCode ^
      description.hashCode ^
      category.hashCode ^
      points.hashCode ^
      website.hashCode;

  factory Challenge.fromMap(Map<String, dynamic> map) {
    return new Challenge(
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      category: map['category'] as int,
      points: map['points'] as int,
      website: map['website'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'title': this.title,
      'image': this.image,
      'description': this.description,
      'category': this.category,
      'points': this.points,
      'website': this.website,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
