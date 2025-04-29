 
import 'configrationModel.dart';

class FamilyModel {
  FamilyModel({
      Data? data, 
      String? status, 
      num? code, 
      String? message, 
      bool? success, 
      String? declaringClass,}){
    _data = data;
    _status = status;
    _code = code;
    _message = message;
    _success = success;
    _declaringClass = declaringClass;
}

  FamilyModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
    _success = json['success'];
    _declaringClass = json['declaringClass'];
  }
  Data? _data;
  String? _status;
  num? _code;
  String? _message;
  bool? _success;
  String? _declaringClass;
FamilyModel copyWith({  Data? data,
  String? status,
  num? code,
  String? message,
  bool? success,
  String? declaringClass,
}) => FamilyModel(  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
  message: message ?? _message,
  success: success ?? _success,
  declaringClass: declaringClass ?? _declaringClass,
);
  Data? get data => _data;
  String? get status => _status;
  num? get code => _code;
  String? get message => _message;
  bool? get success => _success;
  String? get declaringClass => _declaringClass;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['code'] = _code;
    map['message'] = _message;
    map['success'] = _success;
    map['declaringClass'] = _declaringClass;
    return map;
  }

}

/// id : 2
/// uid : "yaroub11"
/// country : {"code":1,"name":"Syrian Arab Republic","displayName":"Syrian Arab Republic"}
/// region : {"code":1,"name":"Damascus","displayName":"Damascus","countryCode":1}
/// zone : {"code":3,"name":"Al-Midan","displayName":"Al-Midan","regionCode":1}
/// residenceType : {"code":1,"name":"Owned","displayName":"Owned"}
/// address : "F8V7+W62، دمشق،، Damascus, Syria"
/// gpsX : 33.4950017
/// gpsY : 36.3129517
/// originalCountry : {"code":1,"name":"Syrian Arab Republic","displayName":"Syrian Arab Republic"}
/// originalRegion : {"code":1,"name":"Damascus","displayName":"Damascus","countryCode":1}
/// originalZone : {"code":1,"name":"Rukn al-Din","displayName":"Rukn al-Din","regionCode":1}
/// originalAddress : null
/// originalGpsX : 33.5227884001791
/// originalGpsY : 36.27858750522137
/// exitDate : "2025-04-20"
/// exitType : {"code":4,"name":"R1","displayName":"R1"}
/// isChecked : null
/// checkDate : null
/// mobileNo : "+963931835857"
/// charity : null
/// familyCount : 2
/// headFullName : "yaroup adnan alhamwi"
/// headId : 2

