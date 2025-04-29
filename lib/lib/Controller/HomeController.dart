import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Component/general_response.dart';
import '../Model/DocModel.dart';
import '../Model/configrationModel.dart';
import '../Model/familyMemberModel.dart';
import '../Model/faqsModel.dart';
import '../Model/news.dart';
import '../Model/requestModel.dart';
import '../Services/API.dart';
import 'changelocal.dart';
import 'package:image/image.dart' as img; // استيراد مكتبة معالجة الصور
import 'package:path/path.dart' as path;
import 'package:mime/mime.dart';

class HomeController extends GetxController {
  List<News> listNews = [];
  List<RequestModel> listRequest = [];
  List<DocModel> listDocument = [];
  List<FamilyMemberModel> listFamilyMember = [];
  late Rx<TextEditingController> descController = TextEditingController().obs;
  late Rx<TextEditingController> formattedDate = TextEditingController().obs;
  late Rx<TextEditingController> familyIdController =
      TextEditingController().obs;
  late Rx<TextEditingController> needCodeController =
      TextEditingController().obs;

  late Rx<TextEditingController> firstNameController =
      TextEditingController().obs;
  late Rx<TextEditingController> fatherNameController =
      TextEditingController().obs;
  late Rx<TextEditingController> motherNameController =
      TextEditingController().obs;
  late Rx<TextEditingController> birthDateController =
      TextEditingController().obs;
  // late Rx<TextEditingController> firstNameController = TextEditingController().obs;
  late Rx<TextEditingController> lastNameController =
      TextEditingController().obs;
  late Rx<TextEditingController> idController = TextEditingController().obs;

  late Rx<TextEditingController> emailController = TextEditingController().obs;
  late Rx<TextEditingController> addressController =
      TextEditingController().obs;

  late Rx<TextEditingController> familymembersController =
      TextEditingController().obs;
  late Rx<TextEditingController> documentDescController =
      TextEditingController().obs;
  late Rx<TextEditingController> notesController = TextEditingController().obs;
  late Rx<TextEditingController> currentFamilyMembersController =
      TextEditingController().obs;
  late Rx<TextEditingController> currentDocumentTypesController =
      TextEditingController().obs;

  List<FaqsModel> listFaqs = [];
  var listType = ["MALE", "FEMALE"];
  var chooseneed,
      chooserelative,
      chooseGender,
      choosejob,
      chooseMarriage,
      chooseHealth,
      chooseLiving,
      chooseDiplom,
      chooseDoctype,
      chooseFamilyMemberModel;

  @override
  Future<void> onInit() async {
    print("object");
    super.onInit();
    await initialize();
  }

  Future<void> initialize() async {
    getnews(false);
    getrequests(false);
    getgetFamilymember(false);
    await getConfigration();
    getNews();
    getRequest();
    getFamilyMember();
  }

  var getinit = true.obs;

  var getnews = true.obs;

  var getrequests = true.obs;

  var deleteProcess = true.obs;

  var finishAdd = true.obs;
  var loginProcess = true.obs;
  var faqProcess = true.obs;
  var error = "";

  final Rx<DateTime> _date = DateTime(2020, 11, 17).obs;

  void selectDate(BuildContext con) async {
    final DateTime? newDate = await showDatePicker(
      context: con,
      initialDate: _date.value,
      firstDate: DateTime(1870, 1),
      lastDate: DateTime(2050, 7),
      // helpText: 'Select a date',
    );
    if (newDate != null) {
      _date(newDate);
      birthDateController.value.text = "${_date.value.toLocal()}".split(' ')[0];
    }
  }

  getNews() async {
    getnews(false);

    try {
      List signupResp = await API.news();

      listNews = signupResp[0];
    } catch (e) {
      print(e);
    } finally {
      getnews(true);
    }
  }

  /*-----------------------------Request------------------*/
  getRequest() async {
    getrequests(false);

    try {
      List signupResp = await API.getRequest();

      listRequest = signupResp[0];
    } catch (e) {
      print(e);
    } finally {
      getrequests(true);
    }
  }

  Future<String> deleteRequest(num id, RequestModel item) async {
    error = "";
    getrequests(false);
    deleteProcess(false);
    try {
      List jscg_addprocess = await API.deleteRequest(id);

      if (jscg_addprocess[0] != "") {
        //success
        listRequest.remove(item);
      } else {
        error = jscg_addprocess[1];
      }
    } catch (e) {
      error = "Connection error";
    } finally {
      getrequests(true);
      deleteProcess(true);
    }

    return error;
  }

  Future<String> addRequest() async {
    error = "";
    finishAdd(false);
    try {
      List jscg_addprocess = await API.addRequest(
        notes: descController.value.text,
        needs: chooseneed.code.toString(),
      );

      if (jscg_addprocess[0] != "") {
        //success

        finishAdd(true);
      } else {
        error = jscg_addprocess[1];
        finishAdd(false);
      }
    } finally {
      finishAdd(true);
    }

    return error;
  }

