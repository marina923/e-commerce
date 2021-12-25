import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/login/cubit/states.dart';
import 'package:e_commerce/models/index_model.dart';
import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/models/show_model.dart';
import 'package:e_commerce/shared/constans.dart';
import 'package:e_commerce/shared/network/cash_helper.dart';
import 'package:e_commerce/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;

  LoginModel? loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: Login, data: {
      'username': email,
      'password': password,
      'client_id': 2,
      'client_secret': 'xGt1pB6wCVxpE3xoSyHQROCP8QsHGsh713sPnpg9',
      'grant_type': 'password',
      //not null
    }).then((value) async {
      if (value != null) {
        if (value.statusCode == 200 || value.statusCode == 201) {
          //  CasheHelper.saveData(
          //    key: 'userToken', value: value.data['access_token']);
          print(value.data['access_token']);

          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('userToken', value.data['access_token']);

          String? savedToken = await pref.getString('userToken');

          print('\n\n\n saved token: $savedToken\n\n\n');

          loginModel = LoginModel.fromJson(value.data);
          emit(ShopLoginSucessState(loginModel!));
        } else {
          emit(ShopLoginErrorState('error'));
        }
      } else {
        emit(ShopLoginErrorState('error'));
      }
    }).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  List<ProductModel>? items;
  void getItems() async {
    emit(ShopGetItemsLoadingState());
    DioHelper.getData(
      url: Index,
    ).then((value) {
      items = (value.data as List)
          .map((element) => ProductModel.fromJson(element))
          .toList();
      emit(ShopGetItemsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetItemsErrorState(error.toString()));
    });
  }

  ProductDetails? detailsOfItem;
  void getProductDetails({required int productId}) {
    emit(ShopGetItemsDetailsLoadingState());
    DioHelper.getData(
      url: 'api/products/${productId.toString()}',
    ).then((value) {
      detailsOfItem = ProductDetails.fromJson(value.data[0]);

      print(detailsOfItem!.sizes[0].size);
      emit(ShopGetItemsDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetItemsDetailsErrorState(error));
    });
  }

  void changePasswordIcon() {
    isPassword = !isPassword;
    emit(ShopChangePasswordIcon());
  }
}
