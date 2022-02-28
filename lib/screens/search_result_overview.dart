import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:movie_brower/state_manage/state_manager.dart';

import '../constants_var.dart';
import '../widget/movie_summary_tile.dart';


class SearchResultOverView extends StatelessWidget {
  const SearchResultOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  StateManager  _stateManager= Get.find<StateManager>();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ConstantsVar.KPRIMARY2,
                  ConstantsVar.KPRIMARY,
                  ConstantsVar.KWHITE,
                  ConstantsVar.KWHITE
                ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Obx(
                () => ListView.builder(
              itemCount:
              _stateManager.searchTitleResult.value.movieSummary!.length,
              itemBuilder: (_, ind) {
                return MovieSummaryTile(
                  movieSummary:
                  _stateManager.searchTitleResult.value.movieSummary![ind],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
