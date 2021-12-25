import 'package:e_commerce/models/login_model.dart';

abstract class ShopLoginState {}

class ShopLoginInitialState extends ShopLoginState {}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginSucessState extends ShopLoginState {
  final LoginModel loginModel;

  ShopLoginSucessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginState {
  final String error;

  ShopLoginErrorState(this.error);
}

class ShopGetItemsLoadingState extends ShopLoginState {}

class ShopGetItemsSuccessState extends ShopLoginState {}

class ShopGetItemsErrorState extends ShopLoginState {
  final String error;

  ShopGetItemsErrorState(this.error);
}

class ShopChangePasswordIcon extends ShopLoginState {}

class ShopGetItemsDetailsLoadingState extends ShopLoginState {}

class ShopGetItemsDetailsSuccessState extends ShopLoginState {}

class ShopGetItemsDetailsErrorState extends ShopLoginState {
  final String error;

  ShopGetItemsDetailsErrorState(this.error);
}
