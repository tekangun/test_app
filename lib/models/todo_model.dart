class TodoModel {
  String? uuid;
  String? jobName;
  bool? jobStatus;

  TodoModel({this.uuid, this.jobName, this.jobStatus = false});

  TodoModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    jobName = json['jobName'];
    jobStatus = json['jobStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['jobName'] = jobName;
    data['jobStatus'] = jobStatus;
    return data;
  }
}