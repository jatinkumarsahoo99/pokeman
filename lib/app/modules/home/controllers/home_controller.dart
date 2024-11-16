import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api_service/http_methods.dart';
import '../../../utils/app_utility.dart';
import '../poke_mon_response_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  int page = 1;

  // PokemonResponseModel? pokemonResponseModel = PokemonResponseModel(data: []);
  List<Data>? masterPokemonDataList = [];
  List<Data>? pokemonDataList = [];

  final ScrollController scrollController = ScrollController();

  callApi({required int size}) {
    try {
      AppUtility.showProgressIndicator();
      HttpMethodsDio().getMethod(
          api:
              "https://api.pokemontcg.io/v2/cards?page=${size+ 1}&pageSize=10",
          fun: (map, code) {
            AppUtility.disMissProgressIndicator();
            if (map != null && map["data"] != null && map['data'].length >0) {
              map['data'].forEach((e){
                masterPokemonDataList?.add(Data.fromJson(e));
              });
              pokemonDataList = [...?masterPokemonDataList];
              page = page +1;
              update(["grid"]);
            }
          });
    } catch (e) {
      AppUtility.disMissProgressIndicator();
    }
  }

  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  callSearchApi({required String text}){
    if(text.isNotEmpty){
      try {
        AppUtility.showProgressIndicator();
        HttpMethodsDio().getMethod(
            api:
            "https://api.pokemontcg.io/v2/cards?q=set.name:$text",
            fun: (map, code) {
              AppUtility.disMissProgressIndicator();
              if (map != null && map["data"] != null && map['data'].length >0) {
                pokemonDataList?.clear();
                map['data'].forEach((e){
                  pokemonDataList?.add(Data.fromJson(e));
                });
                update(["grid"]);
              }else{
                pokemonDataList?.clear();
                update(["grid"]);
              }
            });
      } catch (e) {
        AppUtility.disMissProgressIndicator();
        pokemonDataList = [...?masterPokemonDataList];
        update(["grid"]);
      }
    }else{
      pokemonDataList = [...?masterPokemonDataList];
      update(["grid"]);
    }

  }

  @override
  void onInit() {
    callApi(size: 0);
    // Add a listener to the ScrollController
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // If we're at the bottom of the list, load the next page
        callApi(size: page);
        debugPrint(">>>>>>>>>>>page$page");
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
