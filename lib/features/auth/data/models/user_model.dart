import 'package:firebase_auth/firebase_auth.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(uId: entity.uId, name: entity.name, email: entity.email);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }

  toMap() {
    return {'name': name, 'email': email, 'uId': uId};
  }
}
