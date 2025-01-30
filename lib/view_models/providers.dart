import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pebble_pharmacy/view_models/onboardingViewModels.dart';

final onboardingProvider = ChangeNotifierProvider((ref) => OnboardingViewModel());
