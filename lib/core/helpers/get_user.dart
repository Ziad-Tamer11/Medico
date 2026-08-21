import 'dart:convert';

import 'package:medico/constants.dart';
import 'package:medico/core/services/shared_preferences.dart';
import 'package:medico/features/auth/data/models/user_model.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';

UserEntity? getUser() {
  final jsonString = Prefs.getString(kUserData);
  if (jsonString == null || jsonString.isEmpty) return null;
  return UserModel.fromJson(jsonDecode(jsonString));
}