class Data {
  Data({
      num? id, 
      String? uid, 
      Country? country, 
      Region? region, 
      Zone? zone, 
      Residencetype? residenceType, 
      String? address, 
      num? gpsX, 
      num? gpsY, 
      Country? originalCountry, 
      Region? originalRegion, 
      Zone? originalZone, 
      dynamic originalAddress, 
      num? originalGpsX, 
      num? originalGpsY, 
      String? exitDate, 
      Exittype? exitType, 
      dynamic isChecked, 
      dynamic checkDate, 
      String? mobileNo, 
      dynamic charity, 
      num? familyCount, 
      String? headFullName, 
      num? headId,}){
    _id = id;
    _uid = uid;
    _country = country;
    _region = region;
    _zone = zone;
    _residenceType = residenceType;
    _address = address;
    _gpsX = gpsX;
    _gpsY = gpsY;
    _originalCountry = originalCountry;
    _originalRegion = originalRegion;
    _originalZone = originalZone;
    _originalAddress = originalAddress;
    _originalGpsX = originalGpsX;
    _originalGpsY = originalGpsY;
    _exitDate = exitDate;
    _exitType = exitType;
    _isChecked = isChecked;
    _checkDate = checkDate;
    _mobileNo = mobileNo;
    _charity = charity;
    _familyCount = familyCount;
    _headFullName = headFullName;
    _headId = headId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _uid = json['uid'];
    _country = json['country'] != null ? Country.fromJson(json['country']) : null;
    _region = json['region'] != null ? Region.fromJson(json['region']) : null;
    _zone = json['zone'] != null ? Zone.fromJson(json['zone']) : null;
    _residenceType = json['residenceType'] != null ? Residencetype.fromJson(json['residenceType']) : null;
    _address = json['address'];
    _gpsX = json['gpsX'];
    _gpsY = json['gpsY'];
    _originalCountry = json['originalCountry'] != null ? Country.fromJson(json['originalCountry']) : null;
    _originalRegion = json['originalRegion'] != null ? Region.fromJson(json['originalRegion']) : null;
    _originalZone = json['originalZone'] != null ? Zone.fromJson(json['originalZone']) : null;
    _originalAddress = json['originalAddress'];
    _originalGpsX = json['originalGpsX'];
    _originalGpsY = json['originalGpsY'];
    _exitDate = json['exitDate'];
    _exitType = json['exitType'] != null ? Exittype.fromJson(json['exitType']) : null;
    _isChecked = json['isChecked'];
    _checkDate = json['checkDate'];
    _mobileNo = json['mobileNo'];
    _charity = json['charity'];
    _familyCount = json['familyCount'];
    _headFullName = json['headFullName'];
    _headId = json['headId'];
  }
  num? _id;
  String? _uid;
  Country? _country;
  Region? _region;
  Zone? _zone;
  Residencetype? _residenceType;
  String? _address;
  num? _gpsX;
  num? _gpsY;
  Country? _originalCountry;
  Region? _originalRegion;
  Zone? _originalZone;
  dynamic _originalAddress;
  num? _originalGpsX;
  num? _originalGpsY;
  String? _exitDate;
  Exittype? _exitType;
  dynamic _isChecked;
  dynamic _checkDate;
  String? _mobileNo;
  dynamic _charity;
  num? _familyCount;
  String? _headFullName;
  num? _headId;
Data copyWith({  num? id,
  String? uid,
  Country? country,
  Region? region,
  Zone? zone,
  Residencetype? residenceType,
  String? address,
  num? gpsX,
  num? gpsY,
  Country? originalCountry,
  Region? originalRegion,
  Zone? originalZone,
  dynamic originalAddress,
  num? originalGpsX,
  num? originalGpsY,
  String? exitDate,
  Exittype? exitType,
  dynamic isChecked,
  dynamic checkDate,
  String? mobileNo,
  dynamic charity,
  num? familyCount,
  String? headFullName,
  num? headId,
}) => Data(  id: id ?? _id,
  uid: uid ?? _uid,
  country: country ?? _country,
  region: region ?? _region,
  zone: zone ?? _zone,
  residenceType: residenceType ?? _residenceType,
  address: address ?? _address,
  gpsX: gpsX ?? _gpsX,
  gpsY: gpsY ?? _gpsY,
  originalCountry: originalCountry ?? _originalCountry,
  originalRegion: originalRegion ?? _originalRegion,
  originalZone: originalZone ?? _originalZone,
  originalAddress: originalAddress ?? _originalAddress,
  originalGpsX: originalGpsX ?? _originalGpsX,
  originalGpsY: originalGpsY ?? _originalGpsY,
  exitDate: exitDate ?? _exitDate,
  exitType: exitType ?? _exitType,
  isChecked: isChecked ?? _isChecked,
  checkDate: checkDate ?? _checkDate,
  mobileNo: mobileNo ?? _mobileNo,
  charity: charity ?? _charity,
  familyCount: familyCount ?? _familyCount,
  headFullName: headFullName ?? _headFullName,
  headId: headId ?? _headId,
);
  num? get id => _id;
  String? get uid => _uid;
  Country? get country => _country;
  Region? get region => _region;
  Zone? get zone => _zone;
  Residencetype? get residenceType => _residenceType;
  String? get address => _address;
  num? get gpsX => _gpsX;
  num? get gpsY => _gpsY;
  Country? get originalCountry => _originalCountry;
  Region? get originalRegion => _originalRegion;
  Zone? get originalZone => _originalZone;
  dynamic get originalAddress => _originalAddress;
  num? get originalGpsX => _originalGpsX;
  num? get originalGpsY => _originalGpsY;
  String? get exitDate => _exitDate;
  Exittype? get exitType => _exitType;
  dynamic get isChecked => _isChecked;
  dynamic get checkDate => _checkDate;
  String? get mobileNo => _mobileNo;
  dynamic get charity => _charity;
  num? get familyCount => _familyCount;
  String? get headFullName => _headFullName;
  num? get headId => _headId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uid'] = _uid;
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    if (_region != null) {
      map['region'] = _region?.toJson();
    }
    if (_zone != null) {
      map['zone'] = _zone?.toJson();
    }
    if (_residenceType != null) {
      map['residenceType'] = _residenceType?.toJson();
    }
    map['address'] = _address;
    map['gpsX'] = _gpsX;
    map['gpsY'] = _gpsY;
    if (_originalCountry != null) {
      map['originalCountry'] = _originalCountry?.toJson();
    }
    if (_originalRegion != null) {
      map['originalRegion'] = _originalRegion?.toJson();
    }
    if (_originalZone != null) {
      map['originalZone'] = _originalZone?.toJson();
    }
    map['originalAddress'] = _originalAddress;
    map['originalGpsX'] = _originalGpsX;
    map['originalGpsY'] = _originalGpsY;
    map['exitDate'] = _exitDate;
    if (_exitType != null) {
      map['exitType'] = _exitType?.toJson();
    }
    map['isChecked'] = _isChecked;
    map['checkDate'] = _checkDate;
    map['mobileNo'] = _mobileNo;
    map['charity'] = _charity;
    map['familyCount'] = _familyCount;
    map['headFullName'] = _headFullName;
    map['headId'] = _headId;
    return map;
  }

}
 
 