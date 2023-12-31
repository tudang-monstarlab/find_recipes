import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/database/database.dart';
import '../../../presentation/feature/favorite_page/models/favorite_item_model.dart';

/// get all database items
final getAllFavoritesProvider =
    StreamProvider.family<List<FavoriteItemModel>, Database>(
  (ref, database) async* {
    final result = database.getAllFavorites();
    await for (final items in result.map(
      (dbEntries) => dbEntries
          .map((entry) => FavoriteItemModel.fromDbEntry(entry))
          .toList(),
    )) {
      yield items;
    }
  },
);
