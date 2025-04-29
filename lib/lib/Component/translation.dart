import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": {
      // Arabic Translations

      // Authentication
      'Sign In': 'تسجيل الدخول',
      'Register': 'التسجيل',
      'Login': 'تسجيل الدخول',
      'Forgot Password': 'هل نسيت كلمة المرور؟',
      'Reset Password': 'إعادة تعيين كلمة المرور',
      'New Password': 'كلمة المرور الجديدة',
      'Confirm Password': 'تأكيد كلمة المرور',
      'Email': 'البريد الإلكتروني',
      'Username': 'اسم المستخدم',
      'Create an account': 'إنشاء حساب',

      // Family Management
      'Family Member': 'فرد العائلة',
      'Add Family Member': 'إضافة فرد إلى العائلة',
      'Edit Family Member': 'تعديل فرد العائلة',
      'First Name': 'الاسم الأول',
      'Last Name': 'اسم العائلة',
      'Father Name': 'اسم الأب',
      'Mother Name': 'اسم الأم',

      'Gender': 'الجنس',
      'National Number': 'الرقم الوطني',
      'Health Status': 'الحالة الصحية',
      'Living Status': 'حالة المعيشة',

      // Documents
      'Document type': 'نوع المستند',
      'Document Description': 'وصف المستند',
      'Choose Document': 'اختر مستند',
      'Desc': 'وصف',
      'Status': 'الحالة',
      'Add Document': 'إضافة مستند',
      'Edit Document': 'تعديل المستند',

      // Location
      'Country': 'البلد',
      'Region': 'المنطقة',
      'Zone': 'القطاع',
      'Address': 'العنوان',
      'Current Location': 'الموقع الحالي',
      'Original Location': 'الموقع الأصلي',
      'Account is not active': 'الحساب غير فعال',

      // Common
      'Save': 'حفظ',
      'Edit': 'تعديل',
      'Delete': 'حذف',
      'Confirm': 'تأكيد',
      'Cancel': 'إلغاء',
      'Success': 'نجاح',
      'Error': 'خطأ',
      'Connection Error': 'خطأ في الاتصال',
      'Done': 'تم',

      // Alerts
      'Alert': 'تنبيه',
      'Are you sure you want to delete?': 'هل أنت متأكد أنك تريد الحذف؟',
      'No Connection': 'لا يوجد اتصال',
      'Please check your internet connection': 'يرجى التحقق من اتصال الإنترنت',

      // Navigation
      'Home': 'الرئيسية',
      'Settings': 'الإعدادات',
      'Profile': 'الملف الشخصي',
      'Logout': 'تسجيل الخروج',

      // Requests
      'Add Request': 'إضافة طلب',
      'Edit Request': 'تعديل الطلب',
      'Request Description': 'وصف الطلب',
      'Requests': 'الطلبات',

      // Status Messages
      'Loading.': 'جارٍ التحميل...',
      'Updating.': 'جارٍ التحديث...',
      'Deleting.': 'جارٍ الحذف...',

      // Validation
      'Required field': 'حقل مطلوب',
      'Invalid email': 'بريد إلكتروني غير صالح',
      'Passwords do not match': 'كلمتا المرور غير متطابقتين',
      'Please enter phone number': 'يرجى إدخال رقم الجوال',
      'Please Enter User Name': 'يرجى إدخال اسم المستخدم',

      // Device
      'Camera access required': 'مطلوب الوصول إلى الكاميرا',
      'Location services disabled': 'خدمات الموقع معطلة',

      // Special Patterns
      'Family member Count:': 'عدد أفراد العائلة: ',
      'Head Of Family:': 'رب الأسرة:',

      // Verification
      'Verification Code': 'رمز التحقق',
      'Enter Verification Code': 'أدخل رمز التحقق',
      'Resend Code': 'إعادة إرسال الرمز',
      'Invalid Verification Code': 'رمز التحقق غير صالح',
      'Password must contain letters and numbers':
          'يجب أن تحتوي كلمة المرور على حروف وأرقام',
      'Verify': 'تحقق',
      'Resend': 'إعادة إرسال',
      'Enter password': 'أدخل كلمة المرور',
      'Confirm password': 'تأكيد كلمة المرور',
      'Please Enter First Name': 'يرجى إدخال الاسم الأول',
      'Please Enter Last Name': 'يرجى إدخال الاسم الأخير',
      'Please Enter Email': 'يرجى إدخال البريد الإلكتروني',
      'Please Enter Address': 'يرجى إدخال العنوان',
      'Notification settings': 'إعدادات الإشعارات',

      // Password
      'Password': 'كلمة المرور',

      // Configuration Models
      'Syrian Arab Republic': 'الجمهورية العربية السورية',
      'Lebanese Republic': 'الجمهورية اللبنانية',
      'Present with Family': 'متواجد مع العائلة',
      'Expatriate': 'مغترب',
      'Missing': 'مفقود',
      'Deceased': 'متوفى',
      'Detained': 'محتجز',
      'Food Aid Request': 'طلب مساعدات غذائية',
      'Voluntary Return Request': 'طلب عودة طوعية',
      'Home Repair Request': 'طلب إصلاح المنزل',
      'Housekeeper': 'عاملة منزلية',
      'Sales Representative': 'مندوب مبيعات',
      'Administrator': 'مسؤول',
      'Healthy': 'سليم',
      'Personal ID Card (Front)': 'بطاقة هوية شخصية (أمام)',
      'Displacement Due to Clashes': 'نزوح بسبب الاشتباكات',
      'Rukn al-Din': 'ركن الدين',
      'Single': 'أعزب',
      'Married': 'متزوج',
      'Food Basket (WFP)': 'سلة غذائية (برنامج الأغذية العالمي)',
      'Private Sector Employee': 'موظف في القطاع الخاص',
      'Damascus': 'دمشق',
      'Illiterate': 'أمي',

      // FAQs & News
      'How do I submit a request for assistance?': 'كيف أقدم طلب مساعدة؟',
      'New Assistance Programs Available': 'برامج مساعدة جديدة متاحة',
      "Welcome to Repatriation Mobile App":
          "مرحبا بك في برنامج الوكالة الدولية لحماية المدنيين",

      // Common
      'Mobile Number': 'رقم الجوال',
      'Request Date': 'تاريخ الطلب',
      'Result': 'النتيجة',
      'Services': 'الخدمات',

      // Status Messages
      'SUCCESS': 'نجاح',
      'Username already taken': 'اسم المستخدم مأخوذ بالفعل',

      // Authentication messages
      'sessionExpired': 'انتهت صلاحية الجلسة',

      // API response messages
      'No results found': 'لم يتم العثور على نتائج',
      'Error occurred': 'حدث خطأ',
      'HTTP Error': 'خطأ HTTP',
      'Session has expired': 'انتهت صلاحية الجلسة',

      // Error messages
      'Verification failed': 'فشل التحقق',
      'Registration failed': 'فشل التسجيل',
      'Login failed': 'فشل تسجيل الدخول',
      'Request failed': 'فشل الطلب',
      'Document operation failed': 'فشل عملية المستند',
      'Family member operation failed': 'فشل عملية فرد العائلة',
      'Family information update failed': 'فشل تحديث معلومات العائلة',
      'FAQ retrieval failed': 'فشل جلب الأسئلة الشائعة',
      'News retrieval failed': 'فشل جلب الأخبار',
      'Configuration retrieval failed': 'فشل جلب الإعدادات',

      // Success messages
      'Verification successful': 'تم التحقق بنجاح',
      'Registration successful': 'تم التسجيل بنجاح',
      'Login successful': 'تم تسجيل الدخول بنجاح',
      'Request processed successfully': 'تمت معالجة الطلب بنجاح',
      'Document operation successful': 'تمت عملية المستند بنجاح',
      'Family member operation successful': 'تمت عملية فرد العائلة بنجاح',
      'Family information updated successfully':
          'تم تحديث معلومات العائلة بنجاح',

      // Placeholder/Generic texts
      'activate.data': 'activate.data',
      'Data': 'البيانات',
      'Error class': 'فئة الخطأ',

      // Google Maps API
      'Google Maps API error': 'خطأ في Google Maps API',

      // Hello Screen 1
      'Hello 👋': 'مرحباً 👋',

      'English': 'الإنجليزية',
      'Arabic': 'العربية',

      // Hello Screen 2
      'Welcome to ICPC Mobile Apps': 'مرحباً بك في تطبيقات ICPC',
      'I am a': 'أنا',
      'Donor': 'متبرع',
      'Donee': 'مستفيد',
      'Volunteer': 'متطوع',

      // Common UI Elements
      'Yes': 'نعم',
      'No': 'لا',
      'Empty': 'فارغ',
      'Loading...': 'جارٍ التحميل...',

      // Authentication & API
      'Added successfully': 'تمت الإضافة بنجاح',
      'Edited successfully': 'تم التعديل بنجاح',
      'Deleted successfully': 'تم الحذف بنجاح',
      'Modified successfully': 'تم التعديل بنجاح',

      // Family Screens
      'Family Info': 'معلومات العائلة',
      'Edit Family Info': 'تعديل معلومات العائلة',
      'Head Of Family': 'رب الأسرة',
      'Family member Count': 'عدد أفراد العائلة',
      'Current residence information': 'معلومات السكن الحالي',
      'Original residence information': 'معلومات السكن الأصلي',
      'Are you an immigrant?': 'هل أنت مهاجر؟',
      'Select Location': 'اختر الموقع',
      'Confirm Location': 'تأكيد الموقع',
      'Your Location': 'موقعك',
      'Your Original Location': 'موقعك الأصلي',
      'Please select Your location': 'يرجى اختيار موقعك',
      'Phone Number': 'رقم الجوال',
      'User Name': 'اسم المستخدم',

      // Form Fields
      'Nation Number': 'الرقم الوطني',
      'Relative': 'القريب',
      'Marriage Status': 'الحالة الاجتماعية',
      'Job': 'الوظيفة',
      'Education': 'المستوى التعليمي',

      // Document Screens
      'Documents': 'المستندات',
      'Upload Image': 'تحميل صورة',
      'JPG,JPEG less than 500 Kb': 'JPG,JPEG أقل من 500 كيلوبايت',

      // Confirmation Dialogs
      'Are you sure about this procedure?': 'هل أنت متأكد من هذا الإجراء؟',

      // Map Screen
      'Choose your location': 'اختر موقعك',

      // Navigation Controls
      'skip': 'تخطى',
      'next': 'التالي',
      'get Started': 'ابدأ',

      'Need': 'الحاجة',
      'Note': 'ملاحظة',

      // Onboarding Content
      'onboarding_title_1': 'مرحباً!',
      'onboarding_description_1':
          'الوكالة الدولية للحماية المدنية (ICPC) هي منظمة دولية ذات شخصية قانونية، تم تأسيسها وفقاً لمبادئ الدبلوماسية المستقلة. وهي منظمة غير حكومية وغير ربحية.',

      'onboarding_title_2': 'الحماية المدنية',
      'onboarding_description_2':
          'تعمل الوكالة كشريك معتمد للأمم المتحدة في تنفيذ المشاريع الإنسانية والتنموية، مع الالتزام بالمعايير الدولية المعمول بها.',

      'onboarding_title_3': 'مهمتنا',
      'onboarding_description_3':
          'تعمل الوكالة كشريك معتمد للأمم المتحدة في تنفيذ المشاريع الإنسانية والتنموية، مع الالتزام بالمعايير الدولية المعمول بها.',

      // Navigation Controls
      'get_started': 'ابدأ الآن',

      'Welcome Back': 'مرحباً مجدداً',
      'Please enter a form to login this app':
          'يرجى ملء النموذج لتسجيل الدخول إلى التطبيق',

      'Enter your Username or Mobile number': 'أدخل اسم المستخدم أو رقم الجوال',
      'Enter your password': 'أدخل كلمة المرور',

      'Please enter your email': 'يرجى إدخال بريدك الإلكتروني',
      'Please enter your password': 'يرجى إدخال كلمة المرور',
      'Please enter password': 'يرجى إدخال كلمة المرور',
      'Please confirm password': 'يرجى تأكيد كلمة المرور',

      'Sign in': 'تسجيل الدخول',

      'Sign in with Google': 'تسجيل الدخول باستخدام جوجل',
      'Facebook': 'فيسبوك',

      'Welcome': 'مرحباً',
      'Logged in as \${user.user?.displayName}':
          'تم تسجيل الدخول باسم \${user.user?.displayName}',
      "Don't have an account ? ": "لا تمتلك حساباً؟ ",

      // Navigation
      'Stay Tune': 'الإستمتاع',
      'Request': 'الطلب',
      'Family': 'العائلة',
      'settings': 'الإعدادات',
      'pressBackAgainToExit': 'اضغط مرة أخرى للخروج',
      'birth date': 'تاريخ الميلاد',

      // News/Stay Tune Screen
      'News': 'الأخبار',

      'Residence': 'السكن الحالي',

      'Original Country': 'الدولة الأصلية',
      'Original Region': 'المنطقة الأصلية',
      'Original Zone': 'المنطقة الأصلية',
      'ExitType': 'نوع الخروج',
      'ExitDate': 'تاريخ الخروج',

      'Notification Settings': 'إعدادات الإشعارات',
      'Language': 'اللغة',
      'About Us': 'عننا',

      'Exit Type': 'نوع الخروج',
      'Exit Date': 'تاريخ الخروج',
      'FAQ': 'الأسئلة الشائعة',
      'Connection error': 'خطأ في الاتصال',
      'Unexpected error occurred, please try again later':
          'حدث خطأ غير متوقع الرجاء المحاولة لاحقا',
    },
    "en": {
      // Authentication
      'Sign In': 'Sign In',
      'Register': 'Register',
      'Login': 'Login',
      'Forgot Password': 'Forgot Password',
      'Reset Password': 'Reset Password',
      'New Password': 'New Password',
      'Confirm Password': 'Confirm Password',
      'Email': 'Email',
      'Username': 'Username',
      'Please enter password': 'Please enter password',
      'Please enter email': 'Please enter email',
      'Please enter username': 'Please enter username',

      // Family Management
      'Family Member': 'Family Member',
      'Add Family Member': 'Add Family Member',
      'Edit Family Member': 'Edit Family Member',
      'First Name': 'First Name',
      'Last Name': 'Last Name',
      'Father Name': 'Father Name',
      'Mother Name': 'Mother Name',
      'birth date': 'Birth Date',
      'Gender': 'Gender',
      'National Number': 'National Number',
      'Health Status': 'Health Status',
      'Living Status': 'Living Status',
      'Phone Number': 'Phone Number',
      'User Name': 'User Name',
      'Create an account': 'Create an account',
      'Add Document': 'Add Document',
      'Edit Document': 'Edit Document',

      // Documents
      'Document type': 'Document type',
      'Document Description': 'Document Description',
      'Choose Document': 'Choose Document',

      // Location
      'Country': 'Country',
      'Region': 'Region',
      'Zone': 'Zone',
      'Address': 'Address',
      'Current Location': 'Current Location',
      'Original Location': 'Original Location',
      'Notification settings': 'Notification settings',

      // Common
      'Save': 'Save',
      'Edit': 'Edit',
      'Delete': 'Delete',
      'Confirm': 'Confirm',
      'Cancel': 'Cancel',
      'Success': 'Success',
      'Error': 'Error',
      'Connection Error': 'Connection Error',
      'Done': 'Done',

      // Alerts
      'Alert': 'Alert',
      'Are you sure you want to delete?': 'Are you sure you want to delete?',
      'No Connection': 'No Connection',
      'Please check your internet connection':
          'Please check your internet connection',
      "Welcome to Repatriation Mobile App":
          "Welcome To Repatriation Mobile App",

      // Navigation
      'Home': 'Home',
      'Settings': 'Settings',
      'Profile': 'Profile',
      'Logout': 'Logout',

      // Requests
      'Add Request': 'Add Request',
      'Edit Request': 'Edit Request',
      'Request Description': 'Request Description',
      'Requests': 'Requests',

      // Status Messages
      'Loading.': 'Loading.',
      'Updating.': 'Updating.',
      'Deleting.': 'Deleting.',

      // Validation
      'Required field': 'Required field',
      'Invalid email': 'Invalid email',
      'Passwords do not match': 'Passwords do not match',

      // Device
      'Camera access required': 'Camera access required',
      'Location services disabled': 'Location services disabled',

      // Special Patterns
      'Family Member Count: {count}': 'Family Member Count: {count}',
      'Head Of Family: {name}': 'Head Of Family: {name}',

      // Verification
      'Verification Code': 'Verification Code',
      'Enter Verification Code': 'Enter Verification Code',
      'Resend Code': 'Resend Code',
      'Invalid Verification Code': 'Invalid Verification Code',
      'Password must contain letters and numbers':
          'Password must contain letters and numbers',
      'Verify': 'Verify',
      'Resend': 'Resend',

      // Password
      'Password': 'Password',

      // Configuration Models
      'Syrian Arab Republic': 'Syrian Arab Republic',
      'Lebanese Republic': 'Lebanese Republic',
      'Present with Family': 'Present with Family',
      'Expatriate': 'Expatriate',
      'Missing': 'Missing',
      'Deceased': 'Deceased',
      'Detained': 'Detained',
      'Food Aid Request': 'Food Aid Request',
      'Voluntary Return Request': 'Voluntary Return Request',
      'Home Repair Request': 'Home Repair Request',
      'Housekeeper': 'Housekeeper',
      'Sales Representative': 'Sales Representative',
      'Administrator': 'Administrator',
      'Healthy': 'Healthy',
      'Personal ID Card (Front)': 'Personal ID Card (Front)',
      'Displacement Due to Clashes': 'Displacement Due to Clashes',
      'Rukn al-Din': 'Rukn al-Din',
      'Single': 'Single',
      'Married': 'Married',
      'Food Basket (WFP)': 'Food Basket (WFP)',
      'Private Sector Employee': 'Private Sector Employee',
      'Damascus': 'Damascus',
      'Illiterate': 'Illiterate',

      // FAQs & News
      'How do I submit a request for assistance?':
          'How do I submit a request for assistance?',
      'New Assistance Programs Available': 'New Assistance Programs Available',
      'Unexpected error occurred, please try again later':
          'Unexpected error occurred, please try again later',

      // Common
      'Mobile Number': 'Mobile Number',
      'Request Date': 'Request Date',
      'Result': 'Result',
      'Services': 'Services',

      // Status Messages
      'SUCCESS': 'SUCCESS',
      'Username already taken': 'Username already taken',

      // Authentication messages
      'Session has expired': 'Session has expired',

      // API response messages
      'No results found': 'No results found',
      'Error occurred': 'Error occurred',
      'HTTP Error': 'HTTP Error',

      // Error messages
      'Verification failed': 'Verification failed',
      'Registration failed': 'Registration failed',
      'Login failed': 'Login failed',
      'Request failed': 'Request failed',
      'Document operation failed': 'Document operation failed',
      'Family member operation failed': 'Family member operation failed',
      'Family information update failed': 'Family information update failed',
      'FAQ retrieval failed': 'FAQ retrieval failed',
      'News retrieval failed': 'News retrieval failed',
      'Configuration retrieval failed': 'Configuration retrieval failed',

      // Success messages
      'Verification successful': 'Verification successful',
      'Registration successful': 'Registration successful',
      'Login successful': 'Login successful',
      'Request processed successfully': 'Request processed successfully',
      'Document operation successful': 'Document operation successful',
      'Family member operation successful':
          'Family member operation successful',
      'Family information updated successfully':
          'Family information updated successfully',

      // Placeholder/Generic texts
      'activate.data': 'activate.data',
      'Status': 'Status',
      'Data': 'Data',
      'Error class': 'Error class',

      // Google Maps API
      'Google Maps API error': 'Google Maps API error',

      // Hello Screen 1
      'Hello 👋': 'Hello 👋',

      'English': 'English',
      'Arabic': 'Arabic',

      // Hello Screen 2
      'Welcome to ICPC Mobile Apps': 'Welcome to ICPC Mobile Apps',
      'I am a': 'I am a',
      'Donor': 'Donor',
      'Donee': 'Donee',
      'Volunteer': 'Volunteer',

      // Common UI Elements
      'Yes': 'Yes',
      'No': 'No',
      'Empty': 'Empty',
      'Loading...': 'Loading...',

      // Authentication & API
      'Added successfully': 'Added successfully',
      'Edited successfully': 'Edited successfully',
      'Deleted successfully': 'Deleted successfully',
      'Modified successfully': 'Modified successfully',
      'Connection error': 'Connection error',

      // Family Screens
      'Family Info': 'Family Info',
      'Edit Family Info': 'Edit Family Info',
      'Head Of Family': 'Head Of Family',
      'Family member Count': 'Family member Count',
      'Current residence information': 'Current residence information',
      'Original residence information': 'Original residence information',
      'Are you an immigrant?': 'Are you an immigrant?',
      'Select Location': 'Select Location',
      'Confirm Location': 'Confirm Location',
      'Your Location': 'Your Location',
      'Your Original Location': 'Your Original Location',
      'Please select your location': 'Please select your location',
      'Please enter your email': 'Please enter your email',
      'Enter password': 'Enter password',
      'Confirm password': 'Confirm password',
      'Please enter phone number': 'Please enter phone number',
      'Please Enter User Name': 'Please Enter User Name',

      // Form Fields
      'Nation Number': 'Nation Number',
      'Relative': 'Relative',
      'Marriage Status': 'Marriage Status',
      'Job': 'Job',
      'Education': 'Education',

      // Document Screens
      'Documents': 'Documents',
      'Upload Image': 'Upload Image',
      'JPG,JPEG less than 500 Kb': 'JPG,JPEG less than 500 Kb',

      // Confirmation Dialogs
      'Are you sure about this procedure?':
          'Are you sure about this procedure?',

      // Map Screen
      'Choose your location': 'Choose your location',

      // Navigation Controls
      'Skip': 'Skip',
      'Next': 'Next',
      'Get Started': 'Get Started',
      // Onboarding Content
      'onboarding_title_1': 'Welcome!',
      'onboarding_description_1':
          'The International Civilian Protection Agency (ICPC) is an international organization with legal personality, established in accordance with the principles of independent diplomacy. It is a non-governmental, non-profit organization.',

      'onboarding_title_2': 'Civilian Protection',
      'onboarding_description_2':
          'The Agency operates as an accredited partner of the United Nations in implementing humanitarian and development projects, adhering to applicable international standards.',

      'onboarding_title_3': 'Our Mission',
      'onboarding_description_3':
          'The Agency operates as an accredited partner of the United Nations in implementing humanitarian and development projects, adhering to applicable international standards.',

      'Welcome Back': 'Welcome Back',
      'Please enter a form to login this app':
          'Please enter a form to login this app',
      'Enter your Username or Mobile number':
          'Enter your Username or Mobile number',
      'Enter your password': 'Enter your password',
      'Please enter phone number': 'Please enter phone number',

      'Please enter your email': 'Please enter your email',
      'Please enter your password': 'Please enter your password',
      'Sign in': 'Sign in',
      'Sign in with Google': 'Sign in with Google',
      'Facebook': 'Facebook',
      'Please Enter First Name': 'Please Enter First Name',
      'Please Enter Last Name': 'Please Enter Last Name',
      'Please Enter Email': 'Please Enter Email',
      'Please Enter Address': 'Please Enter Address',
      'Please Enter User Name': 'Please Enter User Name',

      'Welcome': 'Welcome',
      'Logged in as \${user.user?.displayName}':
          'Logged in as \${user.user?.displayName}',

      "Don't have an account ? ": "Don't have an account ? ",
      'Desc': 'Description',

      // Navigation
      'stayTune': 'Stay Tune',
      'request': 'Request',
      'family': 'Family',
      'settings': 'Settings',
      'pressBackAgainToExit': 'Press back again to exit',

      // News/Stay Tune Screen
      'News': 'News',
      'Need': 'Need',
      'Note': 'Note',

      'Residence': 'Residence',

      'Original Country': 'Original Country',
      'Original Region': 'Original Region',
      'Original Zone': 'Original Zone',
      'Exit Type': 'Exit Type',
      'Exit Date': 'Exit Date',

      'Notification Settings': 'Notification settings',
      'Language': 'Language',
      'About Us': 'About Us',
      'FAQ': 'FAQ',
      'Account is not active': 'Account is not active',
    },
  };
}
