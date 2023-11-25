import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_favourite/api/api.dart';
import 'package:movies_favourite/models/movie.dart';

class TrendingMoviesNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  TrendingMoviesNotifier() : super(const AsyncValue.loading());

  Future<void> fetchTrendingMovies() async {
    try {
      final response = await Api.getTrendingMovies();
      state = AsyncValue.data(response);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e.toString(), stackTrace);
    }
  }
}

final trendingMoviesProvider =
    StateNotifierProvider<TrendingMoviesNotifier, AsyncValue<List<Movie>>>((ref) => TrendingMoviesNotifier());
