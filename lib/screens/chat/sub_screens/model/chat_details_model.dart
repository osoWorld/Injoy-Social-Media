class ChatDetailsModel {
  String message;
  bool isSender;
  bool isVoiceMessage;
  String? audioFilePath;

  ChatDetailsModel({required this.message, required this.isSender, required this.isVoiceMessage, this.audioFilePath});
}
