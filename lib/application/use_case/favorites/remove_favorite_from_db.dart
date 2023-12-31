import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/database/database.dart';
import '../../../data/repository/food_recipes_repository.dart';

part 'remove_favorite_from_db.g.dart';

@riverpod
Future<void> removeFavoriteItem(
  RemoveFavoriteItemRef ref, {
  required Database database,
  required FoodRecipesRepository repository,
  required String recipeId,
}) async {
  await repository.removeFavoriteItem(database: database, recipeId: recipeId);
}
