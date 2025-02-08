import 'package:bacura_app/feature/my_orders/domin/entity/items_for_order_entity.dart';

class ItemsForOrderModel extends ItemsForOrderEntity {
  const ItemsForOrderModel({
    required super.id,
    required super.name,
    required super.image,
    required super.price,
    required super.quantity,
  });

  factory ItemsForOrderModel.fromJson(Map<String, dynamic> json) => ItemsForOrderModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
      );
}
