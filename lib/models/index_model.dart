class ProductModel {
  late int productId;
  late String title;
  late String picture;
  late List<Sizes> sizes;
  late List<Colors> colors;
  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    title = json['title'];
    picture = json['picture'];
    sizes = List.from(json['sizes']).map((e) => Sizes.fromJson(e)).toList();
    colors = List.from(json['colors']).map((e) => Colors.fromJson(e)).toList();
  }
}

class Sizes {
  late int sizeId;
  late String sizeName;
  late int price;

  Sizes.fromJson(Map<String, dynamic> json) {
    sizeId = json['size_id'];
    sizeName = json['size'];
    price = json['price'];
  }
}

class Colors {
  late String color;
  late String hexaColor;

  Colors.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    hexaColor = json['hexadecimal'];
  }
}
