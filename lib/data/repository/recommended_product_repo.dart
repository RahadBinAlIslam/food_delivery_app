import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constraints.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstraints.RECOMMENDED_PRODUCT_URL);
  }

  RecommendedProductRepo({required this.apiClient});
}