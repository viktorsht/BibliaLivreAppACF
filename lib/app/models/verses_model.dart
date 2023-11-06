class VersesModel {
  int? id;
  String? version;
  int? testament;
  int? book;
  int? chapter;
  int? verse;
  String? text;

  VersesModel(
      {this.id,
      this.version,
      this.testament,
      this.book,
      this.chapter,
      this.verse,
      this.text});

  VersesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    testament = json['testament'];
    book = json['book'];
    chapter = json['chapter'];
    verse = json['verse'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['testament'] = testament;
    data['book'] = book;
    data['chapter'] = chapter;
    data['verse'] = verse;
    data['text'] = text;
    return data;
  }
}
