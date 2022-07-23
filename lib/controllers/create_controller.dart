import 'package:get/get.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';

class CreateController extends GetxController {

  var title = ''.obs;
  var body = ''.obs;
  var isLoading = false.obs;

  void apiPostCreate(Post post)async {

    await Network.postResponse(Network.apiCreate, Network.paramsCreate(post)).then((
        response) =>
    {
      print(response),
      isLoading(true)
    });
  }
}