class StoreState {
  final bool hasStores;
  final bool isLoading;
  final String error;

  StoreState({
    required this.hasStores,
    required this.isLoading,
    required this.error,
  });

  factory StoreState.initial() {
    return StoreState(
      hasStores: false,
      isLoading: false,
      error: '',
    );
  }

  StoreState copyWith({
    bool? hasStores,
    bool? isLoading,
    String? error,
  }) {
    return StoreState(
      hasStores: hasStores ?? this.hasStores,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
