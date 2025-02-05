import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pebble_pharmacy/models/state/storeProvider.dart';
import 'package:pebble_pharmacy/models/state/user_provider.dart';
import 'package:pebble_pharmacy/models/store/store_category.dart';
import 'package:pebble_pharmacy/models/store/store_model.dart';

class StoreViewModel extends ChangeNotifier {
  final Ref ref;
  bool _isLoading = false;
  bool _hasStores = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get hasStores => _hasStores;
  String? get errorMessage => _errorMessage;

  StoreViewModel(this.ref);

  Future<List<Store>> checkIfUserHasStores() async {
    _isLoading = true;
    notifyListeners();

    final user = ref.read(userProvider);

    if (user == null) {
      _errorMessage = "User not found";
      _isLoading = false;
      notifyListeners();
      return [];
    }

    const String url = "http://192.168.0.170:5000/api/stores";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<Store> stores = (data['stores'] as List)
            .map((storeData) => Store.fromJson(storeData))
            .toList();

        print("Stores retrieved: ${stores.map((store) => store.toJson()).toList()}");

        _hasStores = stores.isNotEmpty;
        _isLoading = false;
        notifyListeners();

        return stores;
      } else {
        _hasStores = false;
        _errorMessage = "User has no stores";
      }

      _errorMessage = "Failed to retrieve stores";
    } catch (e) {
      e.toString();
      _errorMessage = "Something went wrong. Try again";
    }
    _isLoading = false;
    notifyListeners();
    return [];
  }

  Future<Store?> createStore(String name, StoreCategory storeCategory) async {
    _isLoading = true;
    notifyListeners();

    final user = ref.watch(userProvider);

    if (user == null) {
      _isLoading = false;
      _errorMessage = "User Not Found";
      notifyListeners();
      return null;
    }

    const String url = "http://192.168.0.170:5000/api/stores";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        body: jsonEncode({
          'name': name,
          'category': storeCategory.name,
        }),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final store = Store.fromJson(responseData);

        _isLoading = false;
        notifyListeners();
        return store;
      } else {
        _errorMessage = jsonDecode(response.body)['message'];
      }
    } catch (e) {
      _errorMessage = "Something went wrong. Try again";
    }

    _isLoading = false;
    notifyListeners();
    return null;
  }

  Future<Store?> selectStore() async {
    _isLoading = true;
    notifyListeners();

    final user = ref.read(userProvider);

    if (user == null) {
      _errorMessage = "User not found";
      _isLoading = false;
      notifyListeners();
      return null;
    }

    final store = ref.read(storeProvider);

    if (store == null) {
      _errorMessage = "Store not found";
      _isLoading = false;
      notifyListeners();
      return null;
    }

    String storeId = store.id!;

    String url = 'http://192.168.0.170:5000/api/stores/$storeId';

    try {

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      );

      if(response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final store = Store.fromJson(responseData);

        _isLoading = false;
        notifyListeners();

        return store;
      }
    } catch (e) {
      e.toString();
    }
    _isLoading = false;
    notifyListeners();
    return null;
  }
}
