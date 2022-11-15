// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:restrant_app/Widgets/MainDrawer.dart';

class FillterScreen extends StatefulWidget {
  final saveFilters;
  final Map currentFilters;
  FillterScreen(
    this.currentFilters,
    this.saveFilters,
  );

  static const routeName = 'filter_screen';

  @override
  State<FillterScreen> createState() => _FillterScreenState();
}

class _FillterScreenState extends State<FillterScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  void initState() {
    _GlutenFree = widget.currentFilters['gluten'];
    _LactoseFree = widget.currentFilters['lactose'];
    _Vegan = widget.currentFilters['vegan'];
    _Vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildListTile(String title, String subTitle, bool value, changeVal) {
    return SwitchListTile(
        value: value,
        title: Text(title),
        subtitle: Text(subTitle),
        onChanged: changeVal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Page'),
        actions: [
          IconButton(
              onPressed: () {
                Map _filters = {
                  'gluten': _GlutenFree,
                  'lactose': _LactoseFree,
                  'vegan': _Vegan,
                  'vegetarian': _Vegetarian,
                };
                widget.saveFilters(_filters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adujest your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildListTile(
                  'Gluten Free', 'Only Include Gluten free Meals', _GlutenFree,
                  (val) {
                setState(() {
                  _GlutenFree = val;
                });
              }),
              buildListTile('Lactose Free', 'Only Include Lactose free Meals',
                  _LactoseFree, (val) {
                setState(() {
                  _LactoseFree = val;
                });
              }),
              buildListTile('Vegan', 'Only Include Vegan Meals', _Vegan, (val) {
                setState(() {
                  _Vegan = val;
                });
              }),
              buildListTile(
                  'Vegetarian', 'Only Include Vegetarian Meals', _Vegetarian,
                  (val) {
                setState(() {
                  _Vegetarian = val;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
