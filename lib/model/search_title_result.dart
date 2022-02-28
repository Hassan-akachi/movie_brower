import 'package:hive/hive.dart';
import 'package:movie_brower/model/movie_summary.dart';

part 'search_title_result.g.dart';

@HiveType(typeId: 3)
class SearchTitleResult {
  @HiveField(0)
  final String?  title;
  @HiveField(1)
  final int? page;
  @HiveField(2)
  final bool? found;
  @HiveField(3)
  final int? totalResultFound;
  @HiveField(4)
  final List<MovieSummary>? movieSummary;

  SearchTitleResult(
      {this.title,
      this.page,
      this.found,
      this.totalResultFound,
      this.movieSummary});

  factory SearchTitleResult.fromJson(
      String title, Map<String, dynamic> json, int page) {
    if ((json["Response"] ??= "False") == "False") {
      SearchTitleResult(title: title, page: page, found: false);
    }

    final List<MovieSummary> movies = [];
    for (final result in json["Search"]) {
      movies.add(
        MovieSummary(
            title: result["Title"] as String? ?? "",
            year: result["Year"] as String? ?? "1000",
            imdbID: result["imdbID"] as String? ?? "",
            type: result["Type"] as String? ?? "",
            poster: result["Poster"] as String? ?? ""),
      );
    }
    return SearchTitleResult(
        title: title,
        page: page,
        found: true,
        totalResultFound: json["totalResults"] as int,
        movieSummary: movies);
  }
}
