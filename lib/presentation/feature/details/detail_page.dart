import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/providers/api_client_provider.dart';
import '../../../data/providers/food_recipes_repository_provider.dart';
import '../../../data/use_case/recipe_details/get_recipe_details.dart';
import '../../common_widgets/base/base_page_stateless.dart';
import '../../common_widgets/child_page_app_bar.dart';
import 'widgets/details_ingredients_widget.dart';
import 'widgets/details_page_header_widget.dart';
import 'widgets/details_title_bar_widget.dart';

class DetailsPage extends BasePageStateless {
  const DetailsPage({required this.id, Key? key}) : super(key: key);
  final String id;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const ChildPageAppBar();
  }

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    /// get recipes repository from river_pod provider
    final apiClient = ref.watch(apiClientProvider);
    final repository = ref.watch(foodRecipesRepositoryProvider);
    final recipe = ref.watch(
      getRecipeDetailsProvider(
        apiClient: apiClient,
        recipesRepository: repository,
        id: id,
      ),
    );
    return recipe.when(
      data: (recipeDetails) {
        final recipe = recipeDetails[0];
        return Column(
          children: [
            DetailsPageHeaderWidget(
              thumbnail: recipe.recipeThumb,
              youtubeLink: recipe.recipeYoutube,
            ),

            /// Title bar
            DetailsTitleBarWidget(title: recipe.recipeTitle),
            RecipeIngredientsWidget(ingredients: recipe.ingredients)
          ],
        );
      },
      error: (err, stack) => Text('Err $err'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}