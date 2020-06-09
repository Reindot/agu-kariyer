import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class ViewFilePage extends StatefulWidget {
  final doc;

  const ViewFilePage({Key key, this.doc}) : super(key: key);
  @override
  _ViewFilePageState createState() => _ViewFilePageState();
}

class _ViewFilePageState extends State<ViewFilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PDFViewer(document: widget.doc,),
    );
  }
}
