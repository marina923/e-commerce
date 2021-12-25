import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  late final String mainImagePreview;
  late final String productName;
  CardItem({
    required this.mainImagePreview,
    required this.productName,
  });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 150.0, bottom: 140),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width * 0.10),
        child: Padding(
          padding: const EdgeInsets.only(left: 6.0, right: 6.0),
          child: Card(
            shadowColor: Colors.white,
            color: Colors.white,
            elevation: 8,
            child: Column(
              children: [
                Center(
                  child: Image(
                    height: 220,
                    width: 300,
                    image: NetworkImage(mainImagePreview),
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
