class ChatRoomModel {
  String id;
  String lastMessage;
  String createdAt;
  String updatedAt;
  String lastMessageSender;
  bool isSeen;
  bool isCommunicated;
  int noOfUnseenMessages;
  List<String> participants;
  String initiated;

  ChatRoomModel({
    required this.id,
    required this.lastMessage,
    required this.createdAt,
    required this.updatedAt,
    required this.lastMessageSender,
    required this.isSeen,
    required this.isCommunicated,
    required this.noOfUnseenMessages,
    required this.participants,
    required this.initiated,
  });

  ChatRoomModel copyWith({
    String? id,
    String? lastMessage,
    String? createdAt,
    String? updatedAt,
    String? lastMessageSender,
    bool? isSeen,
    bool? isCommunicated,
    int? noOfUnseenMessages,
    List<String>? participants,
    String? initiated,
  }) {
    return ChatRoomModel(
      id: id ?? this.id,
      lastMessage: lastMessage ?? this.lastMessage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastMessageSender: lastMessageSender ?? this.lastMessageSender,
      isSeen: isSeen ?? this.isSeen,
      isCommunicated: isCommunicated ?? this.isCommunicated,
      noOfUnseenMessages: noOfUnseenMessages ?? this.noOfUnseenMessages,
      participants: participants ?? this.participants,
      initiated: initiated ?? this.initiated,
    );
  }

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModel(
      id: json['id'] ?? "",
      lastMessage: json['lastMessage'] ?? "",
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
      lastMessageSender: json['lastMessageSender'] ?? "",
      isSeen: json['isSeen'] ?? false,
      isCommunicated: json['isCommunicated'] ?? false,
      initiated: json['initiated'] ?? "",
      noOfUnseenMessages: json['noOfUnseenMessages'] ?? 0,
      participants: json['participants'] != null
          ? (json['participants'] as List<dynamic>)
          .map((participant) => participant.toString())
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lastMessage': lastMessage,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'lastMessageSender': lastMessageSender,
      'isSeen': isSeen,
      'isCommunicated': isCommunicated,
      'initiated': initiated,
      'noOfUnseenMessages': noOfUnseenMessages,
      'participants': participants,
    };
  }

  @override
  String toString() {
    return 'ChatRoom(id: $id, lastMessage: $lastMessage, createdAt: $createdAt, updatedAt: $updatedAt, lastMessageSender: $lastMessageSender, isSeen: $isSeen, noOfUnseenMessages: $noOfUnseenMessages, participants: $participants, initiated: $initiated)';
  }
}
