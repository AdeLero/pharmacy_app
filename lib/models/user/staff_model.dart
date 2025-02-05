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
