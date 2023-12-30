class Dict {
  final int id;
  final String dictName;
  final String coverUrl;
  final int totalWords;

  Dict({
    required this.id,
    required this.dictName,
    required this.coverUrl,
    required this.totalWords,
  });

  factory Dict.fromJson(Map<String, dynamic> json) {
    return Dict(
      id: json['DictID'],
      dictName: json['DictName'],
      coverUrl: json['CoverUrl'],
      totalWords: json['TotalWords'],
    );
  }
}
