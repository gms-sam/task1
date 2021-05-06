import 'dart:convert';


List<NoteModel> note = [];
List<NoteModel> trash = [];
List<Map<String, dynamic>> noteMap = [];
List<Map<String, dynamic>> trashMap = [];
class NoteModel {
  String title;
  String description;
  NoteModel({
    this.title,
    this.description,
  });

  NoteModel copyWith({
    String title,
    String description,
  }) {
    return NoteModel(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  NoteModel merge(NoteModel model) {
    return NoteModel(
      title: model.title ?? this.title,
      description: model.description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return NoteModel(
      title: map['title'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source));

  @override
  String toString() => 'NoteModel(title: $title, description: $description)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is NoteModel &&
      o.title == title &&
      o.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
