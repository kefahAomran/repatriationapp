

import 'configrationModel.dart';

class FamilyMemberModel {
  FamilyMemberModel({
      num? id, 
      num? familyId, 
      String? firstName, 
      String? fatherName, 
      String? lastName, 
      String? motherName, 
      String? nnbr, 
      String? birthDate, 
      String? gender, 
      Relative? relative, 
      Living? living, 
      Marriage? marriage, 
      Job? job, 
      Diplom? diplom, 
      Health? health,}){
    _id = id;
    _familyId = familyId;
    _firstName = firstName;
    _fatherName = fatherName;
    _lastName = lastName;
    _motherName = motherName;
    _nnbr = nnbr;
    _birthDate = birthDate;
    _gender = gender;
    _relative = relative;
    _living = living;
    _marriage = marriage;
    _job = job;
    _diplom = diplom;
    _health = health;
}

  FamilyMemberModel.fromJson(dynamic json) {
    _id = json['id'];
    _familyId = json['familyId'];
    _firstName = json['firstName'];
    _fatherName = json['fatherName'];
    _lastName = json['lastName'];
    _motherName = json['motherName'];
    _nnbr = json['nnbr'];
    _birthDate = json['birthDate'];
    _gender = json['gender'];
    _relative = json['relative'] != null ? Relative.fromJson(json['relative']) : null;
    _living = json['living'] != null ? Living.fromJson(json['living']) : null;
    _marriage = json['marriage'] != null ? Marriage.fromJson(json['marriage']) : null;
    _job = json['job'] != null ? Job.fromJson(json['job']) : null;
    _diplom = json['diplom'] != null ? Diplom.fromJson(json['diplom']) : null;
    _health = json['health'] != null ? Health.fromJson(json['health']) : null;
  }
  num? _id;
  num? _familyId;
  String? _firstName;
  String? _fatherName;
  String? _lastName;
  String? _motherName;
  String? _nnbr;
  String? _birthDate;
  String? _gender;
  Relative? _relative;
  Living? _living;
  Marriage? _marriage;
  Job? _job;
  Diplom? _diplom;
  Health? _health;
FamilyMemberModel copyWith({  num? id,
  num? familyId,
  String? firstName,
  String? fatherName,
  String? lastName,
  String? motherName,
  String? nnbr,
  String? birthDate,
  String? gender,
  Relative? relative,
  Living? living,
  Marriage? marriage,
  Job? job,
  Diplom? diplom,
  Health? health,
}) => FamilyMemberModel(  id: id ?? _id,
  familyId: familyId ?? _familyId,
  firstName: firstName ?? _firstName,
  fatherName: fatherName ?? _fatherName,
  lastName: lastName ?? _lastName,
  motherName: motherName ?? _motherName,
  nnbr: nnbr ?? _nnbr,
  birthDate: birthDate ?? _birthDate,
  gender: gender ?? _gender,
  relative: relative ?? _relative,
  living: living ?? _living,
  marriage: marriage ?? _marriage,
  job: job ?? _job,
  diplom: diplom ?? _diplom,
  health: health ?? _health,
);
  num? get id => _id;
  num? get familyId => _familyId;
  String? get firstName => _firstName;
  String? get fatherName => _fatherName;
  String? get lastName => _lastName;
  String? get motherName => _motherName;
  String? get nnbr => _nnbr;
  String? get birthDate => _birthDate;
  String? get gender => _gender;
  Relative? get relative => _relative;
  Living? get living => _living;
  Marriage? get marriage => _marriage;
  Job? get job => _job;
  Diplom? get diplom => _diplom;
  Health? get health => _health;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['familyId'] = _familyId;
    map['firstName'] = _firstName;
    map['fatherName'] = _fatherName;
    map['lastName'] = _lastName;
    map['motherName'] = _motherName;
    map['nnbr'] = _nnbr;
    map['birthDate'] = _birthDate;
    map['gender'] = _gender;
    if (_relative != null) {
      map['relative'] = _relative?.toJson();
    }
    if (_living != null) {
      map['living'] = _living?.toJson();
    }
    if (_marriage != null) {
      map['marriage'] = _marriage?.toJson();
    }
    if (_job != null) {
      map['job'] = _job?.toJson();
    }
    if (_diplom != null) {
      map['diplom'] = _diplom?.toJson();
    }
    if (_health != null) {
      map['health'] = _health?.toJson();
    }
    return map;
  }

}









