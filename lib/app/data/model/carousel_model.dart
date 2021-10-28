
class CarouselModel {
  String? imageUrl;

  CarouselModel(this.imageUrl);
}

List<CarouselModel> carousels =
carouselsData.map((item) => CarouselModel(item['image'])).toList();

final List<Map> carouselsData = [
  {"image": "assets/images/sembalun.jpg"},
  {"image": "assets/images/sembalun.jpg"},
  {"image": "assets/images/sembalun.jpg"},
];
