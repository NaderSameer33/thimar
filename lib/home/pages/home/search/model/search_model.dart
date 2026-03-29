class SearchData {
  late final List<SearchModel> searchModel;

  SearchData.fromJson(Map<String, dynamic> json) {
    final data = json['search_result'] as List<dynamic>? ?? [];
    searchModel = data.map((item) => SearchModel.fromJson(item)).toList();
  }
}

class SearchModel {
  late final String title, image, description;
  late final num price, priceBeforeDiscount, amount, discount;
  late final int id, categoryId;
  late final bool isFavourite;

  SearchModel.fromJson(Map<String, dynamic> jsonData) {
    isFavourite = jsonData['is_favorite'] ?? false;
    title = jsonData['title'] ?? '';
    id = jsonData['id'] ?? 0;
    categoryId = jsonData['category_id'] ?? 0;
    description = jsonData['description'] ?? '';
    image = jsonData['main_image'] ?? '';
    priceBeforeDiscount = jsonData['price_before_discount'] ?? 0;
    price = jsonData['price'] ?? 0;
    amount = jsonData['amount'] ?? 0;

    final rawDiscount = jsonData['discount'] ?? 0;
    discount = (rawDiscount * 100).round(); // يحول 0.2 إلى 20
  }
}