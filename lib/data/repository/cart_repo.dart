import 'dart:convert';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/utils/app_constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    sharedPreferences.remove(AppConstraints.CART_LIST);
    sharedPreferences.remove(AppConstraints.CART_HISTORY_LIST);
    var time = DateTime.now().toString();
    cart = [];
    for (var element in cartList) {
      element.time = time;
      return cart.add(jsonEncode(element));
    }
    sharedPreferences.setStringList(AppConstraints.CART_LIST, cart);
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstraints.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstraints.CART_LIST)!;
    }
    List<CartModel> cartList = [];
    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstraints.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstraints.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    for (var element in cartHistory) {
      cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    }
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstraints.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstraints.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(
        AppConstraints.CART_HISTORY_LIST, cartHistory);
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstraints.CART_LIST);
  }
}
