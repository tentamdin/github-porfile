class RepoModel {
  String name, repoLink, description, language;
  int starCount;
  int forks;
  int size;

  RepoModel({
    this.name,
    this.description,
    this.repoLink,
    this.language,
    this.forks,
    this.starCount,
    this.size,
  });

  static RepoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return RepoModel(
      name: map['name'],
      repoLink: map['html_url'],
      description: map["description"],
      language: map["language"],
      forks: map["forks"],
      starCount: map["stargazers_count"],
      size: map["size"],
    );
  }

  RepoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    repoLink = json['html_url'];
    description = json["description"];
    language = json["language"];
    forks = json["forks"];
    starCount = json["stargazers_count"];
    size = json["size"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['html_url'] = this.repoLink;
    data["description"] = this.description;
    return data;
  }
}
