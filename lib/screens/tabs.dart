import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

import '../models/meal.dart';

const kInitialFilters = {
  filter.glutenFree: false,
  filter.lactosFree: false,
  filter.vegeterian: false,
  filter.vegan: false
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;



  Map<filter, bool> selectedFilter = kInitialFilters;



  void _selectpage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result =
          await Navigator.of(context).push<Map<filter, bool>>(MaterialPageRoute(
              builder: (context) => FilterScreen(
                    currentFilter: selectedFilter,
                  )));
      setState(() {
        selectedFilter = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (selectedFilter[filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilter[filter.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilter[filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilter[filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favouriteMeals=ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
      );
      activePageTitle = "Your Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
