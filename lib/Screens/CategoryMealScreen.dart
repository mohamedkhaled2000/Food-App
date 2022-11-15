import 'package:flutter/material.dart';
import 'package:restrant_app/Moduls/Meal.dart';
import 'package:restrant_app/Widgets/MealItem.dart';
import 'package:restrant_app/dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  final List<Meal> avaliableMeal;
  CategoryMealScreen(this.avaliableMeal);

  static const routeName = 'category_meals';
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    var catId = routeArg['id'];
    var catTitle = routeArg['title'];
    final categoryMeal = widget.avaliableMeal.where(
      (meal) {
        return meal.categories.contains(catId);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(title: Text(catTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeal[index].id,
            imageUrl: categoryMeal[index].imageUrl,
            title: categoryMeal[index].title,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
