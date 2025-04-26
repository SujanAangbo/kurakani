class CallModel {
  String id;
  String callId;
  String callStatus;

  CallModel({
    required this.id,
    required this.callId,
    required this.callStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'callId': callId,
      'callStatus': callStatus,
    };
  }

  factory CallModel.fromJson(Map<String, dynamic> json) {
    return CallModel(
      id: json['id'] ?? "",
      callId: json['callId'] ?? "",
      callStatus: json['callStatus'] ?? "",
    );
  }

  @override
  String toString() {
    return 'NotificationModel{id: $id, callId: $callId, callStatus: $callStatus}';
  }
}
