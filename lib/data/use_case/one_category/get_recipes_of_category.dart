import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../presentation/feature/category/domain/category_page_item_model.dart';
import '../../api/api_client.dart';
import '../../repository/food_recipes_repository.dart';

part 'get_recipes_of_category.g.dart';

@riverpod
Future<List<CategoryPageItemModel>> getRecipesShortOfCategory(
  GetRecipesShortOfCategoryRef ref, {
  required ApiClient apiClient,
  required FoodRecipesRepository recipesRepository,
  required String category,
}) async {
  final result = await recipesRepository.getAllRecipesOfCategory(
    apiClient: apiClient,
    category: category,
  );
  if (result.meals == null) {
    return [];
  } else {
    return result.meals!
        .map(
          (recipeShort) =>
              CategoryPageItemModel.fromGetRecipesOfCategoryResponse(
            shortInfo: recipeShort,
          ),
        )
        .toList();
  }
}