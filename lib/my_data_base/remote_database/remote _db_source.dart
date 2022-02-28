import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_brower/api_key.dart';

import 'package:movie_brower/model/movie_details.dart';
import 'package:movie_brower/model/search_title_result.dart';
import 'package:movie_brower/my_data_base/remote_database/remote_database_interface.dart';

const String BaseUrl = "http://www.omdbapi.com/?apikey=$APIKEY&";

class RemoteDBSource implements RemoteDataInterface {
  final http.Client client;

  RemoteDBSource(this.client);

  @override
  Future<MovieDetails> getMovieDetails(String id) async {
    print("running getMovieDetails in remoteDataSource");
    final response = await client.get(Uri.parse("$BaseUrl&i=$id"));
    if (response.statusCode != 200) throw Exception("no movie detailed found");
    return MovieDetails.fromJson(response.body);
  }

  @override
  Future<SearchTitleResult> searchTitle(String title, [int page = 1]) async {
    print("running searchMovie in remoteDataSource");
    final response =
        await client.get(Uri.parse(_buildSearchTitleUrl(title, page)));
    if (response.statusCode != 200) throw Exception("server Error");

    return SearchTitleResult.fromJson(
        title, json.decode(response.body) as Map<String, dynamic>, page);
  }
}

String _buildSearchTitleUrl(String title, int page) {
  String returnString = BaseUrl;
  returnString += "s=$title";
  if (page != 1) {
    returnString += "&page=$page";
  }
  return returnString;
}


