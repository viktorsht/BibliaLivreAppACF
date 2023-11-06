class BookModel {
  int? id;
  String? name;
  String? abbrev;
  String? testament;
  int? chapters;

  BookModel({this.id, this.name, this.abbrev, this.testament, this.chapters});

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abbrev = json['abbrev'];
    testament = json['testament'];
    chapters = json['chapters'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abbrev'] = abbrev;
    data['testament'] = testament;
    data['chapters'] = chapters;
    return data;
  }
}
