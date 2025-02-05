import 'package:pebble_pharmacy/models/products/product_model.dart';
import 'package:pebble_pharmacy/models/store/store_category.dart';
import 'package:pebble_pharmacy/models/user/user_model.dart';

class Store {
  final String? id;
  final String? storeName;
  final List<Product>? inventory;
  final StoreCategory? category;
  final String? createdBy;
  final List<User>? members;

  Store({
    required this.storeName,
    required this.inventory,
    required this.category,
    this.id,
    this.createdBy,
    this.members,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['_id'],
      storeName: json['name'],
      inventory: (json['inventory'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      category: StoreCategory.values
          .firstWhere((c) => c.name == json['category']),
      createdBy: json['createdBy'],
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': storeName,
      'category': category,
    };
  }
}
