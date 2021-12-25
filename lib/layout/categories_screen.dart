import 'package:e_commerce/layout/show_screen.dart';
import 'package:e_commerce/login/cubit/cubit.dart';
import 'package:e_commerce/login/cubit/states.dart';
import 'package:e_commerce/shared/components/carditem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ShopLoginCubit.get(context).getItems();
    var itemsList = ShopLoginCubit.get(context).items;
    return BlocConsumer<ShopLoginCubit, ShopLoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 100.0,
            toolbarHeight: 80.0,
            elevation: 10.0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
          body: ShopLoginCubit.get(context).items != null
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: itemsList!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowItems(
                              productId: itemsList[index].productId,
                            ),
                          ));
                    },
                    child: CardItem(
                      mainImagePreview: itemsList[index].picture,
                      productName: itemsList[index].title,
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
