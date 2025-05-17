import 'package:flutter/material.dart';

IconButton iconButtonFunc({required VoidCallback onPressFunc , required Widget customIcon}){
  return IconButton(onPressed: () => onPressFunc, icon: customIcon);
}