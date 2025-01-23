import 'package:bacura_app/core/utils/index.dart';

class MyProfileEntity extends Equatable {
  final int? id;
  final String? email;
  final String? password;
  final int? roleId;
  final String? phone;
  final String? name;
  final String? gender;
  final String? location;
  final String? image;
  final String? countryCode;

  const MyProfileEntity({
    this.id,
    this.email,
    this.password,
    this.roleId,
    this.phone,
    this.name,
    this.gender,
    this.location,
    this.image,
    this.countryCode,
  });

  @override
  List<Object?> get props => [id, email, password, roleId, phone, name, gender, location, image, countryCode];
}
