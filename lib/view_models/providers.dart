import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pebble_pharmacy/view_models/onboardingViewModels.dart';
import 'package:pebble_pharmacy/view_models/storeViewModel.dart';
import 'package:pebble_pharmacy/view_models/user_vew_model.dart';

final onboardingProvider = ChangeNotifierProvider((ref) => OnboardingViewModel(ref));
final userViewModelProvider = ChangeNotifierProvider((ref) => UserViewModel());
final storeViewModelProvider = ChangeNotifierProvider((ref) => StoreViewModel(ref));
