class UserInfoModel {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? profileUrl;
  final String? country;
  final String? location;

//<editor-fold desc="Data Methods">
  const UserInfoModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.profileUrl,
    this.country,
    this.location,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInfoModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          phoneNumber == other.phoneNumber &&
          profileUrl == other.profileUrl &&
          country == other.country &&
          location == other.location);

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      profileUrl.hashCode ^
      country.hashCode ^
      location.hashCode;

  @override
  String toString() {
    return 'UserInfoModel{ name: $name, email: $email, phoneNumber: $phoneNumber, profileUrl: $profileUrl, country: $country, location: $location,}';
  }

  UserInfoModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? profileUrl,
    String? country,
    String? location,
  }) {
    return UserInfoModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileUrl: profileUrl ?? this.profileUrl,
      country: country ?? this.country,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileUrl': profileUrl,
      'country': country,
      'location': location,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      profileUrl: map['profileUrl'] as String,
      country: map['country'] as String,
      location: map['location'] as String,
    );
  }

//</editor-fold>
}
