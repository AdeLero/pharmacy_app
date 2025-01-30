class Product {
  final String? pharmaceuticalName;
  final String? brandName;
  final String? companyName;
  final String? variant;
  final String? strength;
  final String? dosageForm;
  final int? quantity;
  final int? price;

  Product({
    this.pharmaceuticalName,
    this.brandName,
    this.companyName,
    this.variant,
    this.strength,
    this.dosageForm,
    this.quantity,
    this.price,
  });
}

extension ProductNomenclature on Product {
  String get productNomenclature {
    final productName = [
      if (pharmaceuticalName != null) pharmaceuticalName,
      if (brandName != null) brandName,
      if (variant != null) "($variant)",
      if (companyName != null) "($companyName)",
      dosageForm,
    ].whereType<String>().join(" ");
    return productName;
  }
}

List<Product> inventory = [];

class Store {
  final String storeName;
  final StoreType storeType;
  final List<Staff> staff;
  final List<Product> inventory;

  Store({
    required this.storeName,
    required this.storeType,
    required this.staff,
    required this.inventory,
  });
}

enum StoreType {
  warehouse,
  branch,
}

class Staff {
  final String name;
  final StaffDesignation designation;

  Staff({required this.name, required this.designation});
}

enum StaffDesignation {
  manager,
  retailAssociate,
  cashier,
  intern,
  superintendent,
}
