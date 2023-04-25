import 'package:testflutter/utils/constants.dart';

import '../utils/BaseApiServices.dart';
import '../utils/NetworkApiService.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(Constants.loginEndPint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          Constants.registerApiEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
