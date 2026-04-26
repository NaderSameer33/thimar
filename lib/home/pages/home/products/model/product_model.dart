class ProductData {
  late final List<ProductModel> list;
  ProductData.fromJson(Map<String, dynamic> jsonData) {
    // 'data' can be a List OR a Map depending on the endpoint.
    // Only use it when it's actually a List; otherwise try 'search_result'.
    dynamic raw = jsonData['data'];
    if (raw is! List) raw = jsonData['search_result'];
    if (raw is! List) raw = [];
    list = List<dynamic>.from(raw)
        .map((item) => ProductModel.fromJson(item))
        .toList();
  }
}

class ProductModel {
  late final String title, image, descrption;
  late num price, priceBeforeDiscount, amount, discount;
  late int id, categoryId;
  late final bool isFavourite;
  ProductModel.fromJson(Map<String, dynamic> jsonData) {
    isFavourite = jsonData['is_favorite'] ?? false;
    title = jsonData['title'] ?? '';
    id = jsonData['id'] ?? 0;
    categoryId = jsonData['category_id'] ?? 0;
    descrption = jsonData['description'] ?? '';
    image = jsonData['main_image'] ?? '';
    priceBeforeDiscount = jsonData['price_before_discount'] ?? 0;
    price = jsonData['price'] ?? 0;
    amount = jsonData['amount'] ?? 0;
    discount = jsonData['discount'] ?? 0;
    double value = double.parse(discount.toStringAsFixed(1));
    discount = (value * 100).toInt();
  }
}
