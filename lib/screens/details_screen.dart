import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_favourite/constants.dart';
import 'package:movies_favourite/models/movie.dart';
import 'package:movies_favourite/provider/favourite_provider.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoruiteMovies = ref.watch(favouriteProvider);
    final isFavourite = favoruiteMovies.contains(movie);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 16, left: 16),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      final wasAdded = ref
                          .read(favouriteProvider.notifier)
                          .toggleMovieFavoriteStatus(movie);
                      final message = wasAdded ? "Added to Favourite Movies" : "Removed from Favourite Movies";
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                    },
                    icon: isFavourite ?  const Icon(Icons.star, color: Colors.amber,) : const Icon(Icons.star)),
              ),
            ],
            backgroundColor: Colors.blueGrey,
            expandedHeight: 400,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                child: Image.network(
                  '${Constants.imagePath}${movie.backDropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Overview',
                      style: TextStyle(
                        fontSize: 30,
                      )),
                  const SizedBox(height: 30),
                  Text(movie.overView.toString()),
                  const Text(
                      'Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,Welcome to our Random Paragraph Generator! Our generator uses cutting-edge technology to create unique and informative paragraphs on a wide range of topics,'),
                  const SizedBox(height: 15),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(children: [
                            const Text('Release Data: '),
                            Text(movie.releaseDate),
                          ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(children: [
                            const Text('Rating: '),
                            const Icon(Icons.star, color: Colors.amber),
                            Text('${movie.voteAverage.toStringAsFixed(1)}/10'),
                          ]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
