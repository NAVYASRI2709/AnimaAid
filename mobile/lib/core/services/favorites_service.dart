import 'package:flutter/foundation.dart';

class FavoritesService {
  FavoritesService._();

  static final FavoritesService instance = FavoritesService._();

  final ValueNotifier<Set<String>> favorites =
      ValueNotifier<Set<String>>({});

  void toggleFavorite(String animalName) {
    final updatedFavorites = Set<String>.from(favorites.value);

    if (updatedFavorites.contains(animalName)) {
      updatedFavorites.remove(animalName);
    } else {
      updatedFavorites.add(animalName);
    }

    favorites.value = updatedFavorites;
  }

  bool isFavorite(String animalName) {
    return favorites.value.contains(animalName);
  }

  void removeFavorite(String animalName) {
    final updatedFavorites = Set<String>.from(favorites.value);
    updatedFavorites.remove(animalName);
    favorites.value = updatedFavorites;
  }
}