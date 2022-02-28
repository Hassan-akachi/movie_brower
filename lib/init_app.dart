import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:movie_brower/init_db.dart';
import 'package:movie_brower/my_data_base/local_database/local_database_interface.dart';
import 'package:movie_brower/my_data_base/local_database/local_db_source.dart';
import 'package:movie_brower/my_data_base/remote_database/remote%20_db_source.dart';
import 'package:movie_brower/my_data_base/remote_database/remote_database_interface.dart';

import 'package:http/http.dart' as http;
import 'package:movie_brower/state_manage/state_manager.dart';


Future<void> iniApp() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDb();


  final http.Client client= http.Client();
  final RemoteDBSource remoteDBSource = RemoteDBSource(client);

  Get.lazyPut<LocalDataInterface>(()=> LocalDBSource()); 
  Get.put<RemoteDataInterface>(remoteDBSource,permanent: true);

  StateManager stateManager = StateManager();
  Get.put<StateManager>(stateManager,permanent: true);
}