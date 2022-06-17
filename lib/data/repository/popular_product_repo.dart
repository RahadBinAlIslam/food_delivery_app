import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constraints.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstraints.POPULAR_PRODUCT_URL);
  }

  PopularProductRepo({required this.apiClient});
}