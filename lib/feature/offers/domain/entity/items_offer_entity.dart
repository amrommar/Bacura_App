import 'package:bacura_app/core/utils/index.dart';

class ItemsOfferEntity extends Equatable {
  final int itemId;
  final String name;
  final double price;
  final String image;
  final int quantity;
  final int orderId;
  final int offerId;
  const ItemsOfferEntity(
      {required this.itemId,
      required this.name,
      required this.price,
      required this.image,
      required this.quantity,
      required this.orderId,
      required this.offerId});

  @override
  List<Object?> get props => [itemId, name, price, image, quantity, orderId, offerId];
}
