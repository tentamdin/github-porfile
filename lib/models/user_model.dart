import 'package:flutter/material.dart';

class UserModel {
  String name, avataUrl, bio, userName, joinedDate;
  int followers, following, repos;

  UserModel({
    @required this.name,
    @required this.avataUrl,
    @required this.userName,
    @required this.joinedDate,
    @required this.bio,
    @required this.repos,
    @required this.followers,
    @required this.following,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bio = json['bio'];
    userName = json["login"];
    joinedDate = json["created_at"];
    avataUrl = json['avatar_url'];
    repos = json["public_repos"];
    followers = json['followers'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['bio'] = this.bio;
    data["login"] = this.userName;
    data["created_at"] = this.joinedDate;
    data["public_repos"] = this.repos;
    data['avatar_url'] = this.avataUrl;
    data['followers'] = this.followers;
    data['following'] = this.following;
    return data;
  }
}
