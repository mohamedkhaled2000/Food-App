import 'package:flutter/material.dart';
import 'package:restrant_app/Moduls/Meal.dart';
import 'package:restrant_app/Screens/CategoryScreen.dart';
import 'package:restrant_app/Screens/FavouriteScreen.dart';
import 'package:restrant_app/Widgets/MainDrawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;
  TabScreen(this.favouriteMeal);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map> _pages=[];

  @override
  void initState() {
    _pages = [
      {'page': const CategoryScreen(), 'title': 'Categories'},
      {'page': FavouriteScreen(widget.favouriteMeal), 'title': 'Favourites'}
    ];
    super.initState();
  }

  var _selectPageIndex = 0;
  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
