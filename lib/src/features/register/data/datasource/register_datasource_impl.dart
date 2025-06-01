import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/request/register_player_request_dto.dart';
import 'register_datasource.dart';

class RegisterDatasourceImpl extends RegisterDatasource {
  final dio = Modular.get<Dio>();

  @override
  Future<Map<String, dynamic>> registerPlayer({
    required String userName,
    required String userPhone,
    required String userEmail,
    required String userPassword,
    required String userConfirmPassword,
    required String userCep,
    required String userAddress,
    required String userNeighborhood,
    required String userCity,
    required String userState,
    required bool isOwner,
  }) async {
    try {
      final dto = RegisterPlayerRequestDto(
        userName: userName,
        userPhone: userPhone,
        userEmail: userEmail,
        userPassword: userPassword,
        userCep: userCep,
        userAddress: userAddress,
        userNeighborhood: userNeighborhood,
        userCity: userCity,
        userState: userState,
        isOwner: false,
      );
      final response = await dio.post(
        'http://10.0.2.2:8000/api/user',
        data: dto.toJson(),
      );
      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('An unexpected error occurred: $e}');
      }
    }
  }
}
