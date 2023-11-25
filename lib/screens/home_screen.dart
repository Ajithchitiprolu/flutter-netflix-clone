import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_favourite/provider/api_provider.dart';
import 'package:movies_favourite/provider/trending_movies_provider.dart';
import 'package:movies_favourite/widgets/favourite_section.dart';
import 'package:movies_favourite/widgets/movie_slider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final trendingMovies = ref.read(apiProvider).getTrendingMovies();
    final topRatedMovies = ref.read(apiProvider).getTopRated();
    final joke = ref.read(apiProvider).getAJoke();
    final trendingMovies = ref.watch(trendingMoviesProvider.notifier).fetchTrendingMovies();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(98, 86, 130, 172),
        title: const Text('Netflix Clone'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            child: FutureBuilder(
                future: joke,
                initialData: const [],
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    // print("has Errors");
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return Text(snapshot.data.toString());
                    // print("has Data");
                    // return const MovieSlider(title: "Trending Movies");
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          SizedBox(
            child: FutureBuilder(
                future: trendingMovies,
                initialData: const [],
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    // print("has Errors");
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return MovieSlider(
                        title: "Trending Movies", snapshot: snapshot);
                    // print("has Data");
                    // return const MovieSlider(title: "Trending Movies");
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          SizedBox(
            child: FutureBuilder(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    // print("has Errors");
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return MovieSlider(
                        title: "Top Rated Movies", snapshot: snapshot);
                    // print("has Data");
                    // return const MovieSlider(title: "Trending Movies");
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          const FavouriteSection(),
        ]),
      ),
    );
  }
}
