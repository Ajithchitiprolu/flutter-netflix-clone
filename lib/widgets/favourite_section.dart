import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_favourite/constants.dart';
import 'package:movies_favourite/provider/favourite_provider.dart';
import 'package:movies_favourite/screens/details_screen.dart';

class FavouriteSection extends ConsumerStatefulWidget {
  const FavouriteSection({super.key});

  @override
  ConsumerState<FavouriteSection> createState() => _FavouriteSectionState();
}

class _FavouriteSectionState extends ConsumerState<FavouriteSection> {
  @override
  Widget build(BuildContext context) {
    final favouriteMovies = ref.watch(favouriteProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Favourite Movies",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        Container(
          height: 200,
          margin: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            
            itemCount: favouriteMovies.length,
            itemBuilder: (ctx, index) {
              final movie = favouriteMovies[index];
              // print(favouriteMovies[index]);
              // return Text(movie.title);
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                movie: movie,
                                ),
                              ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SizedBox(
                      height: 200,
                      width: 150,
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        '${Constants.imagePath}${movie.posterPath}',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
