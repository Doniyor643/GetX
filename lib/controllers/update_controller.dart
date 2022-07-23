

import 'package:get/get.dart';
import 'package:patterns_getx/services/http_service.dart';

import '../model/post_model.dart';

class UpdateController extends GetxController{
  var title = ''.obs;
  var body = ''.obs;

  void apiPostUpdate(Post post)async{
    await Network.putResponse(Network.apiUpdate+post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      print(response),
    });
  }
}