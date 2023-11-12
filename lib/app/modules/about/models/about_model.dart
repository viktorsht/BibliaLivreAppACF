class AboutModel {
  int? id;
  String? name;
  String? abbreviation;
  String? version;
  String? description;
  String? bible;
  String? media;

  AboutModel(
      {this.id,
      this.name,
      this.abbreviation,
      this.version,
      this.description,
      this.bible,
      this.media});

  AboutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abbreviation = json['abbreviation'];
    version = json['version'];
    description = json['description'];
    bible = json['bible'];
    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abbreviation'] = abbreviation;
    data['version'] = version;
    data['description'] = description;
    data['bible'] = bible;
    data['media'] = media;
    return data;
  }
}
