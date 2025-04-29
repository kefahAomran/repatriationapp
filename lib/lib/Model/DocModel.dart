
import 'configrationModel.dart';

class DocModel {
  DocModel({
      num? id, 
      String? dat, 
      String? desc, 
      num? ordr, 
      String? fileName, 
      String? ext, 
      String? mediaType, 
      String? imageB64, 
      num? familyMemberId,
    Doctype? zdoctypId,}){
    _id = id;
    _dat = dat;
    _desc = desc;
    _ordr = ordr;
    _fileName = fileName;
    _ext = ext;
    _mediaType = mediaType;
    _imageB64 = imageB64;
    _familyMemberId = familyMemberId;
    _zdoctypId = zdoctypId;
}

  DocModel.fromJson(dynamic json) {
    _id = json['id'];
    _dat = json['dat'];
    _desc = json['description'];
    _ordr = json['ordr'];
    _fileName = json['fileName'];
    _ext = json['ext'];
    _mediaType = json['mediaType'];
    _imageB64 = json['imageB64'];
    _familyMemberId = json['familyMemberId'];
    _zdoctypId = json['zdoctypId'] != null ? Doctype.fromJson(json['zdoctypId']) : null;
  }
  num? _id;
  String? _dat;
  String? _desc;
  num? _ordr;
  String? _fileName;
  String? _ext;
  String? _mediaType;
  String? _imageB64;
  num? _familyMemberId;
  Doctype? _zdoctypId;
DocModel copyWith({  num? id,
  String? dat,
  String? desc,
  num? ordr,
  String? fileName,
  String? ext,
  String? mediaType,
  String? imageB64,
  num? familyMemberId,
  Doctype? zdoctypId,
}) => DocModel(  id: id ?? _id,
  dat: dat ?? _dat,
  desc: desc ?? _desc,
  ordr: ordr ?? _ordr,
  fileName: fileName ?? _fileName,
  ext: ext ?? _ext,
  mediaType: mediaType ?? _mediaType,
  imageB64: imageB64 ?? _imageB64,
  familyMemberId: familyMemberId ?? _familyMemberId,
  zdoctypId: zdoctypId ?? _zdoctypId,
);
  num? get id => _id;
  String? get dat => _dat;
  String? get desc => _desc;
  num? get ordr => _ordr;
  String? get fileName => _fileName;
  String? get ext => _ext;
  String? get mediaType => _mediaType;
  String? get imageB64 => _imageB64;
  num? get familyMemberId => _familyMemberId;
  Doctype? get zdoctypId => _zdoctypId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['dat'] = _dat;
    map['description'] = _desc;
    map['ordr'] = _ordr;
    map['fileName'] = _fileName;
    map['ext'] = _ext;
    map['mediaType'] = _mediaType;
    map['imageB64'] = _imageB64;
    map['familyMemberId'] = _familyMemberId;
    if (_zdoctypId != null) {
      map['zdoctypId'] = _zdoctypId?.toJson();
    }
    return map;
  }

}
