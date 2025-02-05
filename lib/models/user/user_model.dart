import 'package:pebble_pharmacy/models/store/store_model.dart';
import 'package:pebble_pharmacy/models/user/role_model.dart';

class User {
  final String? id;
  final String? name;
  final String? phoneNumber;
  final String? pin;
  final String? token;
  final Role? role;
  final List<Store>? stores;

  User({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.pin,
    required this.role,
    required this.token,
    this.stores,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['_id'],
      name: json['user']['name'],
      phoneNumber: json['user']['phoneNumber'],
      pin: json['user']['pin'],
      role: Role.values.firstWhere((r) => r.name.toLowerCase() == json['user']['role'].toString().toLowerCase(),
      orElse: () => Role.retailAssociate),
      stores: (json['user']['stores'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      token: json['token'],
    );
  }
}
