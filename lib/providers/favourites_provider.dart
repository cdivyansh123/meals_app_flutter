import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/models/meal.dart';

class favouriteMealsNotifier extends StateNotifier<List<Meal>>{
  favouriteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal){
    final mealIsFavourite=state.contains(meal);
    if(mealIsFavourite){
      state=state.where((m)=>m.id != meal.id).toList();
      return false;
    }else{
      state=[...state,meal];
      return true;
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<favouriteMealsNotifier,List<Meal>>((ref){
  return favouriteMealsNotifier();
});