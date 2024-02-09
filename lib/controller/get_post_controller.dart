import 'package:get/get.dart';

import '../model/post_model.dart';
import '../service/get_post_service.dart';

class GetPostController extends GetxController {
  late Future<List<PostModel>> postModel;
  List<PostModel> posts = [];
  handleGetPost() {
    // postModel = getPostService();
    // postModel.then((value) {
    //   posts = value;
    //   update();
    // });
  }

  @override
  void onInit() {
    handleGetPost();
    super.onInit();
  }
}
