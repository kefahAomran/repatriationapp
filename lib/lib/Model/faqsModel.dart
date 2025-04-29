/// id : 1
/// note : null
/// ordr : 1
/// question : "How do I submit a request for assistance?"
/// answer : "To submit a request for assistance, log in to your account, navigate to the 'Services' section, and select 'New Request'. Fill out the required form with your information and submit. You will receive a confirmation number that you can use to track your request status."
/// ennabled : null

class FaqsModel {
  FaqsModel({
      num? id, 
      dynamic note, 
      num? ordr, 
      String? question, 
      String? answer, 
      dynamic ennabled,}){
    _id = id;
    _note = note;
    _ordr = ordr;
    _question = question;
    _answer = answer;
    _ennabled = ennabled;
}

  FaqsModel.fromJson(dynamic json) {
    _id = json['id'];
    _note = json['note'];
    _ordr = json['ordr'];
    _question = json['question'];
    _answer = json['answer'];
    _ennabled = json['ennabled'];
  }
  num? _id;
  dynamic _note;
  num? _ordr;
  String? _question;
  String? _answer;
  dynamic _ennabled;
FaqsModel copyWith({  num? id,
  dynamic note,
  num? ordr,
  String? question,
  String? answer,
  dynamic ennabled,
}) => FaqsModel(  id: id ?? _id,
  note: note ?? _note,
  ordr: ordr ?? _ordr,
  question: question ?? _question,
  answer: answer ?? _answer,
  ennabled: ennabled ?? _ennabled,
);
  num? get id => _id;
  dynamic get note => _note;
  num? get ordr => _ordr;
  String? get question => _question;
  String? get answer => _answer;
  dynamic get ennabled => _ennabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['note'] = _note;
    map['ordr'] = _ordr;
    map['question'] = _question;
    map['answer'] = _answer;
    map['ennabled'] = _ennabled;
    return map;
  }

}