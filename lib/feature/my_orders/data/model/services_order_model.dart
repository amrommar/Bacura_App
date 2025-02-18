import 'package:bacura_app/feature/my_orders/domain/entity/services_order_entity.dart';

class ServicesOrderModel extends ServicesOrderEntity {
  const ServicesOrderModel({
    required super.id,
    required super.name,
    super.createAt,
  });

  factory ServicesOrderModel.fromJson(Map<String, dynamic> json) => ServicesOrderModel(
        id: json['id'],
        name: json['name'],
        createAt: json['create_at'],
      );
}
