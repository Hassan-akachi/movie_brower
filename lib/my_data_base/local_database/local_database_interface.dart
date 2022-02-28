import 'package:movie_brower/model/movie_details.dart';
import 'package:movie_brower/model/search_title_result.dart';

abstract class LocalDataInterface {
   SearchTitleResult searchTitle(String title,int page );
   Future<void> cacheSearchTitle(SearchTitleResult result);

  MovieDetails getMovieDetails(String id);
   Future<void> cacheGetMovieDetails(MovieDetails id);
}