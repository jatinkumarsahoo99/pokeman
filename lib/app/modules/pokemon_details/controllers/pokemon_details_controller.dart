import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/app_utility.dart';
import '../../home/poke_mon_response_model.dart';

class PokemonDetailsController extends GetxController {
  //TODO: Implement PokemonDetailsController

  final count = 0.obs;

  Data? pokeManData;

  @override
  void onInit() {
    super.onInit();
  }

  getDetails(){
    try{
      AppUtility.showProgressIndicator();
      var arguments = Get.arguments;
      debugPrint(">>>>exception$arguments");
      if(arguments != null){
        pokeManData = Data.fromJson(arguments as Map<String,dynamic>);
        update(['all']);
        AppUtility.disMissProgressIndicator();

      }
    }catch(e){
      debugPrint(">>>>exception$e");
      AppUtility.disMissProgressIndicator();
    }

  }

  @override
  void onReady() {
    getDetails();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
