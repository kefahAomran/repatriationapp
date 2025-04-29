/// data : {"username":"rUbmH","phoneNumber":"string","password":"string","profile":{"username":"string","email":"string","phoneNumber":"string","firstName":"string","lastName":"string","address":"string"}}
/// status : "REG_USERNAME_TAKEN"
/// declaringClass : "sy.rimaz.icpc.aid.domain.model.ResponseWrapperCodeEnum"

class ErrorResp {
  ErrorResp({
      Data? data, 
      String? status, 
      String? declaringClass,}){
    _data = data;
    _status = status;
    _declaringClass = declaringClass;
}

  ErrorResp.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _declaringClass = json['declaringClass'];
  }
  Data? _data;
  String? _status;
  String? _declaringClass;
ErrorResp copyWith({  Data? data,
  String? status,
  String? declaringClass,
}) => ErrorResp(  data: data ?? _data,
  status: status ?? _status,
  declaringClass: declaringClass ?? _declaringClass,
);
  Data? get data => _data;
  String? get status => _status;
  String? get declaringClass => _declaringClass;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['declaringClass'] = _declaringClass;
    return map;
  }

}

/// username : "rUbmH"
/// phoneNumber : "string"
/// password : "string"
/// profile : {"username":"string","email":"string","phoneNumber":"string","firstName":"string","lastName":"string","address":"string"}

class Data {
  Data({
      String? username, 
      String? phoneNumber, 
      String? password, 
      Profile? profile,}){
    _username = username;
    _phoneNumber = phoneNumber;
    _password = password;
    _profile = profile;
}

  Data.fromJson(dynamic json) {
    _username = json['username'];
    _phoneNumber = json['phoneNumber'];
    _password = json['password'];
    _profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
  String? _username;
  String? _phoneNumber;
  String? _password;
  Profile? _profile;
Data copyWith({  String? username,
  String? phoneNumber,
  String? password,
  Profile? profile,
}) => Data(  username: username ?? _username,
  phoneNumber: phoneNumber ?? _phoneNumber,
  password: password ?? _password,
  profile: profile ?? _profile,
);
  String? get username => _username;
  String? get phoneNumber => _phoneNumber;
  String? get password => _password;
  Profile? get profile => _profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['phoneNumber'] = _phoneNumber;
    map['password'] = _password;
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    return map;
  }

}

/// username : "string"
/// email : "string"
/// phoneNumber : "string"
/// firstName : "string"
/// lastName : "string"
/// address : "string"

class Profile {
  Profile({
      String? username, 
      String? email, 
      String? phoneNumber, 
      String? firstName, 
      String? lastName, 
      String? address,}){
    _username = username;
    _email = email;
    _phoneNumber = phoneNumber;
    _firstName = firstName;
    _lastName = lastName;
    _address = address;
}

  Profile.fromJson(dynamic json) {
    _username = json['username'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _address = json['address'];
  }
  String? _username;
  String? _email;
  String? _phoneNumber;
  String? _firstName;
  String? _lastName;
  String? _address;
Profile copyWith({  String? username,
  String? email,
  String? phoneNumber,
  String? firstName,
  String? lastName,
  String? address,
}) => Profile(  username: username ?? _username,
  email: email ?? _email,
  phoneNumber: phoneNumber ?? _phoneNumber,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  address: address ?? _address,
);
  String? get username => _username;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['address'] = _address;
    return map;
  }

}