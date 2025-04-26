class MessageModel {
  String id;
  bool isMessage;
  String message;
  String time;
  String sender;
  String imageUrl;
  bool seen;
  String callDuration;
  bool isVideo;

  MessageModel({
    required this.id,
    required this.isMessage,
    required this.message,
    required this.seen,
    required this.imageUrl,
    required this.callDuration,
    required this.isVideo,
    required this.time,
    required this.sender,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] ?? '',
      isMessage: json['isMessage'] ?? false,
      message: json['message'] ?? '',
      time: json['time'] ?? '',
      seen: json['seen'] ?? false,
      sender: json['sender'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      callDuration: json['callDuration'] ?? '',
      isVideo: json['isVideo'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isMessage': isMessage,
      'message': message,
      'time': time,
      'sender': sender,
      'seen': seen,
      'imageUrl': imageUrl,
      'callDuration': callDuration,
      'isVideo': isVideo,
    };
  }

  @override
  String toString() {
    return 'MessageModel(id: $id, isMessage: $isMessage, message: $message, time: $time, sender: $sender, imageUrl: $imageUrl, callDuration: $callDuration, isVideo: $isVideo)';
  }
}
