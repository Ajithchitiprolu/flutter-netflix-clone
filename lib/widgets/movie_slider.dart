import 'package:flutter/material.dart';
import 'package:movies_favourite/constants.dart';
import 'package:movies_favourite/screens/details_screen.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.title,
    required this.snapshot,
  });

  final String title;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, itemIndex) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                movie: snapshot.data[itemIndex]
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
                        '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
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
