import 'package:aprjnew/contact/updatenote.dart';
import 'package:flutter/material.dart';

import '../contact/feedback.dart';
import 'addProfilebyuser.dart';

class AddProfileUserScreen extends StatelessWidget {
  const AddProfileUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: AddProfileByUser())

    );
  }
}


class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(child: Feedbackbyuser())

    );
  }
}

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(child: UpdateInfo())

    );
  }
}
