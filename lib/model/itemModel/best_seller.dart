class BestSellerModel {
  String name;
  String mainImagePath;
  List<String>? subImagePath;
  String catName;
  String price;

  BestSellerModel({
    this.subImagePath,
    required this.name,
    required this.mainImagePath,
    required this.catName,
    required this.price,
  });
}
