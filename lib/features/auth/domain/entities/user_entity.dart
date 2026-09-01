class UserEntity {
  final int userId;
  final String fullName;
  final String email;
  final String? phone;
  final String? gender;

  UserEntity({
    required this.userId,
    required this.fullName,
    required this.email,
    this.phone,
    this.gender,
  });
}
