import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_brower/model/movie_details.dart';
import 'package:movie_brower/model/search_title_result.dart';
import 'package:movie_brower/my_data_base/local_database/local_database_interface.dart';
import 'package:movie_brower/my_data_base/remote_database/remote_database_interface.dart';

class StateManager extends GetxController {
  final LocalDataInterface _localDataInterface = Get.find<LocalDataInterface>();
  final RemoteDataInterface _remoteDataInterface = Get.find();



  StateManager();

  Rx<SearchTitleResult> searchTitleResult = SearchTitleResult().obs;
  Rx<MovieDetails> movieDetails = MovieDetails().obs;
  TextEditingController titleTextController =TextEditingController();

  Future<void> searchTitle({int page = 1}) async {
    print('searchMovie || SearchController');
    SearchTitleResult result;
    final String title = titleTextController.text;

    print(title);
    result = _localDataInterface.searchTitle(title, page);
    if (result != null) {
      print("result is null");
    }
      else {result  = await _remoteDataInterface.searchTitle(title, page);}


    //if its return null in the local db then
    // if(result ==null){
    // result = await _remoteDataInterface.searchTitle(title, page);}
    searchTitleResult.value = result;
    print('--------');
    print('searchResult title is ${searchTitleResult.value.title}');
    print(
        'searchResult totalResults is ${searchTitleResult.value.totalResultFound}');
  }

  Future<void> getMovieDetails(String id) async {
    print('getMovieDetails || SearchController');
    MovieDetails details;

    details = _localDataInterface.getMovieDetails(id);
    if (_localDataInterface.getMovieDetails(id) == null) {
      details = await _remoteDataInterface.getMovieDetails(id);
    }
    //if its return null in the local db then
    // if (details == null) {
    //   details = await _remoteDataInterface.getMovieDetails(id);
    // }

    movieDetails.value = details;
  }
}
