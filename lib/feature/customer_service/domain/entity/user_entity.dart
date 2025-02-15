import 'package:bacura_app/core/utils/index.dart';

class UserEntity extends Equatable {
  final int id;
  final String? email;
  final int? password;
  final int? roleId;
  final int? phone;
  final String? name;
  final String? gender;
  final String? location;
  final String? image;
  final int? countryCode;
  final bool? isActive;
  final String? createdAt;
  const UserEntity(
      {required this.id,
      this.email,
      this.password,
      this.roleId,
      this.phone,
      this.name,
      this.gender,
      this.location,
      this.image,
      this.countryCode,
      this.isActive,
      this.createdAt});
  @override
  List<Object?> get props => [
        id,
        email,
        password,
        roleId,
        phone,
        name,
        gender,
        location,
        image,
        countryCode,
        isActive,
        createdAt,
      ];
}
