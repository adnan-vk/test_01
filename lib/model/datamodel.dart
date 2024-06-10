class DataModel {
  String? id;
  String? dataname;
  String? description;
  String? date;
  String? time;
  DataModel({
    this.id,
    required this.dataname,
    required this.description,
    this.date,
    this.time,
  });

  factory DataModel.fromjson(String id, Map<String, dynamic> json) {
    return DataModel(
      id: id,
      dataname: json['name'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'name': dataname,
      'description': description,
      'date': date,
      'time': time,
    };
  }
}
