import 'package:flutter/material.dart';

class NumberKey extends StatelessWidget {
  const NumberKey({ Key key,@required this.num,@required this.callback }) : super(key: key);
  final String num;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 6,
      width: MediaQuery.of(context).size.width /5,
      child: ElevatedButton(
          child: Text(num),
          onPressed: callback,
          style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              //side: BorderSide(color: Colors.red)
            ),
          ))),
    );
  }
}
