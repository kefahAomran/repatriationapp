import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../Model/configrationModel.dart';

 String? Token;
var showcaseFirst = true.obs;
var countNot = 0.obs;

late TabController controllerTab;
String languagee = Platform.localeName.split('_')[0];

num? familyId;
UserInfo? userInfo;
List<Country> country = [];
List<Living> living = [];
List<Need>  need = [];
List<Craft> craft = [];
List<Health> health = [];
List<Doctype> doctype = [];
List<Exittype> exittype = [];
List<Charity> charity = [];
List<Zone> zone = [];
List<Marriage> marriage = [];
List<Donation> donation = [];
List<Job> job = [];
List<Region> region = [];
List<Diplom> diplom = [];
List<Relative> relative = [];
List<Residencetype> residencetype = [];
