import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pebble_pharmacy/customization/theme/colorscheme.dart';
import 'package:pebble_pharmacy/customization/theme/theme.dart';
import 'package:pebble_pharmacy/models/state/storeProvider.dart';
import 'package:pebble_pharmacy/models/state/user_provider.dart';
import 'package:pebble_pharmacy/models/store/store_model.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/view_models/providers.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';
import 'package:pebble_pharmacy/widgets/store_type_card.dart';

class SelectStore extends HookConsumerWidget {
  final List<Store> stores;
  const SelectStore({super.key, required this.stores});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider);
    final storeVM = ref.watch(storeViewModelProvider);

    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Store",
              style: TextStyle(
                color: appLightMode.surface,
                fontWeight: FontWeight.w900,
                fontSize: 40.sp,
              ),
            ),
            YMargin(50.h),
            ListView.builder(
                shrinkWrap: true,
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  final store = stores[index];
                  return StoreTypeCard(
                    isWarehouse: true,
                    storeName: store.storeName ?? '',
                    userRole: user?.role?.name ?? '',
                    onTap: () async {
                      ref.read(storeProvider.notifier).setStore(store);
                      await storeVM.selectStore();
                      Navigator.pushNamed(context, Routes.landing);
                    },
                  );
                }),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: AppButton(
                onPressed: () {
                  ref.read(userProvider.notifier).clearUser();
                  Navigator.pushNamed(context, Routes.signIn);
                },
                label: "Sign Out",
                isOutlined: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
