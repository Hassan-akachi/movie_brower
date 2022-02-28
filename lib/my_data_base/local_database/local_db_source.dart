

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:movie_brower/model/movie_details.dart';
import 'package:movie_brower/model/search_title_result.dart';
import 'package:movie_brower/my_data_base/local_database/local_database_interface.dart';

const String MOVIE_DETAIL_BOX ="movieDetailBox";
const String SEARCH_TITLE_BOX ="searchTitleBox";


class LocalDBSource implements LocalDataInterface{
  final Box searchBox = Get.find<Box>(tag : MOVIE_DETAIL_BOX);
  final Box movieDetailsBox = Get.find(tag :SEARCH_TITLE_BOX);
  LocalDBSource();


  @override
 SearchTitleResult searchTitle(String title, int page)  {
    print("running searchMovie in localDataSource");
  return searchBox.get("T-$title::P-$page");
  }
  @override
  Future<void> cacheSearchTitle(SearchTitleResult result) async {
    print("running cacheSearchMovie in localDataSource");
  await searchBox.put("T-${result.title}::P-${result.page}",result);
  }


  @override
 MovieDetails getMovieDetails(String id){
    print("running getMovieDetails in localDataSource");
   return movieDetailsBox.get(id);
  }
  @override
  Future<void> cacheGetMovieDetails(MovieDetails movieDetails) async {
    print("running getCacheMovieDetails in localDataSource");
  await movieDetailsBox.put("${movieDetails.imdbmId}", movieDetails);
  }


}