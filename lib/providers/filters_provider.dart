import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter { glutenFree, lactosFree, vegeterian, vegan }

class FilterNotofier extends StateNotifier<Map<Filter, bool>> {
  FilterNotofier()
      : super({
          Filter.glutenFree: false,
          Filter.lactosFree: false,
          Filter.vegeterian: false,
          Filter.vegan: false
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotofier, Map<Filter, bool>>(
        (ref) => FilterNotofier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactosFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegeterian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
