import 'package:flutter/material.dart';
import 'package:super_sushi/models/dev_task/repo_model.dart';
import 'package:super_sushi/services/api/dio_client.dart';

export 'package:provider/provider.dart';

/// Repos provider to control data
class ReposProvider extends ChangeNotifier {
  final _api = DioClient.instance;

  /// List of repos
  List<RepoModel>? repos;

  /// Get repos data
  Future<List<RepoModel>> getRepos(int page) async {
    if (page == 1) {
      repos = null;
      notifyListeners();
    }

    final tmp = await _api.getRepos(page);

    if (repos == null) {
      repos = List.of(tmp);
    } else {
      if (tmp.isNotEmpty) {
        if (repos!.last.id != tmp.last.id) {
          repos!.addAll(tmp);
        }
      }
    }
    notifyListeners();
    return tmp;
  }
}
