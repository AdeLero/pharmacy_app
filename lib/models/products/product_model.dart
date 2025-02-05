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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      pharmaceuticalName: json['pharmaceuticalName'],
      brandName: json['brandName'],
      companyName: json['companyName'],
      variant: json['variant'],
      strength: json['strength'],
      dosageForm: json['dosageForm'],
      quantity: json['quantity'] as int,
      price: json['price'] as int,
    );
  }
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
