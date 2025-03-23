import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home1Copy
  {
    'w93zqr84': {
      'en': 'Home',
      'hi': '',
    },
    '4eo2jnjc': {
      'en': 'JalRakshak',
      'hi': '',
    },
    'ex7e3xh6': {
      'en': 'Updates',
      'hi': '',
    },
    'xzj3vmc6': {
      'en':
          '\" An application for the community, by the community and to the community\"',
      'hi': '',
    },
    'rx1m03af': {
      'en': 'NGO\'s Near You',
      'hi': '',
    },
    'lqpi277u': {
      'en': 'Button',
      'hi': '',
    },
    'b2kr13gq': {
      'en': 'Problem Status',
      'hi': '',
    },
    'oaitbxou': {
      'en': 'Jal Sathi',
      'hi': '',
    },
    'l5jwy8ql': {
      'en': 'Your Score',
      'hi': '',
    },
    'sz6spe49': {
      'en': 'Feed',
      'hi': '',
    },
    'omcj9cyd': {
      'en': 'Post',
      'hi': '',
    },
    'fa52sl1z': {
      'en': 'Search',
      'hi': '',
    },
    '9gchsltz': {
      'en': 'Search System',
      'hi': '',
    },
    'ex8fls35': {
      'en': 'Delete',
      'hi': '',
    },
    'xliw9x4u': {
      'en': 'Home',
      'hi': '',
    },
    'iljvxdbs': {
      'en': 'Delete',
      'hi': '',
    },
    'q3qju85u': {
      'en': 'Category',
      'hi': '',
    },
    'tf9wcpw4': {
      'en': 'Delete',
      'hi': '',
    },
    'kbgdttzy': {
      'en': 'Help & Feedback',
      'hi': '',
    },
    'xjzcqowt': {
      'en': 'Dashboard',
      'hi': '',
    },
    '08iet077': {
      'en': '',
      'hi': '',
    },
    '2tyma4no': {
      'en': 'Delete',
      'hi': '',
    },
    'ux7iubu5': {
      'en': 'Sign Out',
      'hi': '',
    },
  },
  // auth_2_Create
  {
    'pn99nvss': {
      'en': 'JalRakshak',
      'hi': '',
    },
    '5ty3xsqk': {
      'en': 'Get Started',
      'hi': '',
    },
    'dsjvjlac': {
      'en': 'Create an account by using the form below.',
      'hi': '',
    },
    'ip3hep1w': {
      'en': 'Email',
      'hi': '',
    },
    '3btilsa6': {
      'en': 'Password',
      'hi': '',
    },
    'yqbszm7r': {
      'en': 'Create Account',
      'hi': '',
    },
    '19yjipzc': {
      'en': 'Or sign up with',
      'hi': '',
    },
    'bhse48w8': {
      'en': 'Continue with Google',
      'hi': '',
    },
    '3d63b4uq': {
      'en': 'Continue with Apple',
      'hi': '',
    },
    'vsic5brw': {
      'en': 'Already have an account? ',
      'hi': '',
    },
    'qitvcd29': {
      'en': 'Sign in here',
      'hi': '',
    },
    '1p4hbehh': {
      'en': 'Home',
      'hi': '',
    },
  },
  // auth_2_Login
  {
    'qtqeqrke': {
      'en': 'JalRakshak',
      'hi': '',
    },
    'gbvp98i1': {
      'en': 'Welcome Back',
      'hi': '',
    },
    '3nifduc6': {
      'en': 'Fill out the information below in order to access your account.',
      'hi': '',
    },
    'q5poiqof': {
      'en': 'Email',
      'hi': '',
    },
    'sjwbdune': {
      'en': 'Password',
      'hi': '',
    },
    'bkbapnr6': {
      'en': 'Sign In',
      'hi': '',
    },
    'p7sxpe5c': {
      'en': 'Or sign in with',
      'hi': '',
    },
    'c7z3lilw': {
      'en': 'Continue with Google',
      'hi': '',
    },
    'idu63xuy': {
      'en': 'Continue with Apple',
      'hi': '',
    },
    'i9z54vw7': {
      'en': 'Don\'t have an account?  ',
      'hi': '',
    },
    'r14t8ji3': {
      'en': 'Create Account',
      'hi': '',
    },
    'g48b2m2v': {
      'en': 'Forgot password?',
      'hi': '',
    },
    'd0osliom': {
      'en': 'Home',
      'hi': '',
    },
  },
  // auth_2_ForgotPassword
  {
    'qofy1pma': {
      'en': 'JalRakshak',
      'hi': '',
    },
    '5g8ftbyx': {
      'en': 'Forgot Password',
      'hi': '',
    },
    'udjagx0f': {
      'en':
          'Please fill out your email below in order to recieve a reset password link.',
      'hi': '',
    },
    'n2axma7k': {
      'en': 'Email',
      'hi': '',
    },
    'cu3ioecu': {
      'en': 'Send Reset Link',
      'hi': '',
    },
    'mmiwili3': {
      'en': 'Home',
      'hi': '',
    },
  },
  // auth_2_createProfile
  {
    '8wrh48tu': {
      'en': 'JalRakshak',
      'hi': '',
    },
    'deh5xy4k': {
      'en': 'Home',
      'hi': '',
    },
  },
  // auth_2_Profile
  {
    'g6f7siua': {
      'en': 'Your Account',
      'hi': '',
    },
    'ymue5i9w': {
      'en': 'Edit Profile',
      'hi': '',
    },
    'kk69rddt': {
      'en': 'App Settings',
      'hi': '',
    },
    'x7447onr': {
      'en': 'Support',
      'hi': '',
    },
    '87h42rza': {
      'en': 'Terms of Service',
      'hi': '',
    },
    'kngy5lcs': {
      'en': 'Log Out',
      'hi': '',
    },
    'ati79paz': {
      'en': 'Home',
      'hi': '',
    },
  },
  // auth_2_EditProfile
  {
    'r3mbvb77': {
      'en': 'Home',
      'hi': '',
    },
  },
  // splashscreen
  {
    'eg8m0nhf': {
      'en': 'Let\'s Look after\n  Water Bodies',
      'hi': '',
    },
  },
  // notification_Create
  {
    '0gliz46d': {
      'en': 'Add Post',
      'hi': '',
    },
    '6bswlg1y': {
      'en': 'You can fill out the elemements below to post a complaint .',
      'hi': '',
    },
    'wplxdrjm': {
      'en': 'Complaint Category Name........',
      'hi': '',
    },
    'kt2xzzgm': {
      'en': 'Short Description of your issue.....',
      'hi': '',
    },
    'wtrky98g': {
      'en': 'Upload Screenshot',
      'hi': '',
    },
    'jztsvrlh': {
      'en': 'Add Live Location',
      'hi': '',
    },
    'mcqqgv60': {
      'en': 'Create Activity',
      'hi': '',
    },
    'v95git0r': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Feed
  {
    'i9pamuaz': {
      'en': '   Community Feed',
      'hi': '',
    },
  },
  // test
  {
    'jzq6dixb': {
      'en': 'Page Title',
      'hi': '',
    },
    'lnsfycpe': {
      'en': 'Home',
      'hi': '',
    },
  },
  // location
  {
    '3hn77apr': {
      'en': 'Page Title',
      'hi': '',
    },
    'ax4eafs8': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Leaderboard
  {
    'mta0f5jv': {
      'en': 'Leaderboard',
      'hi': '',
    },
    'q3o6q91z': {
      'en': 'Top Water Warriors Making a Difference',
      'hi': '',
    },
    'aext6aqe': {
      'en': 'Top Contributors',
      'hi': '',
    },
    'mtpeanm2': {
      'en': 'This Month',
      'hi': '',
    },
    '21989fpa': {
      'en': '2nd',
      'hi': '',
    },
    '4ud2oi94': {
      'en': 'Rahul M.',
      'hi': '',
    },
    'nlqhudf2': {
      'en': '1,250 pts',
      'hi': '',
    },
    'fclrjugi': {
      'en': '1st',
      'hi': '',
    },
    '4dx832vu': {
      'en': 'Priya S.',
      'hi': '',
    },
    'hyll98od': {
      'en': '1,520 pts',
      'hi': '',
    },
    'qopzx5c3': {
      'en': '3rd',
      'hi': '',
    },
    'ayguezfs': {
      'en': 'Amit K.',
      'hi': '',
    },
    'yba11ecr': {
      'en': '980 pts',
      'hi': '',
    },
    'rdv79w5v': {
      'en': 'Neha R.',
      'hi': '',
    },
    'ynpg95r0': {
      'en': '5 day streak',
      'hi': '',
    },
    '33eeg764': {
      'en': '850 pts',
      'hi': '',
    },
    '8lmsga70': {
      'en': '15 Reports',
      'hi': '',
    },
    '9qdee905': {
      'en': 'Quality Expert',
      'hi': '',
    },
    '9eqrlnh7': {
      'en': 'Vikram S.',
      'hi': '',
    },
    'lnz070ey': {
      'en': '12 Reports • 720 pts',
      'hi': '',
    },
    'w75xh12q': {
      'en': 'Meera P.',
      'hi': '',
    },
    'x620dn4c': {
      'en': '10 Reports • 650 pts',
      'hi': '',
    },
  },
  // locationCopy
  {
    '8ztt0g60': {
      'en': 'Location Access',
      'hi': '',
    },
    '2ye53031': {
      'en': 'Home',
      'hi': '',
    },
  },
  // ProblemStatus
  {
    '4fkm70ur': {
      'en': 'Problem Status',
      'hi': '',
    },
    '5c3ztqby': {
      'en': 'Welcome back,',
      'hi': '',
    },
    '4hecfw0b': {
      'en': 'Ayush Sharma',
      'hi': '',
    },
    'wsa6lnx8': {
      'en': '3',
      'hi': '',
    },
    'kb67sk48': {
      'en': 'Recent Updates',
      'hi': '',
    },
    'mm8dhr2j': {
      'en': 'Water Leakage Issue',
      'hi': '',
    },
    'p3oxnqna': {
      'en': 'Open',
      'hi': '',
    },
    'a0hg3ur5': {
      'en': 'Reported water leakage in main pipeline near Gandhi Road',
      'hi': '',
    },
    'h2wnwu96': {
      'en': 'Updated 2 hours ago',
      'hi': '',
    },
    'jdc9m27i': {
      'en': 'Sewage Blockage',
      'hi': '',
    },
    '82kdlvk1': {
      'en': 'In Progress',
      'hi': '',
    },
    'a4occw9u': {
      'en': 'Sewage blockage causing overflow in residential area',
      'hi': '',
    },
    '8xs7vbou': {
      'en': 'Updated 5 hours ago',
      'hi': '',
    },
    'zo35kig4': {
      'en': 'Water Quality Complaint',
      'hi': '',
    },
    'je2zlt0m': {
      'en': 'Resolved',
      'hi': '',
    },
    'sokj4ec2': {
      'en': 'Contaminated water supply in Park Street area',
      'hi': '',
    },
    'tiijnr3i': {
      'en': 'Water quality tested and restored to normal levels',
      'hi': '',
    },
    'gy3edorc': {
      'en': 'Updated 1 day ago',
      'hi': '',
    },
    'tvkcjple': {
      'en': 'Give Feedback',
      'hi': '',
    },
    '7vn929cc': {
      'en': 'Problem Statistics',
      'hi': '',
    },
    'lylwbrks': {
      'en': '5',
      'hi': '',
    },
    '2t81z026': {
      'en': 'Open',
      'hi': '',
    },
    'bt2unx00': {
      'en': '3',
      'hi': '',
    },
    'fncytgjw': {
      'en': 'In Progress',
      'hi': '',
    },
    'eyhguxhk': {
      'en': '12',
      'hi': '',
    },
    '59dopyc5': {
      'en': 'Resolved',
      'hi': '',
    },
  },
  // NGOpage
  {
    'no71w099': {
      'en': 'Button',
      'hi': '',
    },
    '4k1xj36x': {
      'en': 'Clean Water Initiative',
      'hi': '',
    },
    '5843wl9o': {
      'en': 'Making clean water accessible to all',
      'hi': '',
    },
    'kmck2nov': {
      'en': 'About Us',
      'hi': '',
    },
    'wn02llxd': {
      'en':
          'Clean Water Initiative is a non-profit organization dedicated to providing clean and safe drinking water to underserved communities. We work with local partners to implement sustainable water solutions and educate communities about water conservation.',
      'hi': '',
    },
    'o7gq07k7': {
      'en': 'Contact Information',
      'hi': '',
    },
    'tk6d66dk': {
      'en': '+1 (555) 123-4567',
      'hi': '',
    },
    '95jl7fip': {
      'en': 'contact@cleanwaterinitiative.org',
      'hi': '',
    },
    'a4vih82l': {
      'en': 'www.cleanwaterinitiative.org',
      'hi': '',
    },
    'jsdm2w49': {
      'en': 'Location',
      'hi': '',
    },
    'qhbfed3e': {
      'en': '123 Water Street\nSustainability Square\nEco City, EC 12345',
      'hi': '',
    },
    'bk19eumb': {
      'en': 'Donate Now',
      'hi': '',
    },
    'mdhk5cas': {
      'en': 'Volunteer With Us',
      'hi': '',
    },
  },
  // Admin
  {
    'menvolto': {
      'en': 'Log Out',
      'hi': '',
    },
    'mdihgcol': {
      'en': 'Admin Dashboard',
      'hi': '',
    },
    'eygnvpk0': {
      'en': 'JalRakshak Management System',
      'hi': '',
    },
    'flllggqb': {
      'en': 'Overview',
      'hi': '',
    },
    'u1fsbkaw': {
      'en': '156',
      'hi': '',
    },
    'wizp7av5': {
      'en': 'Total Users',
      'hi': '',
    },
    'nl5ufwmh': {
      'en': '23',
      'hi': '',
    },
    '2qv3butc': {
      'en': 'Active Complaints',
      'hi': '',
    },
    'scksrw8z': {
      'en': '8',
      'hi': '',
    },
    '0f1fjnux': {
      'en': 'Severe Cases',
      'hi': '',
    },
    'hrxo035g': {
      'en': 'Send Alert',
      'hi': '',
    },
    'ebhgx9vx': {
      'en': 'Recent Activity',
      'hi': '',
    },
    'fe9cfzgq': {
      'en': 'Water Pollution Report',
      'hi': '',
    },
    'yuyxkfup': {
      'en': 'Submitted by: John Doe',
      'hi': '',
    },
    '90up6si7': {
      'en': '2m ago',
      'hi': '',
    },
    'ohla39jw': {
      'en': 'Sewage Leakage',
      'hi': '',
    },
    'fdpimrld': {
      'en': 'Submitted by: Jane Smith',
      'hi': '',
    },
    't9surjzz': {
      'en': '15m ago',
      'hi': '',
    },
    'agwfofzy': {
      'en': 'Document Activity',
      'hi': '',
    },
    'fbs9lle8': {
      'en': 'Water Quality Report',
      'hi': '',
    },
    'n55yf85y': {
      'en': '2h ago',
      'hi': '',
    },
  },
  // Admin_Authlogin
  {
    'eae85fkx': {
      'en': 'JalRakshak Admin',
      'hi': '',
    },
    '2e9cc05k': {
      'en': 'NGO Authentication',
      'hi': '',
    },
    '0s9hcw4v': {
      'en': 'Create or sign in to your administrative account',
      'hi': '',
    },
    'bb28ycmr': {
      'en': 'Organization Name',
      'hi': '',
    },
    'i89kxh67': {
      'en': 'Email Address',
      'hi': '',
    },
    '0n7vtxyh': {
      'en': 'Password',
      'hi': '',
    },
    '22x0igib': {
      'en': 'Select Organization Location',
      'hi': '',
    },
    'af0qtqha': {
      'en': 'Login Account',
      'hi': '',
    },
    '2by2s3cc': {
      'en': 'Admin accounts require verification',
      'hi': '',
    },
  },
  // Admin_Authcreate
  {
    'qx4dem4s': {
      'en': 'JalRakshak Admin',
      'hi': '',
    },
    'bkdpilae': {
      'en': 'NGO Authentication',
      'hi': '',
    },
    'ubuse9x1': {
      'en': 'Create or sign in to your administrative account',
      'hi': '',
    },
    'nfi76n10': {
      'en': 'Organization Name',
      'hi': '',
    },
    '651r92so': {
      'en': 'Email Address',
      'hi': '',
    },
    'h39qsv9q': {
      'en': 'Password',
      'hi': '',
    },
    '2d29rbyb': {
      'en': ' Create Account',
      'hi': '',
    },
    'lhyywqjf': {
      'en': 'Login',
      'hi': '',
    },
    'iykr2tcx': {
      'en': 'Admin accounts require verification',
      'hi': '',
    },
  },
  // editProfile_auth_2
  {
    'o161kgma': {
      'en': 'Adjust the content below to update your profile.',
      'hi': '',
    },
    'ku6qsdey': {
      'en': 'Change Photo',
      'hi': '',
    },
    'fd8sj0sm': {
      'en': 'Full Name',
      'hi': '',
    },
    'dahw7inq': {
      'en': 'Your full name...',
      'hi': '',
    },
  },
  // user_ListSmall
  {
    '8uk3ror9': {
      'en': 'ME',
      'hi': '',
    },
  },
  // user_List
  {
    'rxt18bs4': {
      'en': 'Assign User',
      'hi': '',
    },
    'm7fiolhc': {
      'en': 'Select a user from the list below to continue.',
      'hi': '',
    },
    'dcs8p07v': {
      'en': 'Close',
      'hi': '',
    },
  },
  // profile
  {
    'wdng7ram': {
      'en': 'Profile Details',
      'hi': '',
    },
    'k8lmdibd': {
      'en': 'Below are your profile details',
      'hi': '',
    },
    '0ro1le5p': {
      'en': 'Ayush sharma',
      'hi': '',
    },
    '74ss3usi': {
      'en': 'Manage your account',
      'hi': '',
    },
    'msmafnf4': {
      'en': 'Edit Profile',
      'hi': '',
    },
    'mbbv07qg': {
      'en': 'Reset Password',
      'hi': '',
    },
    'flhkiiep': {
      'en': 'Light Mode',
      'hi': '',
    },
    'fvfh42qw': {
      'en': 'Dark Mode',
      'hi': '',
    },
    'v00afcb4': {
      'en': 'Get in Touch',
      'hi': '',
    },
    '67hr2zre': {
      'en': 'Help & Support',
      'hi': '',
    },
    'yiz7fqy5': {
      'en': 'Close',
      'hi': '',
    },
  },
  // mail
  {
    'kf5s5xbe': {
      'en': 'Type here to respond...',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'vbov9naf': {
      'en': '',
      'hi': '',
    },
    'zomi0sxk': {
      'en': '',
      'hi': '',
    },
    'ypd73jab': {
      'en': '',
      'hi': '',
    },
    'mt9obyh1': {
      'en': '',
      'hi': '',
    },
    'ofh6n4w6': {
      'en': '',
      'hi': '',
    },
    '5g60yh1y': {
      'en': '',
      'hi': '',
    },
    '2yg1ydga': {
      'en': '',
      'hi': '',
    },
    '7omrags6': {
      'en': '',
      'hi': '',
    },
    'r269nykg': {
      'en': '',
      'hi': '',
    },
    '3skjqnfc': {
      'en': '',
      'hi': '',
    },
    'mzm057n9': {
      'en': '',
      'hi': '',
    },
    'ihs1qqxy': {
      'en': '',
      'hi': '',
    },
    'oq5kf5ne': {
      'en': '',
      'hi': '',
    },
    'ncnax6kl': {
      'en': '',
      'hi': '',
    },
    '7xe30imj': {
      'en': '',
      'hi': '',
    },
    'p8yel1fu': {
      'en': '',
      'hi': '',
    },
    'gsnlm8y5': {
      'en': '',
      'hi': '',
    },
    '8y0a27yv': {
      'en': '',
      'hi': '',
    },
    'kpbkbk2d': {
      'en': '',
      'hi': '',
    },
    '9abbt50e': {
      'en': '',
      'hi': '',
    },
    'br9vpbx0': {
      'en': '',
      'hi': '',
    },
    'jj6zw24i': {
      'en': '',
      'hi': '',
    },
    '63gf4esa': {
      'en': '',
      'hi': '',
    },
    'w3lj2zhf': {
      'en': '',
      'hi': '',
    },
    'pzilu3yg': {
      'en': '',
      'hi': '',
    },
    'ey89dgxe': {
      'en': '',
      'hi': '',
    },
    'j3400ayd': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
