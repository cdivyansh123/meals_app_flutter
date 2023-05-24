import 'package:flutter/material.dart';

// ignore: camel_case_types
enum filter { glutenFree, lactosFree, vegeterian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});

  final Map<filter, bool> currentFilter;

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _gluttenFreeFilterSet = false;
  var _lactoseFreeFilterState = false;
  var _vegeterianFreeFilterState = false;
  var _veganFreeFilterState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _veganFreeFilterState = widget.currentFilter[filter.vegan]!;
    _lactoseFreeFilterState = widget.currentFilter[filter.lactosFree]!;
    _vegeterianFreeFilterState = widget.currentFilter[filter.vegeterian]!;
    _gluttenFreeFilterSet = widget.currentFilter[filter.glutenFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            filter.glutenFree: _gluttenFreeFilterSet,
            filter.lactosFree: _lactoseFreeFilterState,
            filter.vegeterian: _vegeterianFreeFilterState,
            filter.vegan: _veganFreeFilterState
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _gluttenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Glutten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "only incude Glute-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterState,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterState = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "only incude lactose-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegeterianFreeFilterState,
              onChanged: (isChecked) {
                setState(() {
                  _vegeterianFreeFilterState = isChecked;
                });
              },
              title: Text(
                'Vegiterian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "only incude vegeterian meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFreeFilterState,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterState = isChecked;
                });
              },
              title: Text(
                'Vegan-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "only incude vegan-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
