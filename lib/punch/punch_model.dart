import '/backend/api_requests/api_calls.dart';
import '/components/punched_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'punch_widget.dart' show PunchWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PunchModel extends FlutterFlowModel<PunchWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (BatteryAPI)] action in Punch widget.
  ApiCallResponse? batteryCopyCopy;
  // Stores action output result for [Backend Call - API (MacID)] action in Punch widget.
  ApiCallResponse? macSys2;
  // Stores action output result for [Backend Call - API (Hostname)] action in Punch widget.
  ApiCallResponse? hostSys2;
  // Stores action output result for [Backend Call - API (IPAddress)] action in Punch widget.
  ApiCallResponse? iPSys2;
  // Stores action output result for [Backend Call - API (OS Installation date)] action in Punch widget.
  ApiCallResponse? osSys2;
  // Stores action output result for [Backend Call - API (MacID)] action in Punch widget.
  ApiCallResponse? macSys;
  // Stores action output result for [Backend Call - API (Hostname)] action in Punch widget.
  ApiCallResponse? hostSys;
  // Stores action output result for [Backend Call - API (IPAddress)] action in Punch widget.
  ApiCallResponse? iPSys;
  // Stores action output result for [Backend Call - API (OS Installation date)] action in Punch widget.
  ApiCallResponse? osSys;
  // Stores action output result for [Backend Call - API (BrannchDet)] action in Punch widget.
  ApiCallResponse? branchDet;
  // Stores action output result for [Backend Call - API (SecurityDetails)] action in DashTextField widget.
  ApiCallResponse? securitydetails;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (securityPunchPost)] action in Button widget.
  ApiCallResponse? postpunch;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
