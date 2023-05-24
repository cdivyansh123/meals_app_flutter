import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {

  var _gluttenFreeFilterSet=false;
  var _lactoseFreeFilterState=false;
  var _vegeterianFreeFilterState=false;
  var _veganFreeFilterState=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.pop(context);
      //   if(identifier=='meals'){
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabScreen()));
      //   }
      // },),
        body: Column(
        children: [
          SwitchListTile(value: _gluttenFreeFilterSet,
            onChanged: (isChecked){
            setState(() {
              _gluttenFreeFilterSet=isChecked;
            });
            },
            title: Text('Glutten-free', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),
            ),
            subtitle: Text("only incude Glute-free meals",style: Theme
                .of(context)
                .textTheme
                .labelMedium!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),

          ),
          SwitchListTile(value: _lactoseFreeFilterState,
            onChanged: (isChecked){
              setState(() {
                _lactoseFreeFilterState=isChecked;
              });
            },
            title: Text('Lactose-free', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),
            ),
            subtitle: Text("only incude lactose-free meals",style: Theme
                .of(context)
                .textTheme
                .labelMedium!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),

          ),
          SwitchListTile(value: _vegeterianFreeFilterState,
            onChanged: (isChecked){
              setState(() {
                _vegeterianFreeFilterState=isChecked;
              });
            },
            title: Text('Vegiterian', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),
            ),
            subtitle: Text("only incude vegeterian meals",style: Theme
                .of(context)
                .textTheme
                .labelMedium!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),

          ),
          SwitchListTile(value: _veganFreeFilterState,
            onChanged: (isChecked){
              setState(() {
                _veganFreeFilterState=isChecked;
              });
            },
            title: Text('Vegan-free', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),
            ),
            subtitle: Text("only incude vegan-free meals",style: Theme
                .of(context)
                .textTheme
                .labelMedium!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),

          ),
        ],
      ),
    );
  }

}