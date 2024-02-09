class MessageModel {
  String? senderId;
  String? receiverId;
  String? message;
  String? date;

  MessageModel({
    this.senderId,
    this.receiverId,
    this.message,
    this.date,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      date: json['date'],
    );
  }
}
