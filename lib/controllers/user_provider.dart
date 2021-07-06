import 'package:flutter/material.dart';
import 'package:git_profile/models/rate_model.dart';
import 'package:git_profile/models/repo_model.dart';
import 'package:git_profile/models/user_model.dart';
import 'package:git_profile/routes/app_routes.dart';
import 'package:git_profile/services/exceptions.dart';
import 'package:git_profile/services/github_api.dart';
import 'package:git_profile/widgets/snackbar.dart';

class UserProvider extends ChangeNotifier {
  GithubApi _githubApi = GithubApi();

  bool isloading = false;

  UserModel _userModel;
  UserModel get userModel => _userModel;

  List<RepoModel> _repos;
  List<RepoModel> get repos => _repos;

  RateModel _rateModel;
  RateModel get rate => _rateModel;

  void setLoading(bool value) {
    isloading = value;
    notifyListeners();
  }

  Future<void> getUserData(String username, BuildContext context) async {
    setLoading(true);
    try {
      final UserModel response = await _githubApi.getUserInfo(username);
      _userModel = response;
      setLoading(false);
    } catch (e) {
      final message = DioExceptions.fromDioError(e).message.toString();
      showSnackBar(context, "Error", message);
      setLoading(false);
    }
  }

  Future<void> getRateData(BuildContext context) async {
    setLoading(true);
    try {
      final RateModel response = await _githubApi.getRateLimit();
      _rateModel = response;
      setLoading(false);
    } catch (e) {
      // final message = DioExceptions.fromDioError(e).message.toString();
      // showSnackBar(context, "Error", message);
      setLoading(false);
    }
  }

  Future<void> getUserRepos(String username, BuildContext context) async {
    setLoading(true);
    try {
      final List<RepoModel> response = await _githubApi.getRepos(username);
      List<RepoModel> repoNotForked =
          response.where((element) => !element.isForked).toList();
      repoNotForked.sort((a, b) => b.starCount.compareTo(a.starCount));
      _repos = repoNotForked;
      setLoading(false);
      Navigator.of(context).pushNamed(AppRoutes.userDetails);
    } catch (e) {
      // final message = DioExceptions.fromDioError(e).message.toString();
      // showSnackBar(context, "Error", message);
      setLoading(false);
    }
  }
}