  Future<String> editRequest({required Id}) async {
    error = "";
    finishAdd(false);
    try {
      List jscg_addprocess = await API.editRequest(
        notes: descController.value.text,
        needs: chooseneed.code.toString(),
        id: Id,
      );

      if (jscg_addprocess[0] != "") {
        //success

        finishAdd(true);
      } else {
        error = jscg_addprocess[1];
        finishAdd(false);
      }
    } catch (e) {
      error = "Connection error";
      finishAdd(false);
    } finally {
      finishAdd(true);
    }

    return error;
  }

  /*-----------------------------Doc------------------*/
  var getreDoc = true.obs;
  Future<String> getDoc() async {
    getreDoc(false);
    error = "";
    try {
      List signupResp = await API.getDocument();
      if (signupResp[0] != "")
        listDocument = signupResp[0];
      else
        error = signupResp[1];
    } catch (e) {
      error = "Connection error";
      print(e);
    } finally {
      getreDoc(true);
    }
    return error;
  }

  Future<String> deleteDoc(num id, DocModel item) async {
    error = "";
    getreDoc(false);
    deleteProcess(false);
    try {
      List jscg_addprocess = await API.deleteDocument(id);

      if (jscg_addprocess[0] != "") {
        //success
        listDocument.remove(item);
      } else {
        error = jscg_addprocess[1];
      }
    } finally {
      getreDoc(true);
      deleteProcess(true);
    }

    return error;
  }

  Future<String> addDoc() async {
    error = "";
    finishAdd(false);
    try {
      List jscg_addprocess = await API.addDocument(
        zdoctypId: chooseDoctype.code,
        familyMemberId: chooseFamilyMemberModel.id,
        imageB64: base64String ?? "",
        fileName: fileName!,
        mediaType: mimeType!,
        ext: extension!,
        desc: documentDescController.value.text,
      );

      if (jscg_addprocess[0] != "") {
        //success

        finishAdd(true);
      } else {
        error = jscg_addprocess[1];
        finishAdd(false);
      }
    } catch (e) {
      error = "Connection error";
      finishAdd(false);
    } finally {
      finishAdd(true);
    }

    return error;
  }

  Future<String> editDoc({required Id}) async {
    error = "";
    finishAdd(false);
    try {
      List jscg_addprocess = await API.editDocument(
        zdoctypId: chooseDoctype.code,
        familyMemberId: chooseFamilyMemberModel.id,
        imageB64: base64String ?? "",
        fileName: fileName!,
        mediaType: mimeType!,
        ext: extension!,
        desc: documentDescController.value.text,
        id: Id,
      );

      if (jscg_addprocess[0] != "") {
        //success

        finishAdd(true);
      } else {
        error = jscg_addprocess[1];
        finishAdd(false);
      }
    } catch (e) {
      error = "Connection error";
      finishAdd(false);
    } finally {
      finishAdd(true);
    }

    return error;
  }

  /*-----------------Family Member-----------------------------*/
  String HeadOfFamily = "";
  var getgetFamilymember = true.obs;
  getFamilyMember() async {
    getgetFamilymember(false);

    try {
      List signupResp = await API.getFamilyMember();
      if (signupResp[0] != "") {
        listFamilyMember = signupResp[0];
        listFamilyMember.forEach((element) {
          if (element.relative?.code == 1)
            HeadOfFamily = element.firstName.toString();
        });
      }
    } catch (e) {
      print(e);
    } finally {
      getgetFamilymember(true);
    }
  }

  Future<String> deleteFamilyMember(num id, FamilyMemberModel item) async {
    error = "";
    getgetFamilymember(false);
    deleteProcess(false);
    try {
      List jscg_addprocess = await API.deleteFamilyMember(id);

      if (jscg_addprocess[0] != "") {
        //success
        listFamilyMember.remove(item);
      } else {
        error = jscg_addprocess[1];
      }
    } catch (e) {
      error = "Connection error";
    } finally {
      getgetFamilymember(true);
      deleteProcess(true);
    }

    return error;
  }

  Future<String> addFamilyMember() async {
    error = "";
    finishAdd(false);
    try {
      List jscg_addprocess = await API.addFamilyMember(
        health: chooseHealth.code,
        diplom: chooseDiplom.code,
        living: chooseLiving.code,
        job: choosejob.code,
        marriage: chooseMarriage.code,
        familyId: familyId!,
        relative: chooserelative.code,
        motherName: motherNameController.value.text,
        nnbr: idController.value.text,
        birthDate: birthDateController.value.text,
        gender: chooseGender,
        firstName: firstNameController.value.text,
        fatherName: fatherNameController.value.text,
        lastName: lastNameController.value.text,
      );

      if (jscg_addprocess[0] != "") {
        //success

        finishAdd(true);
      } else {
        error = jscg_addprocess[1];
        finishAdd(false);
      }
    } finally {
      finishAdd(true);
    }

    return error;
  }

