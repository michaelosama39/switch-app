import 'package:flutter/cupertino.dart';
import 'package:switch_app/localization/language_constants.dart';

class Validator {
  static String? generalField(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else
      return null;
  }

  static String? email(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (!value.contains('@') || !value.contains('.'))
      return translation(context).examplemailcom;
    else
      return null;
  }

  static String? phoneNumber(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (!value.startsWith('01'))
      return translation(context).mobileNumberMustStartWith;
    else if (value.length != 11)
      return translation(context).mobileNumberMustConsistOf;
    else
      return null;
  }

  static String? pinCode(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.length != 4)
      return translation(context).theCodeMustConsistOf;
    else
      return null;
  }

  static String? password(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.length < 3)
      return translation(context).passwordMustNotBeLessThan;
    else
      return null;
  }

  static String? confirmPassword(BuildContext context , String value, String password) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.length < 6)
      return translation(context).passwordMustNotBeLessThan;
    else if (password != value)
      return translation(context).passwordDoesNotMatch;
    else
      return null;
  }

  static String? name(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.length < 4)
      return translation(context).theNameMustBeAtLeast;
    else
      return null;
  }

  static String? notes(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else
      return null;
  }

  static String? enquiry(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.length < 10 || value.length > 3000)
      return translation(context).yourMessageMustBeLongerThan;
    else
      return null;
  }

  static String? search(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else
      return null;
  }

  static String? address(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.length < 10 || value.length > 50)
      return translation(context).titleMustBeGreaterThan;
    else
      return null;
  }

  static String? day(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.contains('.') ||
        value.contains(',') ||
        value.contains('-') ||
        value.contains('_'))
      return translation(context).wrongContent;
    else if (int.parse(value) < 1 || int.parse(value) > 31)
      return '1 - 31';
    else if (value.length > 2)
      return translation(context).wrongContent;
    else
      return null;
  }

  static String? month(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.contains('.') ||
        value.contains(',') ||
        value.contains('-') ||
        value.contains('_'))
      return translation(context).wrongContent;
    else if (int.parse(value) < 1 || int.parse(value) > 12)
      return '1 - 12';
    else if (value.length > 2)
      return translation(context).wrongContent;
    else
      return null;
  }

  static String? year(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.contains('.') ||
        value.contains(',') ||
        value.contains('-') ||
        value.contains('_'))
      return translation(context).wrongContent;
    else if (int.parse(value) < 1950 || int.parse(value) > 2020)
      return '1950 - 2020';
    else if (value.length > 4)
      return translation(context).wrongContent;
    else
      return null;
  }

  static String? comment(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.length < 25)
      return translation(context).commentMustBeGreaterThan;
    else
      return null;
  }

  static String? report(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.length < 5)
      return translation(context).theReportMustBeLongerThan;
    else
      return null;
  }

  static String? productTitle(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.length < 4)
      return translation(context).productTitleMustBeGreaterThan;
    else
      return null;
  }

  static String? productDetails(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else if (value.length < 10)
      return translation(context).detailsMustBeLongerThan;
    else
      return null;
  }

  static String? productPrice(BuildContext context , String value) {
    if (value.isEmpty)
      return translation(context).emptyField;
    else
      return null;
  }
}