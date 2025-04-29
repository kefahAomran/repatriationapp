
import 'configrationModel.dart';

class RequestModel {
  RequestModel({
      num? id, 
      dynamic familyId, 
      String? notes, 
      String? requestDate, 
      dynamic result, 
      dynamic resultDate, 
      Need? need,}){
    _id = id;
    _familyId = familyId;
    _notes = notes;
    _requestDate = requestDate;
    _result = result;
    _resultDate = resultDate;
    _need = need;
}

  RequestModel.fromJson(dynamic json) {
    _id = json['id'];
    _familyId = json['familyId'];
    _notes = json['notes'];
    _requestDate = json['requestDate'];
    _result = json['result'];
    _resultDate = json['resultDate'];
    _need = json['need'] != null ? Need.fromJson(json['need']) : null;
  }
  num? _id;
  dynamic _familyId;
  String? _notes;
  String? _requestDate;
  dynamic _result;
  dynamic _resultDate;
  Need? _need;
RequestModel copyWith({  num? id,
  dynamic familyId,
  String? notes,
  String? requestDate,
  dynamic result,
  dynamic resultDate,
  Need? need,
}) => RequestModel(  id: id ?? _id,
  familyId: familyId ?? _familyId,
  notes: notes ?? _notes,
  requestDate: requestDate ?? _requestDate,
  result: result ?? _result,
  resultDate: resultDate ?? _resultDate,
  need: need ?? _need,
);
  num? get id => _id;
  dynamic get familyId => _familyId;
  String? get notes => _notes;
  String? get requestDate => _requestDate;
  dynamic get result => _result;
  dynamic get resultDate => _resultDate;
  Need? get need => _need;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['familyId'] = _familyId;
    map['notes'] = _notes;
    map['requestDate'] = _requestDate;
    map['result'] = _result;
    map['resultDate'] = _resultDate;
    if (_need != null) {
      map['need'] = _need?.toJson();
    }
    return map;
  }

}
