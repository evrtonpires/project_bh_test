import 'package:dio/dio.dart';

import '../models/product_model.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository({required this.dio}) {
    dio.options.receiveTimeout = 36000;
    dio.options.baseUrl = 'https://run.mocky.io/v3';
  }

//----------------------------------------------------------------------------
  Future<List<ProductModel>> getData() async {
    try {
      Response response = await dio
          .get('/d2c58c71-2a8d-4bc8-93e1-6aa38ab898de')
          .catchError((e) {});

      List<ProductModel> dataModels = [];

      (response.data as List).forEach((element) {
        dataModels.add(ProductModel.fromJson(element));
      });

      return dataModels;
    } catch (e) {
      return [];
    }
  }
//----------------------------------------------------------------------------
}
