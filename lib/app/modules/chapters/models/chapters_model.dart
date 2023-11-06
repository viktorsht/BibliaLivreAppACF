import 'package:holy_bible/app/models/books_model.dart';
import 'package:holy_bible/app/models/verses_model.dart';

class ChapterModel {
  int? id;
  BookModel? book;
  List<VersesModel>? verse;

  ChapterModel({this.id, this.book, this.verse});

  ChapterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    book = json['book'] != null ? BookModel.fromJson(json['book']) : null;
    if (json['verse'] != null) {
      verse = <VersesModel>[];
      json['verse'].forEach((v) {
        verse!.add(VersesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (book != null) {
      data['book'] = book!.toJson();
    }
    if (verse != null) {
      data['verse'] = verse!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}