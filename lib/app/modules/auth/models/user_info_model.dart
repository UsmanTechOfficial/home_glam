class UserInfoModel {
  final String? name;
  final String? email;
  final String? phoneNumber;

  const UserInfoModel({
    this.name,
    this.email,
    this.phoneNumber,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInfoModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          phoneNumber == other.phoneNumber);

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ phoneNumber.hashCode;

  @override
  String toString() {
    return 'UserInfoModel{ name: $name, email: $email, phoneNumber: $phoneNumber,}';
  }

  UserInfoModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
  }) {
    return UserInfoModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}
