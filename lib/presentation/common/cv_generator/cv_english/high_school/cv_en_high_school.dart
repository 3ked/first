import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../../domain/models/models.dart';
import 'widgets/school_en_bottom_row.dart';
import 'widgets/school_en_top_row.dart';

pw.Stack cvEnHighSchool(
  pw.Font ttf,
  Uint8List image,
  pw.Font myIcon,
  pw.Font ttfIcon,
  Cvfile cvfile,
  CvFormat cvFormat,
  PdfColor pdfPageColor,
  PdfColor pdfFontColor,
) {
  return pw.Stack(
    children: [
      pw.Container(
        color: pdfPageColor,
        width: 21.0 * PdfPageFormat.cm,
        height: 30.0 * PdfPageFormat.cm,
      ),
      pw.Positioned(
          top: 0.5 * PdfPageFormat.cm,
          left: 0.5 * PdfPageFormat.cm,
          child: pw.Container(
            width: 20.0 * PdfPageFormat.cm,
            height: 29.0 * PdfPageFormat.cm,
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                schoolEnTopRow(
                    image, ttf, myIcon, ttfIcon, cvfile, cvFormat, pdfPageColor, pdfFontColor),
                schoolEnBottomRow(ttf, cvfile, cvFormat),
              ],
            ),
          )),
    ],
  );
}
