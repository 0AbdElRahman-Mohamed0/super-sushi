import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

extension DioErrorExtension on DioError {
  bool get is401 => response?.statusCode == 401;

  bool get is406 => response?.statusCode == 406;

  bool get is40X =>
      (response?.statusCode ?? 0) >= 400 && (response?.statusCode ?? 0) < 500;

  bool get is500 => response?.statusCode == 500;

  String get readableError {
    // No Response ? then No Server...
    if (response?.data == null) {
      return tr('cannot_reach');
    }

    if (is500) {
      return tr('internal_server_error');
    }

    // if response is String .. ex: 404
    if (response!.data.runtimeType == String) {
      // Url Not Found...
      if (response!.statusCode == 404) {
        return tr('404_error');
      }
      return '${response!.data}';
      // Else if Server Returned something..
    } else if (response!.data is Map<String, dynamic>) {
      if (response!.data['errors'] != null &&
          response!.data['errors'] is Map<String, dynamic>) {
        return '${response!.data['errors'].values.first.first}';
      }
      if (response!.data.values.first is List) {
        return '${response!.data.values.first.first}';
      }
      return '${response!.data.values.first}';
    }

    // IDK what the hell is this. so something weird happened;
    return tr('server_error');
  }
}
