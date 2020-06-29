class User {
  String id;
  String email;
  String image;
  String phone;
  List<String> pushTokens;
  String firstname;
  String lastname;
  String street;
  String city;
  String zip;
  String country;
  int water;
  int fire;
  int earth;
  int level;

//<editor-fold desc="Data Methods" defaultstate="collapsed">
  User.createUser() {
    this.pushTokens = new List<String>();
  }

  User({
    this.id,
    this.email,
    this.image,
    this.phone,
    this.pushTokens,
    this.firstname,
    this.lastname,
    this.street,
    this.city,
    this.zip,
    this.country,
    this.water,
    this.fire,
    this.earth,
    this.level,
  });

  User copyWith({
    String id,
    String email,
    String image,
    String phone,
    List<String> pushTokens,
    String firstname,
    String lastname,
    String street,
    String city,
    String zip,
    String country,
    int water,
    int fire,
    int earth,
    int level,
  }) {
    return new User(
      id: id ?? this.id,
      email: email ?? this.email,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      pushTokens: pushTokens ?? this.pushTokens,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      street: street ?? this.street,
      city: city ?? this.city,
      zip: zip ?? this.zip,
      country: country ?? this.country,
      water: water ?? this.water,
      fire: fire ?? this.fire,
      earth: earth ?? this.earth,
      level: level ?? this.level,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, image: $image, phone: $phone, pushTokens: $pushTokens, firstname: $firstname, lastname: $lastname, street: $street, city: $city, zip: $zip, country: $country, water: $water, fire: $fire, earth: $earth, level: $level}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          image == other.image &&
          phone == other.phone &&
          pushTokens == other.pushTokens &&
          firstname == other.firstname &&
          lastname == other.lastname &&
          street == other.street &&
          city == other.city &&
          zip == other.zip &&
          country == other.country &&
          water == other.water &&
          fire == other.fire &&
          earth == other.earth &&
          level == other.level);

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      image.hashCode ^
      phone.hashCode ^
      pushTokens.hashCode ^
      firstname.hashCode ^
      lastname.hashCode ^
      street.hashCode ^
      city.hashCode ^
      zip.hashCode ^
      country.hashCode ^
      water.hashCode ^
      fire.hashCode ^
      earth.hashCode ^
      level.hashCode;

  factory User.fromMap(Map<String, dynamic> map) {
    return new User(
      id: map['id'] as String,
      email: map['email'] as String,
      image: map['image'] != null ? map['image'] as String : "",
      phone: map['phone'] as String,
      pushTokens: List.from(map['pushTokens']),
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      street: map['street'] as String,
      city: map['city'] as String,
      zip: map['zip'] as String,
      country: map['country'] as String,
      water: map['water'] as int,
      fire: map['fire'] as int,
      earth: map['earth'] as int,
      level: map['level'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'email': this.email,
      'image': this.image,
      'phone': this.phone,
      'pushTokens': this.pushTokens.map((i) => i.toString()).toList(),
      'firstname': this.firstname,
      'lastname': this.lastname,
      'street': this.street,
      'city': this.city,
      'zip': this.zip,
      'country': this.country,
      'water': this.water,
      'fire': this.fire,
      'earth': this.earth,
      'level': this.level,
    } as Map<String, dynamic>;
  }

//</editor-fold>
}
