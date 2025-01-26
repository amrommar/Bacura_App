import 'package:bacura_app/core/utils/index.dart';

class ServicesEntity extends Equatable {
  final int? id;
  final String? name;
  final bool? isConsultation;

  const ServicesEntity({this.id, this.name, this.isConsultation});

  @override
  List<Object?> get props => [id, name, isConsultation];
}
