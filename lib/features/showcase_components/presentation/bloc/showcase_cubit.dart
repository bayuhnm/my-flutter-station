import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowcaseState extends Equatable {
  final int selectedIndex;
  final int selectedTab;
  final int selectedStep;
  final String searchQuery;
  final List<String> selectedFilters;
  final bool isExpanded;

  const ShowcaseState({
    this.selectedIndex = 0,
    this.selectedTab = 0,
    this.selectedStep = 0,
    this.searchQuery = '',
    this.selectedFilters = const [],
    this.isExpanded = false,
  });

  ShowcaseState copyWith({
    int? selectedIndex,
    int? selectedTab,
    int? selectedStep,
    String? searchQuery,
    List<String>? selectedFilters,
    bool? isExpanded,
  }) {
    return ShowcaseState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedTab: selectedTab ?? this.selectedTab,
      selectedStep: selectedStep ?? this.selectedStep,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedFilters: selectedFilters ?? this.selectedFilters,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  @override
  List<Object?> get props => [
        selectedIndex,
        selectedTab,
        selectedStep,
        searchQuery,
        selectedFilters,
        isExpanded,
      ];
}

class ShowcaseCubit extends Cubit<ShowcaseState> {
  ShowcaseCubit() : super(const ShowcaseState());

  void selectIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void selectTab(int tab) {
    emit(state.copyWith(selectedTab: tab));
  }

  void nextStep({int maxStep = 3}) {
    final next = state.selectedStep >= maxStep ? 0 : state.selectedStep + 1;
    emit(state.copyWith(selectedStep: next));
  }

  void setStep(int step) {
    emit(state.copyWith(selectedStep: step));
  }

  void setSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void toggleFilter(String filter) {
    final filters = [...state.selectedFilters];

    if (filters.contains(filter)) {
      filters.remove(filter);
    } else {
      filters.add(filter);
    }

    emit(state.copyWith(selectedFilters: filters));
  }

  void clearFilters() {
    emit(state.copyWith(selectedFilters: const [], searchQuery: ''));
  }

  void toggleExpanded() {
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }
}
