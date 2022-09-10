
import 'package:flutter/material.dart';


// this method | function can navigate beetween activities
void startActivity(BuildContext _from_context, Widget _to_builder) {

  var route = MaterialPageRoute(
      builder: (context) => _to_builder
  );

    Navigator.of(_from_context).push(route);
}