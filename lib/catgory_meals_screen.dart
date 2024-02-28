// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import './dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals-screen';
  const CategoryMealsScreen({super.key});

  String getComplexityText(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return 'Hard';
    }
  }

  String getAffordabilityText(Affordability affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return 'Luxirious';
    }
  }

  @override
  Widget build(BuildContext context) {
    final String categoryId =
        ModalRoute.of(context)!.settings.arguments as String;
    final displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
        ),
        body: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (context, index) {
            final String complexityText =
                getComplexityText(displayedMeals[index].complexity);

            final String affordabilityText =
                getAffordabilityText(displayedMeals[index].affordability);

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              height: 380,
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(displayedMeals[index].title),
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule),
                            Text('${displayedMeals[index].duration} min'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work),
                            Text(complexityText),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money),
                            Text(affordabilityText)
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
