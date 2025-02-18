import 'package:bacura_app/core/utils/index.dart';

class ServicesOrderEntity extends Equatable {
  final int id;
  final String name;
  final String? createAt;

  const ServicesOrderEntity({required this.id, required this.name, this.createAt});

  @override
  List<Object?> get props => [id, name, createAt];
}
