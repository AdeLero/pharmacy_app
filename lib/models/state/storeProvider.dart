import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pebble_pharmacy/models/store/store_model.dart';

final storeProvider = StateNotifierProvider<StoreNotifier, Store?>((ref) {
  return StoreNotifier();
});

class StoreNotifier extends StateNotifier<Store?> {
  StoreNotifier() : super(null);

  void setStore(Store store) {
    state = store;
  }

  void closeStore() {
    state = null;
  }
}