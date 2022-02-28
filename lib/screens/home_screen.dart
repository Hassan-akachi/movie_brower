import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_brower/constants_var.dart';
import 'package:movie_brower/screens/search_result_overview.dart';
import 'package:movie_brower/state_manage/state_manager.dart';


  class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    final StateManager _stateManager = Get.find<StateManager>();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hassan's Movie \n      Browser",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 50),
                  height: 40,
                  width: MediaQuery.of(context).size.width * .80,
                  child: TextField(
                    controller: _stateManager.titleTextController,
                    autocorrect: true,
                    decoration: InputDecoration(
                        hintText: "movie",
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 20,
                          color: ConstantsVar.KPRIMARY,
                        ),
                        focusColor: ConstantsVar.KPRIMARY,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )),
              InkWell(
                highlightColor: Colors.black,
                onTap: () async{
                  await _stateManager.searchTitle();
                  Get.to( const SearchResultOverView());
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .06,
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: ConstantsVar.KPRIMARY2),
                  child: const Center(
                      child: Text(
                    "Search",
                    style: TextStyle(color: ConstantsVar.KWHITE, fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
