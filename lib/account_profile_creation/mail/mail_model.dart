import '/flutter_flow/flutter_flow_util.dart';
import 'mail_widget.dart' show MailWidget;
import 'package:flutter/material.dart';

class MailModel extends FlutterFlowModel<MailWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();
  }
}
