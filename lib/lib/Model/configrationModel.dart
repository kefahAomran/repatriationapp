
class ConfigrationModel {
  ConfigrationModel({
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

  ConfigrationModel.fromJson(dynamic json) {
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
ConfigrationModel copyWith({  Data? data,
  String? status,
  num? code,
  String? message,
  bool? success,
  String? declaringClass,
}) => ConfigrationModel(  data: data ?? _data,
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

/// appVersion : "1.0.0"
/// familyId : 2
/// languages : [{"code":"ar","name":"العربية"},{"code":"en","name":"English"}]
/// selectedLanguage : {"code":"en","name":"English"}
/// userInfo : {"id":11,"username":"yaroub11","email":"yaroup@gmail.com","phoneNumber":"+963931835850","firstName":"yaroup","lastName":"alhamwi","address":"damas"}
/// codingLists : {"country":[{"code":1,"name":"Syrian Arab Republic","displayName":"Syrian Arab Republic"},{"code":2,"name":"Lebanese Republic","displayName":"Lebanese Republic"}],"living":[{"code":1,"name":"Present with Family","displayName":"Present with Family"},{"code":2,"name":"Expatriate","displayName":"Expatriate"},{"code":3,"name":"Missing","displayName":"Missing"},{"code":4,"name":"Deceased","displayName":"Deceased"},{"code":5,"name":"Detained","displayName":"Detained"},{"code":6,"name":"Deceased (killed)","displayName":"Deceased (killed)"}],"need":[{"code":1,"name":"Food Aid Request","displayName":"Food Aid Request"},{"code":2,"name":"Voluntary Return Request","displayName":"Voluntary Return Request"},{"code":3,"name":"Home Repair Request","displayName":"Home Repair Request"},{"code":4,"name":"Home Reconstruction","displayName":"Home Reconstruction"},{"code":5,"name":"Property Loss Compensation","displayName":"Property Loss Compensation"},{"code":6,"name":"Employment Acquisition","displayName":"Employment Acquisition"},{"code":7,"name":"Rehabilitation and Training","displayName":"Rehabilitation and Training"},{"code":8,"name":"Infrastructure Repair","displayName":"Infrastructure Repair"},{"code":9,"name":"Services Provision","displayName":"Services Provision"},{"code":10,"name":"Medical Assistance","displayName":"Medical Assistance"},{"code":11,"name":"University Grant Request","displayName":"University Grant Request"},{"code":12,"name":"School Grant Request","displayName":"School Grant Request"}],"craft":[{"code":1,"name":"Housekeeper","displayName":"Housekeeper"},{"code":2,"name":"Sales Representative","displayName":"Sales Representative"},{"code":4,"name":"Administrator","displayName":"Administrator"},{"code":5,"name":"Military","displayName":"Military"},{"code":6,"name":"Tailor","displayName":"Tailor"},{"code":7,"name":"Perfume Seller","displayName":"Perfume Seller"},{"code":8,"name":"Driver","displayName":"Driver"},{"code":9,"name":"Painter","displayName":"Painter"},{"code":10,"name":"Electrician","displayName":"Electrician"},{"code":11,"name":"Health Worker","displayName":"Health Worker"},{"code":12,"name":"Blacksmith","displayName":"Blacksmith"},{"code":13,"name":"Baker","displayName":"Baker"},{"code":14,"name":"Sports Trainer","displayName":"Sports Trainer"},{"code":15,"name":"Clothing","displayName":"Clothing"},{"code":16,"name":"Ironing Worker","displayName":"Ironing Worker"},{"code":17,"name":"Mobile Seller","displayName":"Mobile Seller"},{"code":18,"name":"Confectioner","displayName":"Confectioner"},{"code":19,"name":"Teacher","displayName":"Teacher"},{"code":20,"name":"Accountant","displayName":"Accountant"},{"code":21,"name":"Pilot","displayName":"Pilot"},{"code":22,"name":"Food Supplier","displayName":"Food Supplier"},{"code":23,"name":"Food Services Worker","displayName":"Food Services Worker"},{"code":24,"name":"Plumber","displayName":"Plumber"},{"code":25,"name":"Tile Worker","displayName":"Tile Worker"},{"code":26,"name":"Welder","displayName":"Welder"},{"code":27,"name":"Mechanic","displayName":"Mechanic"},{"code":28,"name":"Carpenter","displayName":"Carpenter"},{"code":29,"name":"Juice Shop Owner","displayName":"Juice Shop Owner"},{"code":30,"name":"Hookah Worker","displayName":"Hookah Worker"},{"code":31,"name":"Excavation Worker","displayName":"Excavation Worker"},{"code":32,"name":"Poultry Shop Owner","displayName":"Poultry Shop Owner"},{"code":33,"name":"Gardener","displayName":"Gardener"},{"code":34,"name":"Lawyer","displayName":"Lawyer"},{"code":35,"name":"Doctor","displayName":"Doctor"},{"code":36,"name":"Barber","displayName":"Barber"},{"code":37,"name":"Security Guard","displayName":"Security Guard"}],"health":[{"code":1,"name":"Healthy","displayName":"Healthy"},{"code":2,"name":"Autism","displayName":"Autism"},{"code":3,"name":"Mobility Disability","displayName":"Mobility Disability"},{"code":4,"name":"Visual Problems","displayName":"Visual Problems"},{"code":5,"name":"Speech Problems","displayName":"Speech Problems"},{"code":6,"name":"Mental Disability","displayName":"Mental Disability"},{"code":7,"name":"Hearing Problems","displayName":"Hearing Problems"},{"code":8,"name":"Cancer","displayName":"Cancer"},{"code":9,"name":"Diabetes","displayName":"Diabetes"},{"code":10,"name":"Kidney Disease","displayName":"Kidney Disease"},{"code":11,"name":"Psychological Problems","displayName":"Psychological Problems"},{"code":12,"name":"Pregnant","displayName":"Pregnant"},{"code":13,"name":"Disabled","displayName":"Disabled"},{"code":14,"name":"Psoriasis","displayName":"Psoriasis"},{"code":15,"name":"Thalassemia","displayName":"Thalassemia"},{"code":16,"name":"Hepatitis","displayName":"Hepatitis"}],"doctype":[{"code":1,"name":"Personal ID Card (Front)","displayName":"Personal ID Card (Front)"},{"code":2,"name":"Personal ID Card (Back)","displayName":"Personal ID Card (Back)"},{"code":3,"name":"Passport","displayName":"Passport"},{"code":4,"name":"Family Book","displayName":"Family Book"},{"code":5,"name":"Vehicle Driving License","displayName":"Vehicle Driving License"},{"code":6,"name":"Personal Photo","displayName":"Personal Photo"},{"code":7,"name":"Family Statement Copy","displayName":"Family Statement Copy"},{"code":8,"name":"Certified Copy of Latest Academic Certificate","displayName":"Certified Copy of Latest Academic Certificate"},{"code":9,"name":"Home Ownership Statement","displayName":"Home Ownership Statement"}],"exittype":[{"code":1,"name":"Displacement Due to Clashes","displayName":"Displacement Due to Clashes"},{"code":2,"name":"Displacement Due to Threats","displayName":"Displacement Due to Threats"},{"code":3,"name":"Forced Displacement","displayName":"Forced Displacement"},{"code":4,"name":"R1","displayName":"R1"},{"code":5,"name":"R2","displayName":"R2"}],"charity":[{"code":1,"name":"Displacement Due to Clashes","displayName":"Displacement Due to Clashes"}],"zone":[{"code":1,"name":"Rukn al-Din","displayName":"Rukn al-Din","regionCode":1},{"code":2,"name":"Kafr Sousa","displayName":"Kafr Sousa","regionCode":1},{"code":3,"name":"Al-Midan","displayName":"Al-Midan","regionCode":1},{"code":4,"name":"Al-Muhajirin","displayName":"Al-Muhajirin","regionCode":1},{"code":5,"name":"Al-Mazzeh","displayName":"Al-Mazzeh","regionCode":1},{"code":6,"name":"Barzeh","displayName":"Barzeh","regionCode":1},{"code":7,"name":"Sarouja","displayName":"Sarouja","regionCode":1},{"code":8,"name":"Al-Qanawat","displayName":"Al-Qanawat","regionCode":1}],"marriage":[{"code":1,"name":"Single","displayName":"Single"},{"code":2,"name":"Married","displayName":"Married"},{"code":3,"name":"Divorced","displayName":"Divorced"},{"code":4,"name":"Widowed","displayName":"Widowed"},{"code":5,"name":"Abandoned","displayName":"Abandoned"}],"donation":[{"code":1,"name":"Food Basket (WFP)","displayName":"Food Basket (WFP)"},{"code":2,"name":"Food Basket (ICRC)","displayName":"Food Basket (ICRC)"},{"code":3,"name":"Food Basket (IFRC)","displayName":"Food Basket (IFRC)"},{"code":4,"name":"UNHCR Small Basket","displayName":"UNHCR Small Basket"},{"code":5,"name":"UNHCR Large Basket","displayName":"UNHCR Large Basket"},{"code":6,"name":"Mattress","displayName":"Mattress"},{"code":7,"name":"Blanket","displayName":"Blanket"},{"code":8,"name":"Tent","displayName":"Tent"},{"code":9,"name":"Children Diapers","displayName":"Children Diapers"},{"code":10,"name":"Adult Diapers","displayName":"Adult Diapers"},{"code":11,"name":"Female Hygiene Products","displayName":"Female Hygiene Products"},{"code":12,"name":"Tarpaulin","displayName":"Tarpaulin"},{"code":13,"name":"Mat","displayName":"Mat"},{"code":14,"name":"Quilt","displayName":"Quilt"},{"code":15,"name":"Clothes","displayName":"Clothes"},{"code":16,"name":"Bed Sheet","displayName":"Bed Sheet"},{"code":17,"name":"Baby Milk","displayName":"Baby Milk"},{"code":18,"name":"University Grant","displayName":"University Grant"},{"code":19,"name":"School Grant","displayName":"School Grant"}],"job":[{"code":1,"name":"Private Sector Employee","displayName":"Private Sector Employee"},{"code":2,"name":"Government Employee","displayName":"Government Employee"},{"code":3,"name":"Job Seeker","displayName":"Job Seeker"},{"code":4,"name":"Dismissed from Government Job","displayName":"Dismissed from Government Job"},{"code":5,"name":"Retired","displayName":"Retired"},{"code":6,"name":"Unable to Work","displayName":"Unable to Work"}],"region":[{"code":1,"name":"Damascus","displayName":"Damascus","countryCode":1},{"code":2,"name":"Damascus Countryside","displayName":"Damascus Countryside","countryCode":1},{"code":3,"name":"As-Suwayda","displayName":"As-Suwayda","countryCode":1},{"code":4,"name":"Daraa","displayName":"Daraa","countryCode":1},{"code":5,"name":"Homs","displayName":"Homs","countryCode":1},{"code":6,"name":"Deir ez-Zor","displayName":"Deir ez-Zor","countryCode":1},{"code":7,"name":"Hama","displayName":"Hama","countryCode":1},{"code":8,"name":"Tartus","displayName":"Tartus","countryCode":1},{"code":9,"name":"Latakia","displayName":"Latakia","countryCode":1},{"code":10,"name":"Aleppo","displayName":"Aleppo","countryCode":1},{"code":11,"name":"Al-Hasakah","displayName":"Al-Hasakah","countryCode":1},{"code":12,"name":"Quneitra","displayName":"Quneitra","countryCode":1},{"code":13,"name":"Idlib","displayName":"Idlib","countryCode":1},{"code":14,"name":"Raqqa","displayName":"Raqqa","countryCode":1}],"diplom":[{"code":1,"name":"Illiterate","displayName":"Illiterate"},{"code":2,"name":"Literate","displayName":"Literate"},{"code":3,"name":"Basic Education","displayName":"Basic Education"},{"code":4,"name":"Vocational Education","displayName":"Vocational Education"},{"code":5,"name":"General Secondary","displayName":"General Secondary"},{"code":6,"name":"University Graduate","displayName":"University Graduate"},{"code":7,"name":"Higher Education","displayName":"Higher Education"}],"relative":[{"code":1,"name":"Family Head","displayName":"Family Head"},{"code":2,"name":"Husband/Wife","displayName":"Husband/Wife"},{"code":4,"name":"Son/Daughter","displayName":"Son/Daughter"},{"code":6,"name":"Father/Mother","displayName":"Father/Mother"},{"code":8,"name":"Brother/Sister","displayName":"Brother/Sister"},{"code":9,"name":"Companion","displayName":"Companion"}],"residencetype":[{"code":1,"name":"Owned","displayName":"Owned"},{"code":2,"name":"Rented","displayName":"Rented"},{"code":3,"name":"Shelter Center","displayName":"Shelter Center"},{"code":4,"name":"Hosted","displayName":"Hosted"}]}

class Data {
  Data({
      String? appVersion, 
      num? familyId, 
      List<Languages>? languages, 
      SelectedLanguage? selectedLanguage, 
      UserInfo? userInfo, 
      CodingLists? codingLists,}){
    _appVersion = appVersion;
    _familyId = familyId;
    _languages = languages;
    _selectedLanguage = selectedLanguage;
    _userInfo = userInfo;
    _codingLists = codingLists;
}

  Data.fromJson(dynamic json) {
    _appVersion = json['appVersion'];
    _familyId = json['familyId'];
    if (json['languages'] != null) {
      _languages = [];
      json['languages'].forEach((v) {
        _languages?.add(Languages.fromJson(v));
      });
    }
    _selectedLanguage = json['selectedLanguage'] != null ? SelectedLanguage.fromJson(json['selectedLanguage']) : null;
    _userInfo = json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
    _codingLists = json['codingLists'] != null ? CodingLists.fromJson(json['codingLists']) : null;
  }
  String? _appVersion;
  num? _familyId;
  List<Languages>? _languages;
  SelectedLanguage? _selectedLanguage;
  UserInfo? _userInfo;
  CodingLists? _codingLists;
Data copyWith({  String? appVersion,
  num? familyId,
  List<Languages>? languages,
  SelectedLanguage? selectedLanguage,
  UserInfo? userInfo,
  CodingLists? codingLists,
}) => Data(  appVersion: appVersion ?? _appVersion,
  familyId: familyId ?? _familyId,
  languages: languages ?? _languages,
  selectedLanguage: selectedLanguage ?? _selectedLanguage,
  userInfo: userInfo ?? _userInfo,
  codingLists: codingLists ?? _codingLists,
);
  String? get appVersion => _appVersion;
  num? get familyId => _familyId;
  List<Languages>? get languages => _languages;
  SelectedLanguage? get selectedLanguage => _selectedLanguage;
  UserInfo? get userInfo => _userInfo;
  CodingLists? get codingLists => _codingLists;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appVersion'] = _appVersion;
    map['familyId'] = _familyId;
    if (_languages != null) {
      map['languages'] = _languages?.map((v) => v.toJson()).toList();
    }
    if (_selectedLanguage != null) {
      map['selectedLanguage'] = _selectedLanguage?.toJson();
    }
    if (_userInfo != null) {
      map['userInfo'] = _userInfo?.toJson();
    }
    map['codingLists'] = _codingLists;
    return map;
  }

}



class CodingLists {
  CodingLists({
      List<Country>? country, 
      List<Living>? living, 
      List<Need>? need, 
      List<Craft>? craft, 
      List<Health>? health, 
      List<Doctype>? doctype, 
      List<Exittype>? exittype, 
      List<Charity>? charity, 
      List<Zone>? zone, 
      List<Marriage>? marriage, 
      List<Donation>? donation, 
      List<Job>? job, 
      List<Region>? region, 
      List<Diplom>? diplom, 
      List<Relative>? relative, 
      List<Residencetype>? residencetype,}){
    _country = country;
    _living = living;
    _need = need;
    _craft = craft;
    _health = health;
    _doctype = doctype;
    _exittype = exittype;
    _charity = charity;
    _zone = zone;
    _marriage = marriage;
    _donation = donation;
    _job = job;
    _region = region;
    _diplom = diplom;
    _relative = relative;
    _residencetype = residencetype;
}

  CodingLists.fromJson(dynamic json) {
    if (json['country'] != null) {
      _country = [];
      json['country'].forEach((v) {
        _country?.add(Country.fromJson(v));
      });
    }
    if (json['living'] != null) {
      _living = [];
      json['living'].forEach((v) {
        _living?.add(Living.fromJson(v));
      });
    }
    if (json['need'] != null) {
      _need = [];
      json['need'].forEach((v) {
        _need?.add(Need.fromJson(v));
      });
    }
    if (json['craft'] != null) {
      _craft = [];
      json['craft'].forEach((v) {
        _craft?.add(Craft.fromJson(v));
      });
    }
    if (json['health'] != null) {
      _health = [];
      json['health'].forEach((v) {
        _health?.add(Health.fromJson(v));
      });
    }
    if (json['doctype'] != null) {
      _doctype = [];
      json['doctype'].forEach((v) {
        _doctype?.add(Doctype.fromJson(v));
      });
    }
    if (json['exittype'] != null) {
      _exittype = [];
      json['exittype'].forEach((v) {
        _exittype?.add(Exittype.fromJson(v));
      });
    }
    if (json['charity'] != null) {
      _charity = [];
      json['charity'].forEach((v) {
        _charity?.add(Charity.fromJson(v));
      });
    }
    if (json['zone'] != null) {
      _zone = [];
      json['zone'].forEach((v) {
        _zone?.add(Zone.fromJson(v));
      });
    }
    if (json['marriage'] != null) {
      _marriage = [];
      json['marriage'].forEach((v) {
        _marriage?.add(Marriage.fromJson(v));
      });
    }
    if (json['donation'] != null) {
      _donation = [];
      json['donation'].forEach((v) {
        _donation?.add(Donation.fromJson(v));
      });
    }
    if (json['job'] != null) {
      _job = [];
      json['job'].forEach((v) {
        _job?.add(Job.fromJson(v));
      });
    }
    if (json['region'] != null) {
      _region = [];
      json['region'].forEach((v) {
        _region?.add(Region.fromJson(v));
      });
    }
    if (json['diplom'] != null) {
      _diplom = [];
      json['diplom'].forEach((v) {
        _diplom?.add(Diplom.fromJson(v));
      });
    }
    if (json['relative'] != null) {
      _relative = [];
      json['relative'].forEach((v) {
        _relative?.add(Relative.fromJson(v));
      });
    }
    if (json['residencetype'] != null) {
      _residencetype = [];
      json['residencetype'].forEach((v) {
        _residencetype?.add(Residencetype.fromJson(v));
      });
    }
  }
  List<Country>? _country;
  List<Living>? _living;
  List<Need>? _need;
  List<Craft>? _craft;
  List<Health>? _health;
  List<Doctype>? _doctype;
  List<Exittype>? _exittype;
  List<Charity>? _charity;
  List<Zone>? _zone;
  List<Marriage>? _marriage;
  List<Donation>? _donation;
  List<Job>? _job;
  List<Region>? _region;
  List<Diplom>? _diplom;
  List<Relative>? _relative;
  List<Residencetype>? _residencetype;
CodingLists copyWith({  List<Country>? country,
  List<Living>? living,
  List<Need>? need,
  List<Craft>? craft,
  List<Health>? health,
  List<Doctype>? doctype,
  List<Exittype>? exittype,
  List<Charity>? charity,
  List<Zone>? zone,
  List<Marriage>? marriage,
  List<Donation>? donation,
  List<Job>? job,
  List<Region>? region,
  List<Diplom>? diplom,
  List<Relative>? relative,
  List<Residencetype>? residencetype,
}) => CodingLists(  country: country ?? _country,
  living: living ?? _living,
  need: need ?? _need,
  craft: craft ?? _craft,
  health: health ?? _health,
  doctype: doctype ?? _doctype,
  exittype: exittype ?? _exittype,
  charity: charity ?? _charity,
  zone: zone ?? _zone,
  marriage: marriage ?? _marriage,
  donation: donation ?? _donation,
  job: job ?? _job,
  region: region ?? _region,
  diplom: diplom ?? _diplom,
  relative: relative ?? _relative,
  residencetype: residencetype ?? _residencetype,
);
  List<Country>? get country => _country;
  List<Living>? get living => _living;
  List<Need>? get need => _need;
  List<Craft>? get craft => _craft;
  List<Health>? get health => _health;
  List<Doctype>? get doctype => _doctype;
  List<Exittype>? get exittype => _exittype;
  List<Charity>? get charity => _charity;
  List<Zone>? get zone => _zone;
  List<Marriage>? get marriage => _marriage;
  List<Donation>? get donation => _donation;
  List<Job>? get job => _job;
  List<Region>? get region => _region;
  List<Diplom>? get diplom => _diplom;
  List<Relative>? get relative => _relative;
  List<Residencetype>? get residencetype => _residencetype;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_country != null) {
      map['country'] = _country?.map((v) => v.toJson()).toList();
    }
    if (_living != null) {
      map['living'] = _living?.map((v) => v.toJson()).toList();
    }
    if (_need != null) {
      map['need'] = _need?.map((v) => v.toJson()).toList();
    }
    if (_craft != null) {
      map['craft'] = _craft?.map((v) => v.toJson()).toList();
    }
    if (_health != null) {
      map['health'] = _health?.map((v) => v.toJson()).toList();
    }
    if (_doctype != null) {
      map['doctype'] = _doctype?.map((v) => v.toJson()).toList();
    }
    if (_exittype != null) {
      map['exittype'] = _exittype?.map((v) => v.toJson()).toList();
    }
    if (_charity != null) {
      map['charity'] = _charity?.map((v) => v.toJson()).toList();
    }
    if (_zone != null) {
      map['zone'] = _zone?.map((v) => v.toJson()).toList();
    }
    if (_marriage != null) {
      map['marriage'] = _marriage?.map((v) => v.toJson()).toList();
    }
    if (_donation != null) {
      map['donation'] = _donation?.map((v) => v.toJson()).toList();
    }
    if (_job != null) {
      map['job'] = _job?.map((v) => v.toJson()).toList();
    }
    if (_region != null) {
      map['region'] = _region?.map((v) => v.toJson()).toList();
    }
    if (_diplom != null) {
      map['diplom'] = _diplom?.map((v) => v.toJson()).toList();
    }
    if (_relative != null) {
      map['relative'] = _relative?.map((v) => v.toJson()).toList();
    }
    if (_residencetype != null) {
      map['residencetype'] = _residencetype?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// code : 1
/// name : "Owned"
/// displayName : "Owned"

class Residencetype {
  Residencetype({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Residencetype.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Residencetype copyWith({  num? code,
  String? name,
  String? displayName,
}) => Residencetype(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Family Head"
/// displayName : "Family Head"

class Relative {
  Relative({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Relative.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Relative copyWith({  num? code,
  String? name,
  String? displayName,
}) => Relative(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Illiterate"
/// displayName : "Illiterate"

class Diplom {
  Diplom({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Diplom.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Diplom copyWith({  num? code,
  String? name,
  String? displayName,
}) => Diplom(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Damascus"
/// displayName : "Damascus"
/// countryCode : 1

class Region {
  Region({
      num? code, 
      String? name, 
      String? displayName, 
      num? countryCode,}){
    _code = code;
    _name = name;
    _displayName = displayName;
    _countryCode = countryCode;
}

  Region.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
    _countryCode = json['countryCode'];
  }
  num? _code;
  String? _name;
  String? _displayName;
  num? _countryCode;
Region copyWith({  num? code,
  String? name,
  String? displayName,
  num? countryCode,
}) => Region(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
  countryCode: countryCode ?? _countryCode,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;
  num? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    map['countryCode'] = _countryCode;
    return map;
  }

}

/// code : 1
/// name : "Private Sector Employee"
/// displayName : "Private Sector Employee"

class Job {
  Job({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Job.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Job copyWith({  num? code,
  String? name,
  String? displayName,
}) => Job(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Food Basket (WFP)"
/// displayName : "Food Basket (WFP)"

class Donation {
  Donation({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Donation.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Donation copyWith({  num? code,
  String? name,
  String? displayName,
}) => Donation(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Single"
/// displayName : "Single"

class Marriage {
  Marriage({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Marriage.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Marriage copyWith({  num? code,
  String? name,
  String? displayName,
}) => Marriage(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Rukn al-Din"
/// displayName : "Rukn al-Din"
/// regionCode : 1

class Zone {
  Zone({
      num? code, 
      String? name, 
      String? displayName, 
      num? regionCode,}){
    _code = code;
    _name = name;
    _displayName = displayName;
    _regionCode = regionCode;
}

  Zone.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
    _regionCode = json['regionCode'];
  }
  num? _code;
  String? _name;
  String? _displayName;
  num? _regionCode;
Zone copyWith({  num? code,
  String? name,
  String? displayName,
  num? regionCode,
}) => Zone(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
  regionCode: regionCode ?? _regionCode,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;
  num? get regionCode => _regionCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    map['regionCode'] = _regionCode;
    return map;
  }

}

/// code : 1
/// name : "Displacement Due to Clashes"
/// displayName : "Displacement Due to Clashes"

class Charity {
  Charity({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Charity.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Charity copyWith({  num? code,
  String? name,
  String? displayName,
}) => Charity(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Displacement Due to Clashes"
/// displayName : "Displacement Due to Clashes"

class Exittype {
  Exittype({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Exittype.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Exittype copyWith({  num? code,
  String? name,
  String? displayName,
}) => Exittype(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Personal ID Card (Front)"
/// displayName : "Personal ID Card (Front)"

class Doctype {
  Doctype({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Doctype.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Doctype copyWith({  num? code,
  String? name,
  String? displayName,
}) => Doctype(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Healthy"
/// displayName : "Healthy"

class Health {
  Health({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Health.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Health copyWith({  num? code,
  String? name,
  String? displayName,
}) => Health(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Housekeeper"
/// displayName : "Housekeeper"

class Craft {
  Craft({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Craft.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Craft copyWith({  num? code,
  String? name,
  String? displayName,
}) => Craft(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Food Aid Request"
/// displayName : "Food Aid Request"

class Need {
  Need({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Need.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Need copyWith({  num? code,
  String? name,
  String? displayName,
}) => Need(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Present with Family"
/// displayName : "Present with Family"

class Living {
  Living({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Living.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Living copyWith({  num? code,
  String? name,
  String? displayName,
}) => Living(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// code : 1
/// name : "Syrian Arab Republic"
/// displayName : "Syrian Arab Republic"

class Country {
  Country({
      num? code, 
      String? name, 
      String? displayName,}){
    _code = code;
    _name = name;
    _displayName = displayName;
}

  Country.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _displayName = json['displayName'];
  }
  num? _code;
  String? _name;
  String? _displayName;
Country copyWith({  num? code,
  String? name,
  String? displayName,
}) => Country(  code: code ?? _code,
  name: name ?? _name,
  displayName: displayName ?? _displayName,
);
  num? get code => _code;
  String? get name => _name;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['displayName'] = _displayName;
    return map;
  }

}

/// id : 11
/// username : "yaroub11"
/// email : "yaroup@gmail.com"
/// phoneNumber : "+963931835850"
/// firstName : "yaroup"
/// lastName : "alhamwi"
/// address : "damas"

class UserInfo {
  UserInfo({
      num? id, 
      String? username, 
      String? email, 
      String? phoneNumber, 
      String? firstName, 
      String? lastName, 
      String? address,}){
    _id = id;
    _username = username;
    _email = email;
    _phoneNumber = phoneNumber;
    _firstName = firstName;
    _lastName = lastName;
    _address = address;
}

  UserInfo.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _address = json['address'];
  }
  num? _id;
  String? _username;
  String? _email;
  String? _phoneNumber;
  String? _firstName;
  String? _lastName;
  String? _address;
UserInfo copyWith({  num? id,
  String? username,
  String? email,
  String? phoneNumber,
  String? firstName,
  String? lastName,
  String? address,
}) => UserInfo(  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  phoneNumber: phoneNumber ?? _phoneNumber,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  address: address ?? _address,
);
  num? get id => _id;
  String? get username => _username;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['address'] = _address;
    return map;
  }

}

/// code : "en"
/// name : "English"

class SelectedLanguage {
  SelectedLanguage({
      String? code, 
      String? name,}){
    _code = code;
    _name = name;
}

  SelectedLanguage.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
  }
  String? _code;
  String? _name;
SelectedLanguage copyWith({  String? code,
  String? name,
}) => SelectedLanguage(  code: code ?? _code,
  name: name ?? _name,
);
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }

}

/// code : "ar"
/// name : "العربية"

class Languages {
  Languages({
      String? code, 
      String? name,}){
    _code = code;
    _name = name;
}

  Languages.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
  }
  String? _code;
  String? _name;
Languages copyWith({  String? code,
  String? name,
}) => Languages(  code: code ?? _code,
  name: name ?? _name,
);
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }

}