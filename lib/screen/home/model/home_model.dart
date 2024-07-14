
class HomeModel {
  String? chapter_summary_hindi, name, text;
  int? chapter_number;

  HomeModel({this.chapter_summary_hindi, this.chapter_number, this.name, this.text});

   factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
        chapter_summary_hindi: m1['chapter_summary_hindi'],
        chapter_number: m1['chapter_number'],
        name: m1['name'],
        text: m1['text']);
  }
}

class ChapterModel {
  int? chapter_number;
  String? name, chapter_summary_hindi;
  ChapterModel(
      {this.name, this.chapter_summary_hindi, this.chapter_number});

  factory ChapterModel.mapToModel(Map m1) {
    return ChapterModel(
        name: m1['name'],
        chapter_summary_hindi: m1['chapter_summary_hindi'],
        chapter_number: m1['chapter_number']);

  }
}
