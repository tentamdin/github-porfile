class RateModel {
  RateModel({
    this.limit,
    this.remaining,
    this.reset,
    this.used,
    this.resource,
  });

  int limit;
  int remaining;
  int reset;
  int used;
  String resource;

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
        limit: json["limit"],
        remaining: json["remaining"],
        reset: json["reset"],
        used: json["used"],
        resource: json["resource"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "remaining": remaining,
        "reset": reset,
        "used": used,
        "resource": resource,
      };
}
