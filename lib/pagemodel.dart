import 'package:flutter/material.dart';

class PageModel {
  String _title;
  String _description;
  IconData _icons;
  String _image;

  PageModel(this._title, this._description, this._icons, this._image);

  String get image => _image;

  IconData get icons => _icons;

  String get description => _description;

  String get title => _title;
}
