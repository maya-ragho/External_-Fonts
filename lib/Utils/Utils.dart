import 'package:externalfont/TextStyle.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';

class Utils {
  var onTap;

  var width;

  var title;

  var onTextChanged;

  var hint;

  var controller;

  var bgColor;

  var context;

  Utils({
    this.width,
    this.onTap,
//    this.onTapIcon,
    this.title,
    this.onTextChanged,
    this.hint,
    this.controller,
    this.bgColor,
    this.context,
  });

  static progressBar(double height, double width,
      {required Alignment alignment}) {
    return Container(
        margin: EdgeInsets.all(10.0),
        alignment: alignment,
        child: SizedBox(
          height: height,
          width: width,
          child: CircularProgressIndicator(),
        ));
  }

  text(context, text, double size, color, TextAlign alignment) {
    //multiline
    return Text(
      Utils.getBlankIfNull(text.toString()),
      textAlign: alignment,
      maxLines: null,
      style: TextStyle(color: color),
    );
  }

  Widget textField() {
    //Material
    return TextField(
        controller: controller,

        style: const TextStyle(
            fontFamily: FontFamily.extraBold,
            fontSize: 16.0,
            color: Colors.black54),
        autofocus: true,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: hint,
          labelStyle: const TextStyle(color: Colors.black54),
          fillColor: bgColor,
          filled: true,
        ),
        onChanged: onTextChanged);
  }
  Widget textFormField() {
    //Material
    return TextFormField(
        controller: controller,
        style: const TextStyle(
            fontFamily: FontFamily.extraBold,
            fontSize: 16.0,
            color: Colors.black54),
        autofocus: true,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: hint,
          labelStyle: const TextStyle(color: Colors.black54),
          fillColor: Colors.white,
          filled: true,
        ),
        onChanged: onTextChanged);
  }

  Widget button({required Color Ucolor, required double borderRadius}) {
    return TextButton(
      //RaisedButton
      onPressed: () {
        onTap();
        // print("button clicked");
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color: AppColors.blue)))),
      // ElevatedButton.styleFrom(
      //     textStyle:
      //         const TextStyle(fontSize: 20, color: AppColors.white)),
      child: Text(
        title,
        style: const TextStyle(color: AppColors.blue),
      ),
    );
  }

  imageAsset( path, double size) {
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: Image.asset(
              path,
              height: size,
              fit: BoxFit.contain,
            ),
          )
        : Image.asset(
            path,
            height: size,
            fit: BoxFit.contain,
          );
  }

  imageNetwork( String path, double size) {
    path ?? "";
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: Image.network(
              path,
              height: size,
              fit: BoxFit.contain,
            ),
          )
        : Image.network(
            path,
            height: size,
            fit: BoxFit.contain,
          );
  }

  static String getBlankIfNull(String str) {
    return "";
  }

  showDialogBox(
      {required BuildContext context, required String networkimageurl}) {
    return showDialog(
      context: context,
      builder: (context) {
        return zoomImage(networkimageurl, context);
      },
    );
  }

  zoomImage(String imageurl, BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                InteractiveViewer(
                    panEnabled: false,
                    // boundaryMargin: EdgeInsets.all(100),
                    child: Utils().imageNetwork(imageurl, 460))
              ],
            )));
  }
// appBarBB() {
//   //BackButton
//   return Container(
//       decoration:  const BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.rectangle,
//         // borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey,
//             blurRadius: 10.0,
//             offset: Offset(0.0, 5.0),
//           ),
//         ],
//       ),
//       // alignment: Alignment.centerLeft,
//       padding: EdgeInsetsDirectional.only(
//           start:16.0, end: 16.0),
//       height: 56.0,
//       // decoration: BoxDecoration(color: Colors.white),
//       child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//         // GestureDetector(
//         //   onTap: () {
//         //     if (onTap == null) {
//         //       Navigator.pop(context);
//         //     } else
//         //       onTap();
//         //   },
//          Image.asset(
//             "assets/images/BackArrow@3x.png",
//            height: 25,
//             width: 25,color:
//             AppColors.black,
//           ),
//         // ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//             child: text(context, title, 20,
//                 AppColors.black , TextAlign.start)), //bgAppBar
//       ]));
// }
}
