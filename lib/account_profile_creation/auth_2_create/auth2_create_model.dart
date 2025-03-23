import '/flutter_flow/flutter_flow_util.dart';
import 'auth2_create_widget.dart' show Auth2CreateWidget;
import 'package:flutter/material.dart';

class Auth2CreateModel extends FlutterFlowModel<Auth2CreateWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddresscreate widget.
  FocusNode? emailAddresscreateFocusNode;
  TextEditingController? emailAddresscreateTextController;
  String? Function(BuildContext, String?)?
      emailAddresscreateTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailAddresscreateFocusNode?.dispose();
    emailAddresscreateTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
