import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:super_sushi/models/dev_task/repo_model.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';

/// Api integration client
class DioClient {
  /// Instance of the client
  static final DioClient instance = DioClient._();

  // Http Client
  final Dio _dio = Dio();

  // Logger
  final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    error: true,
  );

  // Headers
  final Map<String, dynamic> _apiHeaders = <String, dynamic>{
    'Accept': 'application/json',
  };

  //Singleton
  DioClient._() {
    // Attach Logger
    if (kDebugMode) _dio.interceptors.add(_logger);
  }

  ////////////////////////////// METHODS //////////////////////////////////////

  /// Get paginated repos 10 per page
  Future<List<RepoModel>> getRepos(int page) async {
    final response = await _dio.get(
      AppConstants.apiUrl,
      queryParameters: {
        'page': page,
        'per_page': 10,
      },
      options: Options(
        headers: _apiHeaders,
      ),
    );
    if (_validResponse(response.statusCode!)) {
      final List<RepoModel> l = <RepoModel>[];
      for (var repo in (response.data)) {
        l.add(RepoModel.fromMap(repo));
      }
      return l;
    } else {
      throw response.data;
    }
  }

  ////////////////////////////////
  // Validating Request.
  bool _validResponse(int statusCode) => statusCode >= 200 && statusCode < 300;
}
