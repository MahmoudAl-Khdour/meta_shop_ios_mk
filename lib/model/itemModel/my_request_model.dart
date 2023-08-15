class ItemMyRequestModel {
  String nameCat;
  String name;
  double price;
  String imagePath;
  int numberItem;
  String address;
  String status;

  ItemMyRequestModel({
    required this.address,
    required this.status,
    required this.price,
    required this.name,
    required this.imagePath,
    required this.nameCat,
    required this.numberItem,
  });
}
