class MessageModel {
  final int id;
  final String text;
  final String sender; // 'user' or 'other'
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.text,
    required this.sender,
    required this.timestamp,
  });
}