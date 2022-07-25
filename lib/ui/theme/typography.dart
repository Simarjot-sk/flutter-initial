import 'package:flutter/material.dart';

class Font {
  var _textStyle = const TextStyle();

  TextStyle get s150 => _textStyle.copyWith(fontSize: 150);

  TextStyle get s40 => _textStyle.copyWith(fontSize: 40);

  TextStyle get s36 => _textStyle.copyWith(fontSize: 36);

  TextStyle get s32 => _textStyle.copyWith(fontSize: 32);

  TextStyle get s24 => _textStyle.copyWith(fontSize: 24);

  TextStyle get s20 => _textStyle.copyWith(fontSize: 20);

  TextStyle get s18 => _textStyle.copyWith(fontSize: 18);

  TextStyle get s16 => _textStyle.copyWith(fontSize: 16);

  TextStyle get s14 => _textStyle.copyWith(fontSize: 14);

  TextStyle get s13 => _textStyle.copyWith(fontSize: 13);

  TextStyle get s12 => _textStyle.copyWith(fontSize: 12);

  TextStyle get s10 => _textStyle.copyWith(fontSize: 10);

  TextStyle get s9 => _textStyle.copyWith(fontSize: 9);
}

class Gilroy extends Font {
  Gilroy.medium([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  Gilroy.regular([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  Gilroy.semiBold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }

  Gilroy.bold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  Gilroy.boldUnderline([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Gilroy',
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }
}

class Poppins extends Font {
  Poppins.regular([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  Poppins.medium([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  Poppins.semiBold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }
}

class Monrope extends Font {
  Monrope.medium([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Monrope',
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }
}

class Argandir extends Font {
  Argandir.bold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Argandir',
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  Argandir.heavy([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Argandir',
      fontWeight: FontWeight.w800,
      color: color ?? Colors.black,
    );
  }
}

class Inter extends Font {
  Inter.regular([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }
}

class SixCaps extends Font {
  SixCaps.regular([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'SixCaps',
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }
}
