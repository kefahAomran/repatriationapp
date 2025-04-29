import 'package:get_storage/get_storage.dart';

import '../Component/general_response.dart';

mixin CacheManager {
  bool saveToken(String? token)  {
    final box = GetStorage();
    box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  bool savedata(String? hash,String? data)  {
    try{
      final box = GetStorage();
      box.write(hash!, data);
      return true;
    } catch(_){return false;}
  }
  String? getdata(String? hash) {
    try{final box = GetStorage();
    return box.read(hash!);}
    catch(_){

    }

  }


  String? getToken() {
    final box = GetStorage();

    return box.read(CacheManagerKey.TOKEN.toString());
  }

  removeToken()  {
    Token="";
    final box = GetStorage();

    box.remove(CacheManagerKey.TOKEN.toString());

  }
}

enum CacheManagerKey { TOKEN }
