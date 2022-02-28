import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:movie_brower/model/movie_rating.dart';
import 'package:movie_brower/model/movie_summary.dart';
import 'package:movie_brower/model/search_title_result.dart';
import 'model/movie_details.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'my_data_base/local_database/local_db_source.dart';

Future<void> initDb() async {


  Hive
    ..initFlutter()

    ..registerAdapter(MovieDetailsAdapter())
    ..registerAdapter(MovieRatingAdapter())
    ..registerAdapter(MovieSummaryAdapter())
    ..registerAdapter(SearchTitleResultAdapter());

 final Box searchBox =await Hive.openBox(SEARCH_TITLE_BOX);
  final Box movieDetailsBox= await Hive.openBox(MOVIE_DETAIL_BOX);

  Get.put<Box>(searchBox,tag: SEARCH_TITLE_BOX);
  Get.put(movieDetailsBox, tag :MOVIE_DETAIL_BOX);
}
