import 'package:get/get.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {
  var newsList = <dynamic>[].obs;
  var isLoading = true.obs;

  final NewsService _newsService = NewsService();

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var news = await _newsService.fetchNews();
      if (news != null) {
        newsList.value = news;
      }
    } finally {
      isLoading(false);
    }
  }
}
