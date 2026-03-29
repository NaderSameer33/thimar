class RateData {
  late final List<RateModel> rates;

  RateData.fromjson(Map<String, dynamic> json) {
    rates = List.from(
      (json['data']??{}),
    ).map((item) => RateModel.fromJson(item)).toList();
  }
}

class RateModel {
  late final int value;
  late final String clientName, clientImage, comment;

  RateModel.fromJson(Map<String, dynamic> json) {
    value = json['value'] ?? 0;
    comment = json['comment'] ?? 'منتج جميل';
    clientName = json['client_name'] ?? '';
    clientImage = json['client_image'] ?? '';
  }
}
