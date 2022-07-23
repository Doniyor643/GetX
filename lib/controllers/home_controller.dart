
import 'package:get/get.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';

class HomeController extends GetxController{
  var isLoading = false.obs;
  var items = [].obs;

  Future apiPostList() async {

      isLoading(true);

    var response = await Network.getResponse(Network.apiList, Network.paramsEmpty());

      if (response != null) {
        items.value = Network.parsePostList(response);
      } else {
        items.value = [];
      }
      isLoading(false);

  }


  Future<bool> apiPostDelete(Post post) async {
    isLoading(true);
    var response = await Network.deleteResponse(Network.apiDelete + post.id.toString(), Network.paramsEmpty());
      isLoading(false);
      return response != null;
  }

}