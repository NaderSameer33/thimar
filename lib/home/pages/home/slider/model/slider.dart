class SliderData {
  late final List<SliderModel> list;

  SliderData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['data'] ?? {},
    ).map((model) => SliderModel.fromJson(model)).toList();
  }
}

class SliderModel {
  late final int id;
  late final String image;
  SliderModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'] ?? 0;
    image = jsonData['media'] ?? '';
  }
}
