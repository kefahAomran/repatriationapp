/// id : 1
/// note : null
/// dat : "2023-05-15T10:30:00"
/// title : "New Assistance Programs Available"
/// content : "We are pleased to announce several new assistance programs now available to eligible families. These include enhanced support for education costs, expanded healthcare services, and additional home repair options. Visit the Programs section of our website or application to learn more about eligibility requirements and how to apply. Staff are available to answer questions during regular office hours Monday through Friday."
/// imageB64 : null
/// ennabled : null

class News {
  News({
      num? id, 
      dynamic note, 
      String? dat, 
      String? title, 
      String? content, 
      dynamic imageB64, 
      dynamic ennabled,}){
    _id = id;
    _note = note;
    _dat = dat;
    _title = title;
    _content = content;
    _imageB64 = imageB64;
    _ennabled = ennabled;
}

  News.fromJson(dynamic json) {
    _id = json['id'];
    _note = json['note'];
    _dat = json['dat'];
    _title = json['title'];
    _content = json['content'];
    _imageB64 = json['imageB64'];
    _ennabled = json['ennabled'];
  }
  num? _id;
  dynamic _note;
  String? _dat;
  String? _title;
  String? _content;
  dynamic _imageB64;
  dynamic _ennabled;
News copyWith({  num? id,
  dynamic note,
  String? dat,
  String? title,
  String? content,
  dynamic imageB64,
  dynamic ennabled,
}) => News(  id: id ?? _id,
  note: note ?? _note,
  dat: dat ?? _dat,
  title: title ?? _title,
  content: content ?? _content,
  imageB64: imageB64 ?? _imageB64,
  ennabled: ennabled ?? _ennabled,
);
  num? get id => _id;
  dynamic get note => _note;
  String? get dat => _dat;
  String? get title => _title;
  String? get content => _content;
  dynamic get imageB64 => _imageB64;
  dynamic get ennabled => _ennabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['note'] = _note;
    map['dat'] = _dat;
    map['title'] = _title;
    map['content'] = _content;
    map['imageB64'] = _imageB64;
    map['ennabled'] = _ennabled;
    return map;
  }

}