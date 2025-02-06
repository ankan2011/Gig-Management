class NotesModel {
  final String title;
  final String description;
  final DateTime createDate;
  final DateTime? updateDate;

  NotesModel({
    required this.title,
    required this.description,
    required this.createDate,
    this.updateDate,
  });
}