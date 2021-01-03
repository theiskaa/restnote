class Note {
  String key;
  String title;
  String description;

  Note({this.key, this.title, this.description});

  Note.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}