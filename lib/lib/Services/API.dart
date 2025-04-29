import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Controller/HomeBind.dart';
import '../Model/familyMemberModel.dart';
import '../View/authentication/login_screen.dart';
import '../View/home/Request/addRequest.dart';

// import 'package:repatriationapp/Controller/HomeBind.dart';
// import 'package:repatriationapp/Model/familyMemberModel.dart';
// import 'package:repatriationapp/View/authentication/login_screen.dart';
// import 'package:repatriationapp/View/home/Request/addRequest.dart';

import '../Component/general_response.dart';
import '../Controller/authentication_manager.dart';
import '../Model/DocModel.dart';
import '../Model/ErrorResp.dart';
import '../Model/FamilyModel.dart';
import '../Model/SignInModel.dart';
import '../Model/SignupResp.dart';
import '../Model/configrationModel.dart';
import '../Model/faqsModel.dart';
import '../Model/news.dart';
import '../Model/requestModel.dart';

class API {
  static AuthenticationManager authManager = Get.find();
  static const baseURL3 = "https://icpc-be.rimaz.sy";

  static const _baseURL = "$baseURL3/auth/api/user";
  static const _baseURL2 = "$baseURL3/civilians/api/v2"; //puplic

  static Future<List> login({
    required String email,
    required String password,
  }) async {
    var headers = {
      'Authorization': 'Basic bW9iaWxlLWNsaWVudDpzZWNyZXQ=',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'JSESSIONID=CD0FE2432F099F8ED7CA2B8375AF0C60',
    };
    var request = http.Request(
      'POST',
      Uri.parse('$baseURL3/auth/oauth2/token'),
    );
    request.bodyFields = {
      'grant_type': 'password',
      'username': email,
      'password': password,
      'client_id': 'mobile-client',
      'client_secret': 'secret',
    };
    request.headers.addAll(headers);
    print(request.body);
    print(request.headers);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 || response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      var signInModel = SignInModel.fromJson(jsonDecode(json));
      Token = signInModel.accessToken!;
      return [signInModel.accessToken!];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> registerCivilian({
    required String username,
    required String mobile,
    required String email,
    required String first,
    required String last,
    required String password,
    required String address,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('$_baseURL/register-civilian'),
    );
    request.body = json.encode({
      "username": username,
      "phoneNumber": mobile,
      "password": password,
      "email": email,
      "firstName": first,
      "lastName": last,
      "address": address,
    });

    request.headers.addAll(headers);
    print(request.body);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();

      var signupResp = SignupResp.fromJson(jsonDecode(json));
      return [signupResp.data];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> verify({
    required String email,
    required String code,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PUT', Uri.parse('$_baseURL/verify'));
    request.body = json.encode({
      "username": email,
      "verificationCode": code.toString(),
    });
    print(request.body);
    print(request);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();
      print(json);
      var activate = SignupResp.fromJson(jsonDecode(json));
      return [activate.status, activate.data];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  /*-------------------------------------------------------------*/

  static Future<List> news() async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
      'Accept-Language': languagee,
    };
    var request = http.Request('GET', Uri.parse('$_baseURL2/app/news'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    ////print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();
      var temp = jsonDecode(json);
      List<News> cities = [];
      for (var element in temp) {
        cities.add(News.fromJson(element));
      }
      return [cities, "activate.data"];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> configration() async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
      'Accept-Language': languagee,
    };
    var request = http.Request('GET', Uri.parse('$_baseURL2/app/context'));

    request.headers.addAll(headers);
    print(headers);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();
      var activate = ConfigrationModel.fromJson(jsonDecode(json));
      familyId = activate.data?.familyId;
      return [
        activate.data!.codingLists,
        activate.data?.userInfo,
        activate.status,
      ];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  /*--------------------------Rquest -------------------*/
  static Future<List> getRequest() async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
      'Accept-Language': languagee,
    };
    var request = http.Request('GET', Uri.parse('$_baseURL2/family/ask'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();
      var temp = jsonDecode(json);
      List<RequestModel> cities = [];
      for (var element in temp) {
        cities.add(RequestModel.fromJson(element));
      }

      return [cities, "activate.data"];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> addRequest({
    required String notes,
    required String needs,
  }) async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse('$_baseURL2/family/ask'));
    request.body = json.encode({
      "notes": notes,
      "requestDate": DateFormat(
        'yyyy-MM-dd',
      ).format(DateTime.parse(DateTime.now().toString())),
      "familyId": familyId,
      "need": {"code": needs},
    });

    request.headers.addAll(headers);
    print(headers);
    print(request);
    print(request.body);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      return ["Done", ""];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> editRequest({
    required String notes,
    required String needs,
    required String id,
  }) async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
    };
    var request = http.Request('PUT', Uri.parse('$_baseURL2/family/ask/$id'));
    request.body = json.encode({
      "notes": notes,
      "requestDate": DateFormat(
        'yyyy-MM-dd',
      ).format(DateTime.parse(DateTime.now().toString())),
      "familyId": familyId,
      "need": {"code": needs},
    });

    request.headers.addAll(headers);
    print(headers);
    print(request);
    print(request.body);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      return ["Done", ""];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> deleteRequest(num? id) async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
      'Accept-Language': languagee,
    };

    var request = http.Request(
      'DELETE',
      Uri.parse('$_baseURL2/family/ask/$id'),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();

      return ["Done", json];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  /*--------------------------Document -------------------*/
  static Future<List> getDocument() async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
      'Accept-Language': languagee,
    };
    var request = http.Request('GET', Uri.parse('$_baseURL2/documents'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();
      print(json);
      var temp = jsonDecode(json);
      List<DocModel> cities = [];
      for (var element in temp) {
        cities.add(DocModel.fromJson(element));
      }

      return [cities, "activate.data"];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> addDocument({
    required num zdoctypId,
    required num familyMemberId,
    required String imageB64,
    required String fileName,
    required String mediaType,
    required String ext,
    required String desc,
  }) async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse('$_baseURL2/documents'));
    request.body = json.encode({
      "dat": DateFormat(
        'yyyy-MM-dd',
      ).format(DateTime.parse(DateTime.now().toString())),
      "description": desc,
      "fileName": fileName,
      "ext": ext,
      "mediaType": mediaType,
      "familyMemberId": familyMemberId,
      "zdoctypId": {"code": zdoctypId},
      "imageB64": imageB64,
    });

    request.headers.addAll(headers);
    print(headers);
    print(request);
    print(request.body);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      return ["Done", ""];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> editDocument({
    required num id,
    required num zdoctypId,
    required num familyMemberId,
    required String imageB64,
    required String fileName,
    required String mediaType,
    required String ext,
    required String desc,
  }) async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
    };
    var request = http.Request('PUT', Uri.parse('$_baseURL2/documents/$id'));
    request.body = json.encode({
      "dat": DateFormat(
        'yyyy-MM-dd',
      ).format(DateTime.parse(DateTime.now().toString())),
      "description": desc,

      "fileName": fileName,
      "ext": ext,
      "mediaType": mediaType,
      "imageB64": imageB64,
      "familyMemberId": familyMemberId,
      "zdoctypId": {"code": zdoctypId},
    });

    request.headers.addAll(headers);
    print(headers);
    print(request);
    print(request.body);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      return ["Done", ""];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> deleteDocument(num? id) async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
      'Accept-Language': languagee,
    };

    var request = http.Request('DELETE', Uri.parse('$_baseURL2/documents/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();

      return ["Done", json];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  /*--------------------------FamilyMember -------------------*/
  static Future<List> getFamilyMember() async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
      'Accept-Language': languagee,
    };
    var request = http.Request('GET', Uri.parse('$_baseURL2/members'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();
      var temp = jsonDecode(json);
      List<FamilyMemberModel> cities = [];
      for (var element in temp) {
        cities.add(FamilyMemberModel.fromJson(element));
      }

      return [cities, "activate.data"];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> addFamilyMember({
    required num health,
    required num diplom,
    required num living,
    required num job,
    required num marriage,
    required num familyId,
    required num relative,
    required String motherName,
    required String nnbr,
    required String birthDate,
    required String gender,
    required String firstName,
    required String fatherName,
    required String lastName,
  }) async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse('$_baseURL2/members'));
    request.body = json.encode({
      "familyId": familyId,
      "firstName": firstName,
      "fatherName": fatherName,
      "lastName": lastName,
      "motherName": motherName,
      "nnbr": nnbr,
      "birthDate": birthDate,
      "gender": gender,
      "relative": {"code": relative},
      "living": {"code": living},
      "marriage": {"code": marriage},
      "job": {"code": job},
      "diplom": {"code": diplom},
      "health": {"code": health},
    });

    request.headers.addAll(headers);
    print(headers);
    print(request);
    print(request.body);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      return ["Done", ""];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> editFamilyMember({
    required num id,
    required num health,
    required num diplom,
    required num living,
    required num job,
    required num marriage,
    required num familyId,
    required num relative,
    required String motherName,
    required String nnbr,
    required String birthDate,
    required String gender,
    required String firstName,
    required String fatherName,
    required String lastName,
  }) async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
    };
    var request = http.Request('PUT', Uri.parse('$_baseURL2/members/$id'));
    request.body = json.encode({
      "familyId": familyId,
      "firstName": firstName,
      "fatherName": fatherName,
      "lastName": lastName,
      "motherName": motherName,
      "nnbr": nnbr,
      "birthDate": birthDate,
      "gender": gender,
      "relative": {"code": relative},
      "living": {"code": living},
      "marriage": {"code": marriage},
      "job": {"code": job},
      "diplom": {"code": diplom},
      "health": {"code": health},
    });

    request.headers.addAll(headers);
    print(headers);
    print(request);
    print(request.body);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      return ["Done", ""];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> deleteFamilyMember(num? id) async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
      'Accept-Language': languagee,
    };

    var request = http.Request('DELETE', Uri.parse('$_baseURL2/members/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();

      return ["Done", json];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  /*----------------Family-------------------*/
  static Future<List> getFamily() async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
      'Accept-Language': languagee,
    };
    var request = http.Request('GET', Uri.parse('$_baseURL2/families/family'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    ////print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();
      var temp = FamilyModel.fromJson(jsonDecode(json));

      return [temp.data, "activate.data"];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> editFamily({
    required num? originalCountry,
    required double gpsX,
    required double gpsY,
    required double? originalGpsX,
    required double? originalGpsY,

    required num? originalRegion,
    required num? originalZone,
    required String address,
    required String uid,
    required String originalAddress,
    required bool isChecked,
    required String exitDate,
    required String mobileNo,
    required num exitType,
    required num country,
    required num region,
    required num zone,
    required num residenceType,
    required num id,
  }) async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
    };
    var request = http.Request('PUT', Uri.parse('$_baseURL2/families/$id'));
    request.body = json.encode({
      "id": id,
      "uid": uid,
      "country": {"code": country},
      "region": {"code": region},
      "zone": {"code": zone},
      "residenceType": {"code": residenceType},
      "address": address,
      "gpsX": gpsX,
      "gpsY": gpsY,
      "originalCountry":
          originalCountry == null ? null : {"code": originalCountry},
      "originalRegion":
          originalRegion == null ? null : {"code": originalRegion},
      "originalZone": originalZone == null ? null : {"code": originalZone},
      "originalAddress": originalAddress,
      "originalGpsX": originalGpsX,
      "originalGpsY": originalGpsY,
      "exitDate": exitDate,
      "exitType": {"code": exitType},
      "isChecked": isChecked,

      "mobileNo": mobileNo,
    });

    request.headers.addAll(headers);
    print(headers);
    print(request);
    print(request.body);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      return ["Done", ""];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  /*----------------------FAQ----------------------*/

  static Future<List> faq() async {
    var headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type': 'application/json',
      'Accept-Language': languagee,
    };
    var request = http.Request('GET', Uri.parse('$_baseURL2/app/faqs'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      var json = await response.stream.bytesToString();
      var temp = jsonDecode(json);
      List<FaqsModel> cities = [];
      for (var element in temp) {
        cities.add(FaqsModel.fromJson(element));
      }
      return [cities, "activate.data"];
    } else {
      List listError = await checkk(response);
      return listError;
    }
  }

  static Future<List> checkk(http.StreamedResponse response) async {
    if (response.statusCode == 401) {
      Get.offAll(LoginScreen(), binding: HomeBind());
      Get.snackbar("Alert".tr, "Session has expired".tr);
    }
    var json = await response.stream.bytesToString();
    print(json);
    print(response.statusCode);
    var errorResp = ErrorResp.fromJson(jsonDecode(json));

    print(response.statusCode);

    return ["", errorResp.status, errorResp.declaringClass];
  }

  static const String _apiKey = "AIzaSyACoGetHYMeKadpkRMkuvGphEK1bdGu9wU";

  /// Fetch place information based on latitude and longitude
  static Future<String> getPlaceFromCoordinates(double lat, double lng) async {
    final String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$_apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data["status"] == "OK") {
          final results = data["results"];
          if (results.isNotEmpty) {
            return results[0]["formatted_address"];
          } else {
            return "";
          }
        } else {
          return "";
        }
      } else {
        return "";
      }
    } catch (e) {
      print(e);
      return "";
    }
  }
}
