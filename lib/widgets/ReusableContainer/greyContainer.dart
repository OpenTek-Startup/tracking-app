import 'package:flutter/material.dart';

class Greycontainer extends StatelessWidget {
  final Widget child;
  const Greycontainer({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.79,
            decoration: BoxDecoration(
                color: Color.fromRGBO(241, 241, 241, 1),
                borderRadius:BorderRadius.all(Radius.circular(30)),

            ),
            child: child,
          )
        ],
      ),
    );
  }
}
