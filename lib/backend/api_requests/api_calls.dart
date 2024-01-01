import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SystemInfo Group Code

class SystemInfoGroup {
  static String baseUrl = 'http://localhost:8080/values';
  static Map<String, String> headers = {};
  static BatteryAPICall batteryAPICall = BatteryAPICall();
  static MacIDCall macIDCall = MacIDCall();
  static HostnameCall hostnameCall = HostnameCall();
  static IPAddressCall iPAddressCall = IPAddressCall();
  static OSInstallationDateCall oSInstallationDateCall =
      OSInstallationDateCall();
}

class BatteryAPICall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'BatteryAPI',
      apiUrl: '${SystemInfoGroup.baseUrl}/GetBatteryStatus',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic battery(dynamic response) => getJsonField(
        response,
        r'''$.Battery''',
      );
}

class MacIDCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'MacID',
      apiUrl: '${SystemInfoGroup.baseUrl}/getMacID',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic macID(dynamic response) => getJsonField(
        response,
        r'''$.Macid''',
      );
}

class HostnameCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Hostname',
      apiUrl: '${SystemInfoGroup.baseUrl}/getHostname',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic hostname(dynamic response) => getJsonField(
        response,
        r'''$.Host''',
      );
}

class IPAddressCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'IPAddress',
      apiUrl: '${SystemInfoGroup.baseUrl}/Ipaddress',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic ipaddress(dynamic response) => getJsonField(
        response,
        r'''$.IpAddr''',
      );
}

class OSInstallationDateCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'OS Installation date',
      apiUrl: '${SystemInfoGroup.baseUrl}/getOsInstalldate',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic osInstdate(dynamic response) => getJsonField(
        response,
        r'''$.Osinst''',
      );
}

/// End SystemInfo Group Code

class SystemValidationMacCall {
  static Future<ApiCallResponse> call({
    String? macaddress = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SystemValidationMac',
      apiUrl:
          'https://uatapp.manappuram.net/PunchApi/api/helper/HostNameCheck/${macaddress}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.count''',
      );
  static dynamic flag(dynamic response) => getJsonField(
        response,
        r'''$.flag''',
      );
}

class BrannchDetCall {
  static Future<ApiCallResponse> call({
    String? speci1 = '1',
    String? speci2 = '0',
    String? empID = '0',
    String? hostname = '',
    String? macId = '',
    String? fromTime = '12:00:00 AM',
    String? toTime = '2:00:00 AM',
    String? flag = 'FLTRGETBRANCHKEY',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BrannchDet',
      apiUrl:
          'https://uatapp.manappuram.net/PortalApi/api/portal/GetPortalDetails/${flag}/${speci1}/${speci2}/${empID}/${hostname}/${macId}/${fromTime}/${toTime}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic branchID(dynamic response) => getJsonField(
        response,
        r'''$.BRANCH_ID''',
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.BRANCH_NAME''',
      );
}

class SecurityDetailsCall {
  static Future<ApiCallResponse> call({
    String? flag = '',
    String? pagevalue = '',
    String? paravalue = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SecurityDetails',
      apiUrl:
          'https://uatapp.manappuram.net/SecurityPunchApi/api/SecPunch/GetSecurityData/${flag}/${pagevalue}/${paravalue}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic secname(dynamic response) => getJsonField(
        response,
        r'''$.SecPunchData[:].SEC_NAME''',
      );
  static dynamic sectype(dynamic response) => getJsonField(
        response,
        r'''$.SecPunchData[:].SECTYPE''',
      );
  static dynamic secId(dynamic response) => getJsonField(
        response,
        r'''$.SecPunchData[:].GUN_STATUS''',
      );
  static dynamic msg(dynamic response) => getJsonField(
        response,
        r'''$.SecPunchData[:].MM''',
      );
}

class SecurityPunchPostCall {
  static Future<ApiCallResponse> call({
    String? pIndata = '',
    String? pFlag = '',
    String? secCode = '',
    String? secPhoto = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_indata": "${pIndata}",
  "p_flag": "${pFlag}",
  "secCode": "${secCode}",
  "secPhoto": "${secPhoto}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'securityPunchPost',
      apiUrl:
          'https://uatapp.manappuram.net/SecurityPunchApi/api/SecPunch/PostSecurityData',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic msg(dynamic response) => getJsonField(
        response,
        r'''$.SecPunchData[:].MSG''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
