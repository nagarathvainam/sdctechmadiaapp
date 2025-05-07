import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clock/clock.dart';
import 'package:intl/intl.dart';

// ignore_for_file: must_be_immutable
class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setuserid(String value) {
    return _sharedPreferences!.setString('userid', value);
  }

  String getuserid() {
    try {
      return _sharedPreferences!.getString('userid')!;
    } catch (e) {
      return "";
    }
  }

  Future<void> setname(String value) {
    return _sharedPreferences!.setString('name', value);
  }

  String getname() {
    try {
      return _sharedPreferences!.getString('name')!;
    } catch (e) {
      return "";
    }
  }

  Future<void> setRgrefcode(int value) {
    return _sharedPreferences!.setInt('rgrefcode', value);
  }

  int getRgrefcode() {
    try {
      return _sharedPreferences!.getInt('rgrefcode') ?? 0;
    } catch (e) {
      return 0;
    }
  }
  Future<void> setdistributorcircuit(String value) {
    return _sharedPreferences!.setString('adddistflimcirciut', value);
  }

  String getdistributorcircuit() {
    try {
      return _sharedPreferences!.getString('adddistflimcirciut')!;
    } catch (e) {
      return "";
    }
  }
  Future<void> setsameasbilling(String value) {
    return _sharedPreferences!.setString('sameasbilling', value);
  }

  String getsameasbilling() {
    try {
      return _sharedPreferences!.getString('sameasbilling')!;
    } catch (e) {
      return "";
    }
  }
  Future<void> setRateCardEditId(String value) {
    return _sharedPreferences!.setString('RateCardEditId', value);
  }

  String getRateCardEditId() {
    try {
      return _sharedPreferences!.getString('RateCardEditId')!;
    } catch (e) {
      return "";
    }
  }
  // Fund Transfer Data Storage
}
