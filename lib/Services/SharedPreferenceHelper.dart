import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/Models/NoteModel.dart';


class SharedPreferenceHelper {
  final String notedata = 'noteData';
  Future<bool> setNoteData(List<NoteModel> noteData) async {
    bool success = false;
    var prefs = await SharedPreferences.getInstance();
    List<String> data =
        List<String>.from(noteData.map((e) => e.toJson()).toList());
    success = await prefs.setStringList(notedata, data);
    return success;
  }

  Future<List<NoteModel>> getNoteData() async {
    var prefs = await SharedPreferences.getInstance();
    List<String> data = prefs.getStringList(notedata);
    List<NoteModel> noteModel =
        List<NoteModel>.from(data.map((e) => NoteModel.fromJson(e)));
    return noteModel;
  }

  Future<bool> clear() async {
    var prefs = await SharedPreferences.getInstance();
    bool h = await prefs.clear();
    return h;
  }
}
