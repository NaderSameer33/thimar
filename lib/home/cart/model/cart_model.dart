class CartData {
  late final double totalPriceBeforeDiscount;
  late final double totalDiscount;
  late final double totalPriceWithVat;
  late final double deliveryCost;
  late final double freeDeliveryPrice;
  late final double vat;
  late final int isVip;
  late final double vipDiscountPercentage;
  late final double minVipPrice;
  late final String vipMessage;
  late final String status;
  late final String message;

  late final List<CartModel> list;
  CartData.fromjson(Map<String, dynamic> json) {
    list = List.from(
      json['data'] ?? {},
    ).map((item) => CartModel.fromjson(item)).toList();
    totalPriceBeforeDiscount = (json['total_price_before_discount'] as num)
        .toDouble();

    totalDiscount = (json['total_discount'] as num).toDouble();

    totalPriceWithVat = (json['total_price_with_vat'] as num).toDouble();

    deliveryCost = (json['delivery_cost'] as num).toDouble();

    freeDeliveryPrice = (json['free_delivery_price'] as num).toDouble();

    vat = (json['vat'] as num).toDouble();

    isVip = json['is_vip'];

    vipDiscountPercentage = (json['vip_discount_percentage'] as num).toDouble();

    minVipPrice = (json['min_vip_price'] as num).toDouble();

    vipMessage = json['vip_message'] ?? "";

    status = json['status'] ?? "";

    message = json['message'] ?? "";
  }
}

class CartModel {
  late final int id, amount;
  late final num price, remaingAmount, discount, priceBeforeDiscount;
  late final String title, image;

  CartModel.fromjson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    amount = json['amount'] ?? 0;
    title = json['title'] ?? '';
    image = json['image'] ?? '';
    discount = json['discount'] ?? 0;
    price = json['price'] ?? 0;
    priceBeforeDiscount = json['price_before_discount'] ?? 0;
    remaingAmount = json['remaining_amount'] ?? 0;
  }
}
