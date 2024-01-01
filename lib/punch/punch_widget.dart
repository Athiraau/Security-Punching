import '/backend/api_requests/api_calls.dart';
import '/components/punched_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'punch_model.dart';
export 'punch_model.dart';

class PunchWidget extends StatefulWidget {
  const PunchWidget({Key? key}) : super(key: key);

  @override
  _PunchWidgetState createState() => _PunchWidgetState();
}

class _PunchWidgetState extends State<PunchWidget> {
  late PunchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PunchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.batteryCopyCopy = await SystemInfoGroup.batteryAPICall.call();
      if (SystemInfoGroup.batteryAPICall.battery(
            (_model.batteryCopyCopy?.jsonBody ?? ''),
          ) ==
          '1') {
        _model.macSys2 = await SystemInfoGroup.macIDCall.call();
        _model.hostSys2 = await SystemInfoGroup.hostnameCall.call();
        _model.iPSys2 = await SystemInfoGroup.iPAddressCall.call();
        _model.osSys2 = await SystemInfoGroup.oSInstallationDateCall.call();
        setState(() {
          FFAppState().macid = SystemInfoGroup.macIDCall
              .macID(
                (_model.macSys2?.jsonBody ?? ''),
              )
              .toString()
              .toString();
          FFAppState().hostname = SystemInfoGroup.hostnameCall
              .hostname(
                (_model.hostSys2?.jsonBody ?? ''),
              )
              .toString()
              .toString();
          FFAppState().ipaddress = SystemInfoGroup.iPAddressCall
              .ipaddress(
                (_model.iPSys2?.jsonBody ?? ''),
              )
              .toString()
              .toString();
          FFAppState().OSinstallDt = SystemInfoGroup.oSInstallationDateCall
              .osInstdate(
                (_model.osSys2?.jsonBody ?? ''),
              )
              .toString()
              .toString();
        });
      } else {
        _model.macSys = await SystemInfoGroup.macIDCall.call();
        _model.hostSys = await SystemInfoGroup.hostnameCall.call();
        _model.iPSys = await SystemInfoGroup.iPAddressCall.call();
        _model.osSys = await SystemInfoGroup.oSInstallationDateCall.call();
        setState(() {
          FFAppState().macid = valueOrDefault<String>(
            SystemInfoGroup.macIDCall
                .macID(
                  (_model.macSys?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            '0',
          );
          FFAppState().hostname = valueOrDefault<String>(
            SystemInfoGroup.hostnameCall
                .hostname(
                  (_model.hostSys?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            '0',
          );
          FFAppState().ipaddress = valueOrDefault<String>(
            SystemInfoGroup.iPAddressCall
                .ipaddress(
                  (_model.iPSys?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            '0',
          );
          FFAppState().OSinstallDt = valueOrDefault<String>(
            SystemInfoGroup.oSInstallationDateCall
                .osInstdate(
                  (_model.osSys?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            '0',
          );
        });
      }

      _model.branchDet = await BrannchDetCall.call(
        speci1: '1',
        speci2: '0',
        empID: '0',
        hostname: FFAppState().hostname,
        macId: FFAppState().macid,
        fromTime: '12:00:00 AM',
        toTime: '2:00:00 AM',
        flag: 'FLTRGETBRANCHKEY',
      );
      setState(() {
        FFAppState().branch = BrannchDetCall.branchName(
          (_model.branchDet?.jsonBody ?? ''),
        ).toString();
        FFAppState().brid = BrannchDetCall.branchID(
          (_model.branchDet?.jsonBody ?? ''),
        ).toString().toString();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF00403F), Color(0xFFFAF9F7)],
                      stops: [0.5, 0.5],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Container(
                            width: double.infinity,
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              90.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-0.50, 0.00),
                                      child: Text(
                                        'MANAPPURAM FINANCE LIMITED ',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Colors.white,
                                              fontSize: 30.0,
                                              letterSpacing: 5.0,
                                              fontWeight: FontWeight.w900,
                                              lineHeight: 1.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              45.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dateTimeFormat('d/M/y', getCurrentTimestamp),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                FFAppState().branch,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Container(
                                width: 200.0,
                                height: 60.0,
                                child: custom_widgets.Clock(
                                  width: 200.0,
                                  height: 60.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Divider(
                            height: 24.0,
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).lineColor,
                          ),
                        Divider(
                          thickness: 4.0,
                          indent: 90.0,
                          endIndent: 90.0,
                          color: Colors.white,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.7,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Text(
                                    'SECURITY PUNCHING',
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                          fontSize: 23.0,
                                          letterSpacing: 5.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      100.0, 40.0, 100.0, 50.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 10.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.45,
                                              decoration: BoxDecoration(
                                                color: Color(0xA5B2BEB5),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 4.0,
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.3,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.4,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xBDB2BEB5),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFF2EEEE),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x00B2BEB5),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              10.0,
                                                                              30.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.05,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  child: custom_widgets.DashTextFieldFirst(
                                                                                    width: double.infinity,
                                                                                    height: double.infinity,
                                                                                    obscureText: false,
                                                                                    hintText: ' Security Code',
                                                                                    labelText: ' ',
                                                                                    borderRadius: 0.0,
                                                                                    borderColor: Colors.transparent,
                                                                                    borderWidth: 0.0,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    isFilled: false,
                                                                                    textColor: Colors.black,
                                                                                    errorBorderColor: Colors.transparent,
                                                                                    lostFocusAction: () async {},
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              0.0,
                                                                              30.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.05,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                child: custom_widgets.DashTextField(
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  obscureText: true,
                                                                                  hintText: 'Password',
                                                                                  labelText: ' ',
                                                                                  borderRadius: 0.0,
                                                                                  borderColor: Colors.transparent,
                                                                                  borderWidth: 0.0,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  isFilled: false,
                                                                                  textColor: Colors.black,
                                                                                  errorBorderColor: Colors.transparent,
                                                                                  lostFocusAction: () async {
                                                                                    var _shouldSetState = false;
                                                                                    if ((FFAppState().lostFocusValue == null || FFAppState().lostFocusValue == '') || (FFAppState().lostFocusTextfieldValue == null || FFAppState().lostFocusTextfieldValue == '')) {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            content: Text('Please Fill all fields'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                    _model.securitydetails = await SecurityDetailsCall.call(
                                                                                      flag: 'GETSECURITYCNT',
                                                                                      pagevalue: '${FFAppState().lostFocusValue}~${FFAppState().lostFocusTextfieldValue}',
                                                                                      paravalue: '1',
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    if ((_model.securitydetails?.succeeded ?? true)) {
                                                                                      if (SecurityDetailsCall.msg(
                                                                                            (_model.securitydetails?.jsonBody ?? ''),
                                                                                          ).toString() ==
                                                                                          'Incorrect Password') {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              content: Text('Password and Empcode doesn\'t match'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                        setState(() {
                                                                                          FFAppState().lostFocusTextfieldValue = '';
                                                                                          FFAppState().lostFocusValue = '';
                                                                                        });
                                                                                        await actions.clearTextField();
                                                                                        await actions.clearTextFieldFirst();
                                                                                        setState(() {
                                                                                          FFAppState().SecurityName = '';
                                                                                          FFAppState().SecType = '';
                                                                                        });
                                                                                        if (_shouldSetState) setState(() {});
                                                                                        return;
                                                                                      }
                                                                                      setState(() {
                                                                                        FFAppState().SecurityName = SecurityDetailsCall.secname(
                                                                                          (_model.securitydetails?.jsonBody ?? ''),
                                                                                        ).toString();
                                                                                        FFAppState().SecType = SecurityDetailsCall.sectype(
                                                                                          (_model.securitydetails?.jsonBody ?? ''),
                                                                                        ).toString();
                                                                                      });
                                                                                    } else {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            content: Text('Database Error'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    if (_shouldSetState) setState(() {});
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              0.0,
                                                                              30.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.05,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      FFAppState().SecurityName,
                                                                                      'Security Name',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Colors.black,
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              0.0,
                                                                              30.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.05,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      FFAppState().SecType,
                                                                                      'Security Type',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Colors.black,
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              0.0,
                                                                              30.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.05,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                              child: FlutterFlowDropDown<String>(
                                                                                controller: _model.dropDownValueController ??= FormFieldController<String>(
                                                                                  _model.dropDownValue ??= '',
                                                                                ),
                                                                                options: List<String>.from([
                                                                                  '4',
                                                                                  '5'
                                                                                ]),
                                                                                optionLabels: [
                                                                                  'DAY',
                                                                                  'NIGHT'
                                                                                ],
                                                                                onChanged: (val) => setState(() => _model.dropDownValue = val),
                                                                                width: 270.0,
                                                                                height: 50.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Colors.black,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                                hintText: 'Select Shift',
                                                                                icon: Icon(
                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                elevation: 2.0,
                                                                                borderColor: Color(0x00FF5963),
                                                                                borderWidth: 2.0,
                                                                                borderRadius: 8.0,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                hidesUnderline: true,
                                                                                isSearchable: false,
                                                                                isMultiSelect: false,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.06,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.03,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00FFFFFF),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        var _shouldSetState =
                                                                            false;
                                                                        if ((FFAppState().lostFocusTextfieldValue == null || FFAppState().lostFocusTextfieldValue == '') ||
                                                                            (FFAppState().lostFocusValue == null ||
                                                                                FFAppState().lostFocusValue == '') ||
                                                                            (_model.dropDownValue == null || _model.dropDownValue == '')) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('Please Enter all Fields'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }
                                                                        await actions
                                                                            .clickPictureFromCamera();
                                                                        await Future.delayed(const Duration(
                                                                            milliseconds:
                                                                                1000));
                                                                        _model.postpunch =
                                                                            await SecurityPunchPostCall.call(
                                                                          pIndata:
                                                                              '${FFAppState().brid}~${FFAppState().lostFocusValue}~${_model.dropDownValue}',
                                                                          pFlag:
                                                                              'SECPUNCHDATA',
                                                                          secCode:
                                                                              FFAppState().lostFocusValue,
                                                                          secPhoto:
                                                                              FFAppState().LocalBase64Image,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        if ((_model.postpunch?.succeeded ??
                                                                            true)) {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().msg =
                                                                                SecurityPunchPostCall.msg(
                                                                              (_model.postpunch?.jsonBody ?? ''),
                                                                            ).toString();
                                                                          });
                                                                          await showAlignedDialog(
                                                                            barrierDismissible:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            isGlobal:
                                                                                true,
                                                                            avoidOverflow:
                                                                                true,
                                                                            targetAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            followerAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Material(
                                                                                color: Colors.transparent,
                                                                                child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: Container(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.45,
                                                                                    width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                    child: PunchedWidget(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('Punching Failed'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                          setState(
                                                                              () {
                                                                            FFAppState().lostFocusTextfieldValue =
                                                                                '';
                                                                            FFAppState().lostFocusValue =
                                                                                '';
                                                                            FFAppState().SecurityName =
                                                                                '';
                                                                            FFAppState().SecType =
                                                                                '';
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            _model.dropDownValueController?.reset();
                                                                          });
                                                                          await actions
                                                                              .clearTextField();
                                                                          await actions
                                                                              .clearTextFieldFirst();
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }

                                                                        await actions
                                                                            .cursor();
                                                                        setState(
                                                                            () {
                                                                          FFAppState().lostFocusTextfieldValue =
                                                                              '';
                                                                          FFAppState().lostFocusValue =
                                                                              '';
                                                                          FFAppState().SecurityName =
                                                                              '';
                                                                          FFAppState().SecType =
                                                                              '';
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .dropDownValueController
                                                                              ?.reset();
                                                                        });
                                                                        await actions
                                                                            .clearTextField();
                                                                        await actions
                                                                            .clearTextFieldFirst();
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                      },
                                                                      text:
                                                                          'ACCEPT',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0xFF006B69),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              fontSize: 13.0,
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFFA49DD5),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.06,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.03,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x00FFFFFF),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        await actions
                                                                            .cursor();
                                                                        setState(
                                                                            () {
                                                                          FFAppState().lostFocusValue =
                                                                              '';
                                                                          FFAppState().lostFocusTextfieldValue =
                                                                              '';
                                                                          FFAppState().SecurityName =
                                                                              '';
                                                                          FFAppState().SecType =
                                                                              '';
                                                                          FFAppState().LocalBase64Image =
                                                                              '';
                                                                        });
                                                                        await actions
                                                                            .clearTextField();
                                                                        await actions
                                                                            .clearTextFieldFirst();
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .dropDownValueController
                                                                              ?.reset();
                                                                        });
                                                                      },
                                                                      text:
                                                                          'REJECT',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0xFF006B69),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              fontSize: 13.0,
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.10, 0.00),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 3.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.3,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.4,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  border: Border.all(
                                                    color: Color(0xFFFAF9F7),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Container(
                                                    width: 300.0,
                                                    height: 300.0,
                                                    child: custom_widgets
                                                        .CameraWidget(
                                                      width: 300.0,
                                                      height: 300.0,
                                                      myTakePicture:
                                                          () async {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 4.0,
                                  indent: 90.0,
                                  endIndent: 90.0,
                                  color: Color(0xFF006B69),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Developed By ',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Trade Winds',
                                            color: Color(0xFF006B69),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      'IT Modernization Team',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Trade Winds',
                                            color: Color(0xFF006B69),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
