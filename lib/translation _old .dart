import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": {
      // Document Section
      "Document Type": "نوع الوثيقة",
      "Document Description": "وصف الوثيقة",

      // Family Section
      "Family Member": "فرد العائلة",
      "Edit Family Member": "تعديل فرد العائلة",
      "Add Family Member": "إضافة فرد عائلة",
      "Family Member Count": "عدد أفراد العائلة: {FamilyMemberCount}",

      // Personal Information
      "First Name": "الاسم الأول",
      "Last Name": "اسم العائلة",
      "Father Name": "اسم الأب",
      "Mother Name": "اسم الأم",
      "National Number": "الرقم الوطني",
      "Gender": "الجنس",
      "News": "الأخبار",

      // Location Information
      "Country": "البلد",
      "Region": "المنطقة",
      "Zone": "الحي",
      "Residence": "مكان الإقامة",
      "Your Location": "موقعك الحالي",
      "Original Region": "المنطقة الأصلية",
      "Original Zone": "الحي الأصلي",
      "Exit Type": "نوع الخروج",
      "Your Original Location": "مكانك الأصلي",

      // Common Actions
      "Save": "حفظ",
      "Edit": "تعديل",
      "Delete": "حذف",
      "Confirm": "تأكيد",

      // Status Messages
      "Success": "تم بنجاح",
      "Modified Successfully": "تم التعديل بنجاح",
      "Delete Success": "تم الحذف بنجاح",

      // Authentication
      "Sign In": "تسجيل الدخول",
      "Sign Up": "تسجيل",
      "Login": "تسجيل الدخول",
      "Register": "تسجيل",
      "Forgot Password": "نسيت كلمة المرور",
      "Reset Password": "إعادة تعيين كلمة المرور",
      "New Password": "كلمة المرور الجديدة",
      "Confirm Password": "تأكيد كلمة المرور",
      "Email": "البريد الإلكتروني",
      "Username": "اسم المستخدم",

      // UI Elements
      "Choose Location": "اختر موقعك",
      "Confirm Location": "تأكيد الموقع",
      "Empty List": "لا يوجد محتوى",
      "Not Available": "غير متوفر",

      // Requests
      "Edit Request": "تعديل الطلب",
      "Add Request": "إضافة طلب",
      "Note": "ملاحظة",
      "Need": "احتياج",

      // User Roles
      "Donor": "المتبرع",
      "Donee": "المستفيد",
      "Volunteer": "المتطوع",

      // Additional Terms
      "FAQs": "الأسئلة الشائعة",
      "Marriage Status": "الحالة الاجتماعية",
      "Education": "التعليم",
      "Health Status": "الحالة الصحية",
      "Living Status": "حالة المعيشة",
      "Birth Date": "تاريخ الميلاد",
      "Job": "الوظيفة",
      "Relative": "القرابة",
      "Head Of Family": "رب الأسرة: {HeadOfFamily}",

      // Registration
      "Mobile Number": "رقم الهاتف",
      "Exit Date": "تاريخ الخروج",
      "Address": "العنوان",
      "About Us": "عن الوكالة",
      "User Name": "اسم المستخدم",
      "Notification Settings": "إعدادات الإشعارات",
      "Language": "اللغة",
      "Logout": "تسجيل الخروج",
      "No Account": "ليس لديك حساب؟",
      "Create an Account": "إنشاء حساب",
      "Phone Number": "رقم الهاتف",
      "Please enter password": "الرجاء إدخال كلمة المرور",
      "Please confirm password": "الرجاء تأكيد كلمة المرور",

      // Welcome Messages
      "Welcome To Repatriation Mobile App":
          "مرحبا بك في برنامج الوكالة الدولية لحماية المدنيين",
      "Please enter a form to login this app":
          "الرجاء إدخال النموذج لتسجيل الدخول في هذا التطبيق",
      "Please Confirm": "الرجاء تأكيد",
      "Passwords do not match": "كلمة المرور غير متطابقة",
      "Press back again to exit": "الرجاء الضغط مرة أخرى للخروج",

      "Cancel": "إلغاء",
      "Error": "خطأ",
      "Connection Error": "خطأ في الاتصال",

      // Navigation
      "Home": "الرئيسية",
      "Settings": "الإعدادات",
      "Profile": "الملف الشخصي",

      // Requests
      "Request Description": "وصف الطلب",

      // Status Messages
      "Loading...": "جاري التحميل...",
      "Updating...": "جاري التحديث...",
      "Deleting...": "جاري الحذف...",

      // Validation
      "Required Field": "هذا الحقل مطلوب",
      "Invalid Email": "بريد إلكتروني غير صالح",
      "Password Mismatch": "كلمات المرور غير متطابقة",

      // Device
      "Camera Access Required": "يجب السماح بالوصول إلى الكاميرا",
      "Location Services Disabled": "خدمات الموقع معطلة",

      // Special Patterns
      "Family Member Count: {count}": "عدد أفراد العائلة: {count}",
      "Head Of Family: {name}": "رب الأسرة: {name}",

      // Alerts
      "Alert": "تنبيه",
      "Confirm Delete": "هل أنت متأكد من الحذف؟",
      "No Connection": "لا يوجد اتصال",
      "Check Internet": "الرجاء التحقق من اتصال الإنترنت",
    },
    "en": {
      // Authentication
      "Sign In": "Sign In",
      "Sign Up": "Register",
      "Login": "Login",
      "Register": "Register",
      "Forgot Password": "Forgot Password",
      "Reset Password": "Reset Password",
      "New Password": "New Password",
      "Confirm Password": "Confirm Password",
      "Email": "Email",
      "Username": "Username",

      // Family Management
      "Family Member": "Family Member",
      "Add Family Member": "Add Family Member",
      "Edit Family Member": "Edit Family Member",
      "First Name": "First Name",
      "Last Name": "Last Name",
      "Father Name": "Father Name",
      "Mother Name": "Mother Name",
      "Birth Date": "Birth Date",
      "Gender": "Gender",
      "National Number": "National Number",
      "Health Status": "Health Status",
      "Living Status": "Living Status",
      "News": "News",

      // Documents
      "Document Type": "Document Type",
      "Document Description": "Document Description",
      "Choose Document": "Choose Document",

      // Location
      "Country": "Country",
      "Region": "Region",
      "Zone": "Zone",
      "Address": "Address",
      "Current Location": "Current Location",
      "Original Location": "Original Location",

      // Common
      "Save": "Save",
      "Edit": "Edit",
      "Delete": "Delete",
      "Confirm": "Confirm",
      "Cancel": "Cancel",
      "Success": "Success",
      "Error": "Error",
      "Connection Error": "Connection Error",

      // Alerts
      "Alert": "Alert",
      "Confirm Delete": "Are you sure you want to delete?",
      "No Connection": "No Connection",
      "Check Internet": "Please check your internet connection",

      // Navigation
      "Home": "Home",
      "Settings": "Settings",
      "Profile": "Profile",
      "Logout": "Logout",

      // Requests
      "Add Request": "Add Request",
      "Edit Request": "Edit Request",
      "Request Description": "Request Description",

      // Status Messages
      "Loading...": "Loading...",
      "Updating...": "Updating...",
      "Deleting...": "Deleting...",

      // Validation
      "Required Field": "Required field",
      "Invalid Email": "Invalid email",
      "Password Mismatch": "Passwords do not match",

      // Device
      "Camera Access Required": "Camera access required",
      "Location Services Disabled": "Location services disabled",

      // Special Patterns
      "Family Member Count: {count}": "Family Member Count: {count}",
      "Head Of Family: {name}": "Head Of Family: {name}",

      // Documents

      // Location Information
      "Residence": "Residence",
      "Your Location": "Your Location",
      "Original Region": "Original Region",
      "Original Zone": "Original Zone",
      "Exit Type": "Exit Type",
      "Your Original Location": "Your Original Location",

      // Common Actions

      // Status Messages
      "Modified Successfully": "Modified Successfully",
      "Delete Success": "Delete Success",

      // Authentication
      "Password": "Password",

      // UI Elements
      "Choose Location": "Choose Location",
      "Confirm Location": "Confirm Location",
      "Empty List": "Empty List",
      "Not Available": "Not Available",

      // Requests
      "Note": "Note",
      "Need": "Need",

      // User Roles
      "Donor": "Donor",
      "Donee": "Donee",
      "Volunteer": "Volunteer",

      // Additional Terms
      "FAQs": "FAQs",
      "Marriage Status": "Marriage Status",
      "Education": "Education",

      "Job": "Job",
      "Relative": "Relative",
      "Head Of Family": "Head Of Family: {HeadOfFamily}",

      // Registration
      "Mobile Number": "Mobile Number",
      "Exit Date": "Exit Date",

      "About Us": "About Us",
      "User Name": "User Name",
      "Notification Settings": "Notification Settings",
      "Language": "Language",

      "No Account": "No account?",
      "Create an Account": "Create an Account",
      "Phone Number": "Phone Number",

      // Welcome Messages
      "Welcome To Repatriation Mobile App":
          "Welcome to Repatriation Mobile App",
      "Please enter a form to login this app":
          "Please enter a form to login this app",
      "Please Confirm": "Please Confirm",
      "Passwords do not match": "Passwords do not match",
      "Please enter password": "Please enter password",
      "Please confirm password": "Please confirm password",
      "Press back again to exit": "Press back again to exit",
    },
  };
}
