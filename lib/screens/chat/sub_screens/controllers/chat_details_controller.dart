import 'dart:async';

import 'package:get/get.dart';
import 'package:injoy/screens/chat/sub_screens/model/chat_details_model.dart';

class ChatDetailsController extends GetxController {

  final List<ChatDetailsModel> chatDummyList = [
    ChatDetailsModel(message: "Hi Developer Suffian. How're You. I'm Abdullah From UCP Faisalabad. Hope You'll Be Fine And Also Your Family Abdullah.", isSender: true, isVoiceMessage: false),
    ChatDetailsModel(message: "Yes we are fine, wow really nice", isSender: false, isVoiceMessage: false),
    ChatDetailsModel(message: "Can you please give me Notes?", isSender: true, isVoiceMessage: false),
    ChatDetailsModel(message: "Ok, I give you But Where!", isSender: false, isVoiceMessage: false),
    ChatDetailsModel(message: "Thanks, At UCP", isSender: true, isVoiceMessage: false),
    // ChatDetailsModel(message: "", isSender: false, isVoiceMessage: true),
    ChatDetailsModel(message: "Hi Developer Suffian. How're You. I'm Abdullah From UCP Faisalabad. Hope You'll Be Fine And Also Your Family Abdullah.", isSender: true, isVoiceMessage: false),
    ChatDetailsModel(message: "Yes we are fine, wow really nice", isSender: false, isVoiceMessage: false),
    ChatDetailsModel(message: "Can you please give me Notes?", isSender: true, isVoiceMessage: false),
    ChatDetailsModel(message: "Ok, I give you But Where!", isSender: false, isVoiceMessage: false),
    ChatDetailsModel(message: "Thanks, At UCP", isSender: true, isVoiceMessage: false),
    // ChatDetailsModel(message: "", isSender: true, isVoiceMessage: true),

  ];

  var showFloatingCard = false.obs;
}