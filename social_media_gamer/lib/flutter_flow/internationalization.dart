import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

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
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'e95mrig0': {
      'es': 'Logueate para iniciar',
      'en': '',
    },
    '2oy1zcol': {
      'es': 'Access your account below or',
      'en': '',
    },
    'jikjdk2x': {
      'es': 'Create Account',
      'en': '',
    },
    '1mf21wbb': {
      'es': 'Tu email...',
      'en': '',
    },
    'lpcl9b4u': {
      'es': 'Password',
      'en': '',
    },
    '108wmpte': {
      'es': '¿Has olvidado tu contraseña?',
      'en': '',
    },
    'xq8cey7v': {
      'es': 'Login',
      'en': '',
    },
    'i93dtx6p': {
      'es': 'Continuar como Invitado',
      'en': '',
    },
    'jup9m0o7': {
      'es': 'Light Mode',
      'en': '',
    },
    'tnd7ognh': {
      'es': 'Dark Mode',
      'en': '',
    },
    'jk64na6b': {
      'es': 'Home',
      'en': '',
    },
  },
  // createAccount
  {
    'zu1u0gh5': {
      'es': 'Bienvenido,',
      'en': '',
    },
    'blhvm26y': {
      'es': 'Crea tu cuenta a continuación, o...',
      'en': '',
    },
    'ybr35qmy': {
      'es': 'Logueate',
      'en': '',
    },
    'pvjou5dk': {
      'es': 'Tu Email...',
      'en': '',
    },
    'zx997cl7': {
      'es': 'Contraseña',
      'en': '',
    },
    'bf1ci876': {
      'es': 'Crear Cuenta',
      'en': '',
    },
    'rdb0zslj': {
      'es': 'Continuar como invitado',
      'en': '',
    },
    'q32yog3v': {
      'es': 'Home',
      'en': '',
    },
  },
  // createDogProfile
  {
    'xqhs7tck': {
      'es': 'Dog Profile',
      'en': '',
    },
    'u8a7f2ny': {
      'es': '1/2',
      'en': '',
    },
    '4fmyt00q': {
      'es':
          'Fill out your dog profiles below! And then get to sharing your pups!',
      'en': '',
    },
    '93r2slh2': {
      'es': 'Dog Name',
      'en': '',
    },
    '1svfgd9x': {
      'es': 'Dog Breed',
      'en': '',
    },
    'dt82knon': {
      'es': 'Dog Age',
      'en': '',
    },
    'wee6x6su': {
      'es': 'You can add multiple pups in your profile.',
      'en': '',
    },
    'rdvqb6sk': {
      'es': 'Skip',
      'en': '',
    },
    'rz48hwx5': {
      'es': 'Save & Continue',
      'en': '',
    },
    'pp6dzhk3': {
      'es': 'Home',
      'en': '',
    },
  },
  // createYourProfile
  {
    'crjhrybp': {
      'es': 'Tu Perfil',
      'en': '',
    },
    'jz484mzc': {
      'es': '2/2',
      'en': '',
    },
    '12hkdcey': {
      'es': 'Crear perfil',
      'en': '',
    },
    '4ntxts9x': {
      'es':
          'Completa tu perfil ahora para finalizar la configuración del mismo.',
      'en': '',
    },
    'fvxwu4km': {
      'es': 'Completa tu perfil ahora para finalizar la configuración.',
      'en': '',
    },
    '7lznv49q': {
      'es': 'Tu Nombre',
      'en': '',
    },
    'gz3lmgwq': {
      'es': 'UserName',
      'en': '',
    },
    'iqobvoa4': {
      'es': 'Dinos Algo Sobre Ti',
      'en': '',
    },
    '8kd34wwu': {
      'es': 'Completar Configuracion',
      'en': '',
    },
    'clkvg5ne': {
      'es': 'Home',
      'en': '',
    },
  },
  // forgotPassword
  {
    's5ez5mzd': {
      'es': 'Olvidé mi contraseña',
      'en': '',
    },
    'hseb6l3y': {
      'es': 'Olvidé mi contraseña',
      'en': '',
    },
    'ifp893ni': {
      'es': 'Ingresa tu correo electrónico',
      'en': '',
    },
    'wxkohzh4': {
      'es':
          'Te enviaremos un correo electrónico con un enlace para restablecer tu contraseña. Por favor, ingresa el correo electrónico asociado a tu cuenta arriba.',
      'en': '',
    },
    'wn3xeaqm': {
      'es': 'Enviar enlace de restablecimiento',
      'en': '',
    },
    'ud1mpqkc': {
      'es': 'Home',
      'en': '',
    },
  },
  // main_Feed
  {
    'r1ovndjt': {
      'es': 'Post',
      'en': '',
    },
    'xz7a59mx': {
      'es': 'New Post',
      'en': '',
    },
    '8upt40ox': {
      'es': 'SocialMedia',
      'en': '',
    },
    '4vfppjhv': {
      'es': '--',
      'en': '',
    },
  },
  // main_Profile
  {
    'hx8bzcqd': {
      'es': 'SocialMedia',
      'en': '',
    },
    '3sxhroih': {
      'es': 'Ajustes',
      'en': '',
    },
    'tfb41j4e': {
      'es': 'Mis Posts',
      'en': '',
    },
    'cbllke11': {
      'es': 'Amigos',
      'en': '',
    },
    'bosyt4ah': {
      'es': '__',
      'en': '',
    },
  },
  // createStory
  {
    '49mfx68n': {
      'es': 'Comentario....',
      'en': '',
    },
    'ow8a0fnw': {
      'es': 'Video',
      'en': '',
    },
    'i3g6tl43': {
      'es': 'Foto',
      'en': '',
    },
    '1n0u59ja': {
      'es': 'Crear Storia',
      'en': '',
    },
    '18g52679': {
      'es': 'Home',
      'en': '',
    },
  },
  // createPost
  {
    'yvjsoauu': {
      'es': 'Crear Post',
      'en': '',
    },
    'k2psrzfi': {
      'es': 'Create Post',
      'en': '',
    },
    'x6hxh4yi': {
      'es': 'Agregar imagen o video aquí.',
      'en': '',
    },
    'bczsyyu2': {
      'es': 'Comentario....',
      'en': '',
    },
    'y9pxf5j6': {
      'es': 'Create Post',
      'en': '',
    },
    '5um8y4rm': {
      'es': 'Home',
      'en': '',
    },
  },
  // postDetails_Page
  {
    'c6joxhge': {
      'es': 'Home',
      'en': '',
    },
  },
  // storyDetails
  {
    'wbdp1xjy': {
      'es': 'Home',
      'en': '',
    },
  },
  // editSettings
  {
    't4zbcnmu': {
      'es': 'Ajustes',
      'en': '',
    },
    'uv5syd5l': {
      'es': 'Edit your settings below',
      'en': '',
    },
    '6jgzz0gp': {
      'es': 'Configuración de la cuenta',
      'en': '',
    },
    '35sfg55o': {
      'es': 'Editar perfil',
      'en': '',
    },
    'ca3bderq': {
      'es': 'Cambiar contraseña',
      'en': '',
    },
    'pp33ern8': {
      'es': 'Modo Light',
      'en': '',
    },
    'sq9q5k66': {
      'es': 'Modo Dark',
      'en': '',
    },
    '9zdooeot': {
      'es': 'Cerrar sesión\n\n\n\n',
      'en': '',
    },
    '34co1epj': {
      'es': 'Ajustes',
      'en': '',
    },
    'ozze86zo': {
      'es': 'Profile',
      'en': '',
    },
  },
  // editUserProfile
  {
    'om9bfi82': {
      'es': 'Tu Perfil',
      'en': '',
    },
    'iyoo6ocm': {
      'es': 'Editar Perfil',
      'en': '',
    },
    'rhv3cbuc': {
      'es':
          'Fill out your profile now in order to complete setup of your profile.',
      'en': '',
    },
    'db8mxriy': {
      'es': 'Completa tu perfil ahora para finalizar la configuración.',
      'en': '',
    },
    '115mye0x': {
      'es': 'Tu Nombre',
      'en': '',
    },
    'th1uyjyq': {
      'es': 'Nombre de Usuario',
      'en': '',
    },
    'eamfwm7v': {
      'es': 'Tu bio',
      'en': '',
    },
    '88i0j7d4': {
      'es': 'Your Bio',
      'en': '',
    },
    'i4a0cipf': {
      'es': 'Save Changes',
      'en': '',
    },
    'o7fzuhjv': {
      'es': 'Home',
      'en': '',
    },
  },
  // editDogProfile
  {
    'uunqay0o': {
      'es': 'D Perfil',
      'en': '',
    },
    'e18xy1w3': {
      'es':
          'Fill out your dog profiles below! And then get to sharing your pups!',
      'en': '',
    },
    'wm10p5jr': {
      'es': 'Dog Name',
      'en': '',
    },
    '5gptoh5k': {
      'es': 'Dog Breed',
      'en': '',
    },
    'q5adaiac': {
      'es': 'Dog Age',
      'en': '',
    },
    'cpu8frle': {
      'es': 'Adición de otros perfiles',
      'en': '',
    },
    'o6fe2f23': {
      'es': 'Salvar Cambios',
      'en': '',
    },
    '908mul17': {
      'es': 'Home',
      'en': '',
    },
  },
  // changePassword
  {
    '9uayv0mp': {
      'es': 'Cambio de Contraseña',
      'en': '',
    },
    'ld1ve58l': {
      'es': 'Cambiar contraseña',
      'en': '',
    },
    '1q0vkr49': {
      'es':
          'Te enviaremos un correo electrónico con un enlace para restablecer tu contraseña, por favor ingresa el correo electrónico asociado a tu cuenta arriba.',
      'en': '',
    },
    '8m8o1moi': {
      'es': 'Ingresa tu Email',
      'en': '',
    },
    't8po4sqj': {
      'es': 'Enviar Link Restablecimiento',
      'en': '',
    },
    'vcd7539w': {
      'es': 'Home',
      'en': '',
    },
  },
  // viewProfilePageOther
  {
    '56d8idui': {
      'es': 'Following',
      'en': '',
    },
    '4m1s50f3': {
      'es': 'Follow',
      'en': '',
    },
    'wtwvp9a0': {
      'es': 'Posts',
      'en': '',
    },
    '37xw6e0c': {
      'es': '@username',
      'en': '',
    },
    'y7p96qu6': {
      'es': '2,493',
      'en': '',
    },
    'omme6pyw': {
      'es': '4',
      'en': '',
    },
    '712mu6p8': {
      'es':
          'I\'m back with a super quick Instagram redesign just for the fan. Rounded corners and cute icons, what else do we need, haha.⁣ ',
      'en': '',
    },
    'vl6e75b3': {
      'es': 'Friends',
      'en': '',
    },
    'fmc8q7m1': {
      'es': 'Profile',
      'en': '',
    },
  },
  // createDogProfile_New
  {
    '7owpud91': {
      'es': 'Create Dog Profile',
      'en': '',
    },
    'xrdzl7dx': {
      'es':
          'Fill out your dog profiles below! And then get to sharing your pups!',
      'en': '',
    },
    'yhy333aq': {
      'es': 'Dog Name',
      'en': '',
    },
    '9g7s08sa': {
      'es': 'Dog Breed',
      'en': '',
    },
    'g1hrgv51': {
      'es': 'Dog Age',
      'en': '',
    },
    '1r44h834': {
      'es': 'Add Pup',
      'en': '',
    },
    'q8oo7z7r': {
      'es': 'Home',
      'en': '',
    },
  },
  // chat_2_Details
  {
    'a215fp5u': {
      'es': 'Group Chat',
      'en': '',
    },
    'xhj5mh9t': {
      'es': 'Home',
      'en': '',
    },
  },
  // main_Chat
  {
    'w709g20j': {
      'es': 'SocialMedia',
      'en': '',
    },
    'acp2m1zz': {
      'es': 'Nuevo Mensaje',
      'en': '',
    },
    'gugsivlw': {
      'es': 'A continuación se muestran tus chats y chats grupales.',
      'en': '',
    },
    'upzqnekp': {
      'es': 'Chat grupal',
      'en': '',
    },
    'm8t09j2p': {
      'es': 'Mis Chats',
      'en': '',
    },
    'vnjut1pe': {
      'es': '__',
      'en': '',
    },
  },
  // chat_2_InviteUsers
  {
    'feigt2my': {
      'es': 'Invite Friends',
      'en': '',
    },
    'fa2yxivp': {
      'es': 'Select users from below to start a chat.',
      'en': '',
    },
    'd9c0j2n3': {
      'es': 'Invite Friends',
      'en': '',
    },
    'tn7v0mnb': {
      'es': 'Selected',
      'en': '',
    },
    'whniodpm': {
      'es': 'Invite Friends',
      'en': '',
    },
    'nfduk16k': {
      'es': 'Select users from below to start a chat.',
      'en': '',
    },
    '91srbkd7': {
      'es': 'Home',
      'en': '',
    },
  },
  // image_Details
  {
    'r1rksukf': {
      'es': 'Home',
      'en': '',
    },
  },
  // comments
  {
    '89tuftu6': {
      'es': 'Comentarios',
      'en': '',
    },
    'b9z8ny47': {
      'es': 'Posted',
      'en': '',
    },
    'ezor66xs': {
      'es': 'Comenta Aqui...',
      'en': '',
    },
    'b93ibnw3': {
      'es': 'Post',
      'en': '',
    },
  },
  // createModal
  {
    'q8hikc2d': {
      'es': 'Crear Historia',
      'en': '',
    },
    'toc7zt0n': {
      'es': 'Comparte tu video.',
      'en': '',
    },
    'vhhbj6at': {
      'es': 'Crear Post',
      'en': '',
    },
    'i7rtwhbt': {
      'es': 'Comparte fotos en tu línea de tiempo.',
      'en': '',
    },
  },
  // deletePost
  {
    '2m970qnu': {
      'es': 'Borrar Post',
      'en': '',
    },
    'vp3fy476': {
      'es': 'Cancelar',
      'en': '',
    },
  },
  // deleteStory
  {
    'luye9t00': {
      'es': 'Borrar Historia',
      'en': '',
    },
    'ixjcgbo1': {
      'es': 'Cancelar',
      'en': '',
    },
  },
  // emptyList_1
  {
    'hjrn4r03': {
      'es': 'No hay Posts',
      'en': '',
    },
    'x3hftisa': {
      'es':
          'Parece que no hay publicaciones aquí. ¡Vuelve más tarde para ver las últimas novedades!',
      'en': '',
    },
  },
  // emptyList_2
  {
    'onl9b04c': {
      'es': 'No hay Mensajes',
      'en': '',
    },
    '5a1dcppz': {
      'es':
          'Parece que no tienes ningún mensaje con otros usuarios. Comienza una conversación a continuación.',
      'en': '',
    },
  },
  // postDetails_Base
  {
    '2zgihepd': {
      'es': 'Comments',
      'en': '',
    },
    'k8ftxw7b': {
      'es': 'Posted',
      'en': '',
    },
    '193pf7w0': {
      'es': 'Comentar Aquí ...',
      'en': '',
    },
    'an2x28mz': {
      'es': 'Post',
      'en': '',
    },
    'ohpfjp7h': {
      'es': 'Please fill in the comment...',
      'en': '',
    },
    'hbhqi48b': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // chat_DetailsOverlay
  {
    'ppnej94e': {
      'es': 'Group Chat ID: ',
      'en': '',
    },
    'ipxar2q1': {
      'es': 'In this chat',
      'en': '',
    },
    '0f6b9tzi': {
      'es': 'Close',
      'en': '',
    },
  },
  // chat_ThreadComponent
  {
    'dh8yef1w': {
      'es': 'Start typing here...',
      'en': '',
    },
    'eh2tihvs': {
      'es': 'You must enter a message...',
      'en': '',
    },
    'mivpywcs': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // user_ListSmall
  {
    'vmcju5vg': {
      'es': 'ME',
      'en': '',
    },
  },
  // deleteDialog
  {
    'k5y92ulj': {
      'es': 'Options',
      'en': '',
    },
    'ec5bwqrn': {
      'es': 'Invite Users',
      'en': '',
    },
    's2wgrbg7': {
      'es': 'Delete Chat',
      'en': '',
    },
    'bbg5uant': {
      'es': 'Confirm Delete',
      'en': '',
    },
    'pl8rqrld': {
      'es': 'You can\'t undo this action.',
      'en': '',
    },
    '2c92ctp4': {
      'es': 'Delete',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '1esdgpqp': {
      'es': '',
      'en': '',
    },
    'f78xytru': {
      'es': '',
      'en': '',
    },
    'pul4qg44': {
      'es': '',
      'en': '',
    },
    'rmux2prb': {
      'es': 'Coloque Huella',
      'en': '',
    },
    '5rnaahjz': {
      'es': 'Msg',
      'en': '',
    },
    '21feuhhb': {
      'es': '',
      'en': '',
    },
    'g5euvc6b': {
      'es': '',
      'en': '',
    },
    'rurx1j0m': {
      'es': '',
      'en': '',
    },
    '1op3m72t': {
      'es': '',
      'en': '',
    },
    '647uejbe': {
      'es': '',
      'en': '',
    },
    'wk03v9vf': {
      'es': '',
      'en': '',
    },
    'ampo9zh3': {
      'es': '',
      'en': '',
    },
    'bxhx6pbb': {
      'es': '',
      'en': '',
    },
    'xm80d7hy': {
      'es': '',
      'en': '',
    },
    'uecnzjnm': {
      'es': '',
      'en': '',
    },
    'pjwnzo7y': {
      'es': '',
      'en': '',
    },
    'zjb3v6g1': {
      'es': '',
      'en': '',
    },
    'u0vzm8wh': {
      'es': '',
      'en': '',
    },
    'lt586e6l': {
      'es': '',
      'en': '',
    },
    '2irl916p': {
      'es': '',
      'en': '',
    },
    '67arizzq': {
      'es': '',
      'en': '',
    },
    'rb17135h': {
      'es': '',
      'en': '',
    },
    'wklp2s47': {
      'es': '',
      'en': '',
    },
    'fbbe6i9v': {
      'es': '',
      'en': '',
    },
    '452d7qx2': {
      'es': '',
      'en': '',
    },
    'xco4wa1h': {
      'es': '',
      'en': '',
    },
    'b8r2o1go': {
      'es': '',
      'en': '',
    },
    'ouqca7vl': {
      'es': '',
      'en': '',
    },
    'qf0p82cg': {
      'es': '',
      'en': '',
    },
    'a8y8404z': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
