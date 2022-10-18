import 'dart:typed_data';
import '../../../../../domain/models/models.dart';
import 'widgets/skill_ar_bottom_row.dart';
import 'widgets/skill_ar_top_row.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Stack cvArSkillBased(
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
                skillArTopRow(
                    image, ttf, myIcon, ttfIcon, cvfile, cvFormat, pdfPageColor, pdfFontColor),
                skillArBottomRow(ttf, cvfile, cvFormat),
              ],
            ),
          )),
    ],
  );
}
