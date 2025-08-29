import 'package:get/get.dart';
import '../services/home_service.dart';

class HomeController extends GetxController {
  var homeNewsList = <dynamic>[].obs;
  var isLoading = true.obs;

  final HomeService _homeService = HomeService();

  @override
  void onInit() {
    fetchHomeNews();
    super.onInit();
  }

  void fetchHomeNews() async {
    try {
      isLoading(true);
      var news = await _homeService.fetchHomeNews();
      if (news != null) {
        homeNewsList.value = news;
      }
    } finally {
      isLoading(false);
    }
  }
}
