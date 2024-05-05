import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopink/layers/data/source/remote/api/constants.dart';
import 'package:shopink/layers/data/models/product_response.dart';

part 'api_calls.g.dart';

@RestApi(baseUrl: ApiCostants.baseUrl)
abstract class ApiCalls {
  factory ApiCalls(Dio dio, {String baseUrl}) = _ApiCalls;

  @GET(ApiCostants.allProducts)
  Future<List<ProductResponse>> getProducts();

  @GET(ApiCostants.productsByCategory)
  Future<ProductResponse> getProductByCategory(
      @Path('category') String category);
}
