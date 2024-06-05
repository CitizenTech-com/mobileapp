import 'package:Citizen.Tech/constants/app.constants.dart';
import 'package:Citizen.Tech/providers/api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class RegistrationRepository {
  final ApiClient apiClient;

  RegistrationRepository({
    required this.apiClient,
  });

  Future<Response?> getPostCodes() async {
    return await apiClient.getData(
        logs: false, AppConstants.GET_POSTCODE_URL, headers: null);
  }

  Future<Response?> registerUser(dynamic data) async {
    return await apiClient.postData(
      logs: false,
      AppConstants.REGISTER_USER,
      data
    );
  }
}