  Future<String> editFamilyMember({required Id}) async {
    error = "";
    finishAdd(false);
    try {
      List jscg_addprocess = await API.editFamilyMember(
        health: chooseHealth.code,
        diplom: chooseDiplom.code,
        living: chooseLiving.code,
        job: choosejob.code,
        marriage: chooseMarriage.code,
        familyId: familyId!,
        relative: chooserelative.code,
        motherName: motherNameController.value.text,
        nnbr: idController.value.text,
        birthDate: birthDateController.value.text,
        gender: chooseGender,
        firstName: firstNameController.value.text,
        fatherName: fatherNameController.value.text,
        lastName: lastNameController.value.text,
        id: Id,
      );

      if (jscg_addprocess[0] != "") {
        //success

        finishAdd(true);
      } else {
        error = jscg_addprocess[1];
        finishAdd(false);
      }
    } catch (e) {
      error = "Connection error";
      finishAdd(false);
    } finally {
      finishAdd(true);
    }

    return error;
  }

  /*------------------------------------------*/

  Future<String> faq() async {
    error = "";
    faqProcess(false);

    try {
      List jscg_zprocess_web_info_select = await API.faq();
      listFaqs = jscg_zprocess_web_info_select[0];
    } catch (_) {
      error = "Connection error";
    } finally {
      faqProcess(true);
    }

    return error;
  }

  String? base64String;
  String? fileName;
  String? extension;
  String? mimeType;
  bool pickImage = true;
  Future<void> pickImageFromCamera() async {
    pickImage = false;
    update();
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        // قراءة الصورة كملف
        File imageFile = File(pickedFile.path);
        // اسم الملف مع الامتداد
        fileName = path.basename(imageFile.path);

        // الامتداد فقط
        extension = path.extension(imageFile.path); // مثال: .jpg

        // نوع الملف (MIME type)
        mimeType = lookupMimeType(imageFile.path); // مثال: image/jpeg
        // تحميل الصورة باستخدام مكتبة image
        img.Image? image = img.decodeImage(imageFile.readAsBytesSync());

        if (image != null) {
          // تحديد أبعاد جديدة إذا لزم الأمر لتقليل حجم الصورة
          int targetWidth = image.width;
          int targetHeight = image.height;

          // يمكنك تصغير الصورة إذا كان حجمها كبير جدًا
          if (image.width > 360 || image.height > 360) {
            targetWidth = 360;
            targetHeight = (image.height * (360 / image.width)).round();
            image = img.copyResize(
              image,
              width: targetWidth,
              height: targetHeight,
            );
          }

          // ضغط الصورة إلى جودة 85% (يمكن تعديل هذه النسبة)
          List<int> compressedImageBytes = img.encodeJpg(image, quality: 70);

          // تحقق من حجم الصورة المضغوطة
          while (compressedImageBytes.length > 150 * 1024) {
            // تقليل الجودة بشكل تدريجي حتى يصل الحجم إلى أقل من 150 كيلو بايت
            compressedImageBytes = img.encodeJpg(
              image,
              quality:
                  (85 -
                      ((compressedImageBytes.length - 150 * 1024) / 1024)
                          .round()),
            );
          }

          // تحويل الصورة إلى base64
          base64String = base64Encode(compressedImageBytes);

          // تحديث حالة الـ UI
        }
      }
    } catch (e) {
      error = "Connection error";

      Get.defaultDialog(title: "Alert", content: Text(e.toString()));
    } finally {
      pickImage = true;
      update();
    }
  }

  var getconfigration = true.obs;
  getConfigration() async {
    getconfigration(false);

    try {
      List temp = await API.configration();

      userInfo = temp[1];
      CodingLists conf = temp[0];
      country = conf.country!;
      living = conf.living!;
      need = conf.need!;
      craft = conf.craft!;
      health = conf.health!;
      doctype = conf.doctype!;
      exittype = conf.exittype!;
      charity = conf.charity!;
      zone = conf.zone!;
      marriage = conf.marriage!;
      donation = conf.donation!;
      job = conf.job!;
      region = conf.region!;
      diplom = conf.diplom!;
      relative = conf.relative!;
      residencetype = conf.residencetype!;
    } finally {
      getconfigration(true);
    }
  }

  getDonorData() async {
    // try {
    //   List donorData = await API.getDonorData();
    //   if (donorData[0] != "") {
    //     //success
    //     listDonorData = donorData[0];
    //   } else {
    //     error = donorData[1];
    //   }
    // } catch (e) {
    //   error = "Connection error";
    // }
  }
}
