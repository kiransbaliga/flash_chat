import 'package:flutter/material.dart';


class Txtfield extends StatelessWidget {
  const Txtfield({
   this.hinttext,
   this.b,
   @required this.onchanged
  }
  ) ;
  final String hinttext;
  final Function onchanged;
  final bool b;
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:b,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
        
      ),
      onChanged:onchanged,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey,),
        hintText: hinttext,
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
