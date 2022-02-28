import 'package:movie_brower/model/movie_details.dart';
import 'package:movie_brower/model/search_title_result.dart';

abstract class RemoteDataInterface {
  Future<SearchTitleResult> searchTitle(String title,int page );
  Future<MovieDetails> getMovieDetails(String id);
}