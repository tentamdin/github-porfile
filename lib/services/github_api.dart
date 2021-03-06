import 'package:git_profile/models/rate_model.dart';
import 'package:git_profile/models/repo_model.dart';
import 'package:git_profile/models/user_model.dart';
import 'package:git_profile/services/dio_client.dart';

import 'endpoints.dart';

class GithubApi {
  DioClient _client = DioClient();

  Future<UserModel> getUserInfo(String username) async {
    try {
      final response = await _client.get("${Endpoints.userParam}/$username");
      return UserModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<List<RepoModel>> getRepos(String username) async {
    try {
      final List response = await _client
          .get('${Endpoints.userParam}/$username/${Endpoints.repoParam}');
      return response.map((item) => RepoModel.fromJson(item)).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<RateModel> getRateLimit() async {
    try {
      final response = await _client.get('${Endpoints.rateLimit}');
      return RateModel.fromJson(response["rate"]);
    } catch (e) {
      throw e;
    }
  }
}
