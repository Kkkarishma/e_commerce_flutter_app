import 'package:flutter/material.dart';

class PopularPoducts {
  final String? id;
  final String? name;
  final int? quantity;
  final dynamic price;
  final String? category;
  final String? image;
  PopularPoducts({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.category,
    required this.image,
  });
}

class PopularPoductsItems with ChangeNotifier {
  Map<String, PopularPoducts> _items = {};

  Map<String, PopularPoducts> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, String name, dynamic price, String image,
      String category) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => PopularPoducts(
          id: DateTime.now().toString(),
          name: existingCartItem.name,
          quantity: existingCartItem.quantity! + 1,
          price: existingCartItem.price,
          category: existingCartItem.category,
          image: existingCartItem.image,
        ),
      );
    } else {
      _items.putIfAbsent(
          productId,
          () => PopularPoducts(
                id: DateTime.now().toString(),
                name: name,
                quantity: 1,
                price: price,
                category: category,
                image: image,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (_items.containsKey(id)) {
      return;
    }
    if (_items[id]!.quantity! > 1) {
      _items.update(
          id,
          (existingCartItem) => PopularPoducts(
                id: DateTime.now().toString(),
                name: existingCartItem.name,
                quantity: existingCartItem.quantity! + 1,
                price: existingCartItem.price,
                category: existingCartItem.category,
                image: existingCartItem.image,
              ));
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
