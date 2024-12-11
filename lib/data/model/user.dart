// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum Role {
  Admin,
  User,
}

// Helper method to convert string to Role
Role roleFromString(String roleAsString) {
  return Role.values
      .firstWhere((role) => role.toString().split('.')[1] == roleAsString);
}

// Helper method to convert Role to string
String roleToString(Role role) {
  return role.toString().split('.')[1];
}

class User {
  String id;
  String phone;
  String username;
  String userId;
  String hashedPassword;
  String firstName;
  String middleName;
  String lastName;
  String gender;
  String country;
  String state;
  String city;
  String agentType;
  String propertySize;
  String idUrl;
  String? tradeUrl;
  Role role;
  // DateTime createdAt;
  // DateTime updatedAt;
  User({
    required this.id,
    required this.phone,
    required this.username,
    required this.userId,
    required this.hashedPassword,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.country,
    required this.state,
    required this.city,
    required this.agentType,
    required this.propertySize,
    required this.idUrl,
    this.tradeUrl,
    required this.role,
    // required this.createdAt,
    // required this.updatedAt,
  });

  User copyWith({
    String? id,
    String? phone,
    String? username,
    String? userId,
    String? hashedPassword,
    String? firstName,
    String? middleName,
    String? lastName,
    String? gender,
    String? country,
    String? state,
    String? city,
    String? agentType,
    String? propertySize,
    String? idUrl,
    String? tradeUrl,
    Role? role,
    // DateTime? createdAt,
    // DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      userId: userId ?? this.userId,
      hashedPassword: hashedPassword ?? this.hashedPassword,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      agentType: agentType ?? this.agentType,
      propertySize: propertySize ?? this.propertySize,
      idUrl: idUrl ?? this.idUrl,
      tradeUrl: tradeUrl ?? this.tradeUrl,
      role: role ?? this.role,
      // createdAt: createdAt ?? this.createdAt,
      // updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phone': phone,
      'username': username,
      'userId': userId,
      'hashedPassword': hashedPassword,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'gender': gender,
      'country': country,
      'state': state,
      'city': city,
      'agentType': agentType,
      'propertySize': propertySize,
      'idUrl': idUrl,
      'tradeUrl': tradeUrl,
      'role': roleToString(role),
      // 'createdAt': createdAt.millisecondsSinceEpoch,
      // 'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      phone: map['phone'] as String,
      username: map['username'] as String,
      userId: map['userId'] as String,
      hashedPassword: map['hashedPassword'] as String,
      firstName: map['firstName'] as String,
      middleName: map['middleName'] as String,
      lastName: map['lastName'] as String,
      gender: map['gender'] as String,
      country: map['country'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      agentType: map['agentType'] as String,
      propertySize: map['propertySize'] as String,
      idUrl: map['idUrl'] as String,
      tradeUrl: map['tradeUrl'] != null ? map['tradeUrl'] as String : null,
      role: roleFromString(map['role']),
      // createdAt:
      //     DateTime.fromMillisecondsSinceEpoch(int.parse(map['createdAt'])),
      // updatedAt:
      //     DateTime.fromMillisecondsSinceEpoch(int.parse(map['updatedAt'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, phone: $phone, username: $username, userId: $userId, hashedPassword: $hashedPassword, firstName: $firstName, middleName: $middleName, lastName: $lastName, gender: $gender, country: $country, state: $state, city: $city, agentType: $agentType, propertySize: $propertySize, idUrl: $idUrl, tradeUrl: $tradeUrl, role: $role)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.phone == phone &&
        other.username == username &&
        other.userId == userId &&
        other.hashedPassword == hashedPassword &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.lastName == lastName &&
        other.gender == gender &&
        other.country == country &&
        other.state == state &&
        other.city == city &&
        other.agentType == agentType &&
        other.propertySize == propertySize &&
        other.idUrl == idUrl &&
        other.tradeUrl == tradeUrl &&
        other.role == role;
    // other.createdAt == createdAt &&
    // other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        phone.hashCode ^
        username.hashCode ^
        userId.hashCode ^
        hashedPassword.hashCode ^
        firstName.hashCode ^
        middleName.hashCode ^
        lastName.hashCode ^
        gender.hashCode ^
        country.hashCode ^
        state.hashCode ^
        city.hashCode ^
        agentType.hashCode ^
        propertySize.hashCode ^
        idUrl.hashCode ^
        tradeUrl.hashCode ^
        role.hashCode;
    // createdAt.hashCode ^
    // updatedAt.hashCode;
  }
}
