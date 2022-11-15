import 'package:flutter/material.dart';
import 'package:restrant_app/Moduls/Meal.dart';
import 'package:restrant_app/Widgets/MealItem.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;
  FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return const Center(
        child: Text('You Have not Favourite Meal Yet'),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favouriteMeal[index].id,
          imageUrl: favouriteMeal[index].imageUrl,
          title: favouriteMeal[index].title,
          duration: favouriteMeal[index].duration,
          complexity: favouriteMeal[index].complexity,
          affordability: favouriteMeal[index].affordability,
        );
      },
      itemCount: favouriteMeal.length,
    );
  }
}
