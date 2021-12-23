class Paging {
  const Paging({
    required this.page,
    required this.limit,
    required this.prevPage,
    required this.nextPage,
    required this.count,
    required this.totalPages,
  });

  final int page;
  final int limit;
  final int prevPage;
  final int nextPage;
  final int count;
  final int totalPages;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        page: json["page"],
        limit: json["limit"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
        count: json["count"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "prevPage": prevPage,
        "nextPage": nextPage,
        "count": count,
        "totalPages": totalPages,
      };
}
