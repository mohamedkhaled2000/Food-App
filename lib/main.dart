import 'package:flutter/material.dart';
import 'package:restrant_app/Moduls/Meal.dart';
import 'package:restrant_app/Screens/CategoryMealScreen.dart';
import 'package:restrant_app/Screens/CategoryScreen.dart';
import 'package:restrant_app/Screens/FillterScreen.dart';
import 'package:restrant_app/Screens/MealDetailsScreen.dart';
import 'package:restrant_app/Screens/TabScreen.dart';
import 'package:restrant_app/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _avaliableMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeal = [];

  void _stateFilter(Map filterData) {
    setState(() {
      _filters = filterData;

      _avaliableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final existMeal = _favouriteMeal.indexWhere((meal) => meal.id == mealId);

    if (existMeal >= 0) {
      setState(() {
        _favouriteMeal.removeAt(existMeal);
      });
    } else {
      setState(() {
        _favouriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavourite(String id) {
    return _favouriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1:
                    const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                bodyText2:
                    const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                headline1: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              )),
      // home: const TabScreen(),
      routes: {
        '/': (context) => TabScreen(_favouriteMeal),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_avaliableMeal),
        MealDetailsScreen.routeName: (context) =>
            MealDetailsScreen(toggleFavourite,isMealFavourite),
        FillterScreen.routeName: (context) => FillterScreen(
              _filters,
              _stateFilter,
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const CategoryScreen());
  }
}
