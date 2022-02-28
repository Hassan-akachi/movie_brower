import 'package:flutter/material.dart';

import '../model/movie_summary.dart';


class MovieSummaryTile extends StatelessWidget {
  final MovieSummary movieSummary;

  const MovieSummaryTile({
    Key? key,
    required this.movieSummary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.grey[300],
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Text('Title: ${movieSummary.title}'),
        ),
      ),
    );
  }
}