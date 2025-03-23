import '/flutter_flow/flutter_flow_util.dart';
import 'home1_copy_widget.dart' show Home1CopyWidget;
import 'package:flutter/material.dart';

class Home1CopyModel extends FlutterFlowModel<Home1CopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
