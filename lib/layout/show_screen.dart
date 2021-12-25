import 'package:e_commerce/login/cubit/cubit.dart';
import 'package:e_commerce/login/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowItems extends StatelessWidget {
  int productId;

  ShowItems({required this.productId});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ShopLoginCubit.get(context).getProductDetails(productId: productId);
    var detailsItemList = ShopLoginCubit.get(context).detailsOfItem;

    return BlocConsumer<ShopLoginCubit, ShopLoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
            ],
          ),
          body: ShopLoginCubit.get(context).detailsOfItem == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: Row(children: [
                    Image(
                      image: NetworkImage(detailsItemList!.picture),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      children: productId == 1
                          ? [
                              Text(
                                detailsItemList.title,
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${detailsItemList.sizes[0].size}',
                                style: TextStyle(fontSize: 50.0),
                              ),
                              Text(
                                '${detailsItemList.sizes[0].price}',
                                style: TextStyle(fontSize: 50.0),
                              ),
                              Text(
                                '${detailsItemList.sizes[1].size}',
                                style: TextStyle(fontSize: 50.0),
                              ),
                              Text(
                                '${detailsItemList.sizes[1].price}',
                                style: TextStyle(fontSize: 50.0),
                              ),
                            ]
                          : productId == 2
                              ? [
                                  Text(
                                    detailsItemList.title,
                                    style: TextStyle(
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${detailsItemList.sizes[0].size}',
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                  Text(
                                    '${detailsItemList.sizes[0].price}',
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                  Text(
                                    '${detailsItemList.sizes[1].size}',
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                  Text(
                                    '${detailsItemList.sizes[1].price}',
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                  Text(
                                    '${detailsItemList.sizes[2].size}',
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                  Text(
                                    '${detailsItemList.sizes[2].price}',
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                ]
                              : [
                                  Text(
                                    detailsItemList.title,
                                    style: TextStyle(
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${detailsItemList.sizes[0].size}',
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                  Text(
                                    '${detailsItemList.sizes[0].price}',
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                ],
                    ),
                  ]),
                ),
        );
      },
    );
  }
}
// Center(
// child: Container(
// child: Column(
// children: [
// Container(
// height: height * 0.3,
// width: double.infinity,
// child: Image(
// image: NetworkImage(detailsItemList!.picture),
// ),
// ),
// Padding(
// padding:
// const EdgeInsets.only(left: 16.0, right: 8.0),
// child: Padding(
// padding:
// const EdgeInsets.only(right: 20.0, left: 20.0),
// child: Row(
// children: [
// Column(
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// detailsItemList.title,
// style: TextStyle(
// fontSize: 50.0,
// fontWeight: FontWeight.bold),
// ),
// ),
// ListView.builder(
// itemBuilder: (context, index) => Text(
// '${detailsItemList.sizes[index].price}'),
// ),
// ],
// ),
// Spacer(),
// Padding(
// padding: const EdgeInsets.only(
// left: 8.0,
// right: 100.0,
// ),
// child: IconButton(
// onPressed: () {},
// icon: Icon(Icons.favorite, size: 60.0),
// ),
// ),
// ],
// ),
// ),
// ),
// Row(
// children: [
// ListView.builder(
// itemBuilder: (context, index) =>
// Text('${detailsItemList.sizes[index].size}'),
// ),
// ListView.builder(
// itemBuilder: (context, index) => Text(
// '${detailsItemList.sizes[index].availableColorModels![index].color}'),
// ),
// ],
// ),
// ],
// ),
// ),
// )
// Padding(
// padding: const EdgeInsets.only(top: 80.0),
// child: Center(
// child: Column(
// children: [
// Image(
// image: NetworkImage(
// detailsItemList!.picture,
// ),
// ),
// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Text(detailsItemList.title),
// ListView.builder(
// itemBuilder: (context, index) => Text(
// '${detailsItemList.sizes[index].price}'),
// ),
// //Spacer(),
// // IconButton(
// //     onPressed: () {}, icon: Icon(Icons.favorite)),
// Row(
// children: [
// ListView.builder(
// itemBuilder: (context, index) => Text(
// '${detailsItemList.sizes[index].size}'),
// ),
// ListView.builder(
// itemBuilder: (context, index) => Text(
// '${detailsItemList.sizes[index].availableColorModels![index].color}'),
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// ),
// ),
