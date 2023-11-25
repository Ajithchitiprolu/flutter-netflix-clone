import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_favourite/models/movie.dart';

class FavouriteMoviesNotifier extends StateNotifier<List<Movie>> {
  FavouriteMoviesNotifier() : super([]);

  bool toggleMovieFavoriteStatus(Movie movie) {
    final movieIsFavourite = state.contains(movie);

    if (movieIsFavourite) {
      state = state.where((m) => m.id != movie.id).toList();
      return false;
    } else {
      state = [...state, movie];
      return true;
    }
  }
}

final favouriteProvider = StateNotifierProvider<FavouriteMoviesNotifier, List<Movie>>((ref) {
  return FavouriteMoviesNotifier();
});
