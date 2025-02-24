import 'package:bacura_app/feature/offers/domain/entity/items_offer_entity.dart';

class ItemsOfferModel extends ItemsOfferEntity {
  const ItemsOfferModel(
      {required super.itemId,
      required super.offerId,
      required super.name,
      required super.price,
      required super.quantity,
      required super.image,
      required super.orderId});

  factory ItemsOfferModel.fromJson(Map<String, dynamic> json) => ItemsOfferModel(
        itemId: json["item_id"],
        offerId: json["offer_id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        image: json["image"],
        orderId: json["order_id"],
      );
}
