import 'package:bacura_app/core/utils/index.dart';

class ServicesHomeEntity extends Equatable {
  final int? id;
  final String? name;
  final bool? isConsultation;

  const ServicesHomeEntity({this.id, this.name, this.isConsultation});

  @override
  List<Object?> get props => [id, name, isConsultation];
}
