class ProductDetails {
  late int productId;
  late String title;
  late String picture;
  late List<Sizes> sizes;
  ProductDetails.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    title = json['title'];
    picture = json['picture'];
    sizes = List.from(json['sizes']).map((e) => Sizes.fromJson(e)).toList();
  }
}

class Colors {
  late int colorId;
  late String color;
  late String hexaColor;

  Colors.fromJson(Map<String, dynamic> json) {
    colorId = json['color_id'];
    color = json['color'];
    hexaColor = json['hexadecimal'];
  }
}

class Sizes {
  late int sizeId;
  late String size;
  late int price;
  List<AvailableModel>? availableColorModels;
  Sizes.fromJson(Map<String, dynamic> json) {
    sizeId = json['size_id'];
    size = json['size'];
    price = json['price'];
    availableColorModels = json['available_colors'] == null
        ? null
        : (json['available_colors'] is! List)
            ? null
            : (json['available_colors'] as List).isEmpty
                ? null
                : List<AvailableModel>.from(json['available_colors'][0]!
                    .map((x) => AvailableModel.fromJson(x)));
  }
}

class AvailableModel {
  AvailableModel({
    this.colorId,
    this.color,
    this.hexadecimal,
  });

  int? colorId;
  String? color;
  String? hexadecimal;

  factory AvailableModel.fromJson(Map<String, dynamic> json) => AvailableModel(
        colorId: json["color_id"] == null ? null : json["color_id"],
        color: json["color"] == null ? null : json["color"],
        hexadecimal: json["hexadecimal"] == null ? null : json["hexadecimal"],
      );

  Map<String, dynamic> toJson() => {
        "color_id": colorId == null ? null : colorId,
        "color": color == null ? null : color,
        "hexadecimal": hexadecimal == null ? null : hexadecimal,
      };
}
