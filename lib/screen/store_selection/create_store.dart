import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/models/store/store_category.dart';
import 'package:pebble_pharmacy/routes/routes.dart';
import 'package:pebble_pharmacy/view_models/providers.dart';
import 'package:pebble_pharmacy/widgets/appButton.dart';
import 'package:pebble_pharmacy/widgets/appTextField.dart';
import 'package:pebble_pharmacy/widgets/spacing/y_margin.dart';
import 'package:pebble_pharmacy/widgets/store_type_creation.dart';

class CreateStore extends HookConsumerWidget {
  const CreateStore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeNameController = useTextEditingController();
    final selectedStoreType = useState<StoreCategory?>(null);

    final storeVM = ref.watch(storeViewModelProvider);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 50.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Store",
              style: TextStyle(
                color: AppColors.selectiveYellow,
                fontWeight: FontWeight.w900,
                fontSize: 40.sp,
              ),
            ),
            YMargin(90.h),
            AppTextField(
              label: "Store Name",
              controller: storeNameController,
            ),
            YMargin(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StoreTypeCreation(
                  storeType: StoreCategory.warehouse,
                  storeTypeIcon: Icons.warehouse_rounded,
                  isSelected: selectedStoreType.value == StoreCategory.warehouse,
                  onSelect: (type) => selectedStoreType.value = type,
                ),
                StoreTypeCreation(
                  storeType: StoreCategory.retailStore,
                  storeTypeIcon: Icons.store,
                  isSelected: selectedStoreType.value == StoreCategory.retailStore,
                  onSelect: (type) => selectedStoreType.value = type,
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () async {
                      final name = storeNameController.text.trim();
                      final storeCategory = selectedStoreType.value;

                      if (name.isEmpty || storeCategory == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter a name and select a store type")),
                        );
                        return;
                      }

                      final store = await storeVM.createStore(name, storeCategory);

                      if (store != null) {
                        Navigator.pushNamed(context, Routes.landing);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(storeVM.errorMessage ?? "Failed to create store")),
                        );
                      }
                    },
                    label: storeVM.isLoading ? "Creating..." : "Create Store",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
