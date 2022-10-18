import '../../../domain/models/models.dart';
import 'cv_english/high_school/cv_en_high_school.dart';
import '../../resources/assets_manager.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../resources/constants_manager.dart';
import 'cv_arabic/college_degree/cv_ar_college_degree.dart';
import 'cv_arabic/high_school/cv_ar_high_school.dart';
import 'cv_arabic/skill_based/cv_ar_skill_based.dart';
import 'cv_english/college_degree/cv_en_college_degree.dart';
import 'cv_english/skill_based/cv_en_skill_based.dart';

class CVPdfGenerator {
  Future<pw.Document> generate({
    required Cvfile cvFile,
    required CvFormat cvFormat,
    required String cvCertificate,
    required int pageValue,
    required int fontValue,
  }) async {
    final pdf = pw.Document();
    final image = (await rootBundle.load(ImageAssets.emptyProfile)).buffer.asUint8List();

    final font = await rootBundle.load(FontAssets.hacenTunisia);
    final ttf = pw.Font.ttf(font);

    final iconFont = await rootBundle.load(FontAssets.icofont);
    final myIcon = pw.Font.ttf(iconFont);

    final icon = await rootBundle.load(FontAssets.materialIcons);
    final ttfIcon = pw.Font.ttf(icon);

    var pdfPageColor = PdfColor.fromInt(pageValue);
    var pdfFontColor = PdfColor.fromInt(fontValue);
    pdf.addPage(
      pw.Page(
          pageFormat: const PdfPageFormat(21.0 * PdfPageFormat.cm, 30.0 * PdfPageFormat.cm,
              marginAll: 0 * PdfPageFormat.cm),
          theme: pw.ThemeData.withFont(
            base: ttf,
            icons: myIcon,
            fontFallback: [ttfIcon],
          ),
          build: (pw.Context context) {
            switch (cvCertificate) {
              case AppConstants.arCollegeDegree:
                return cvArCollegeDegree(
                    ttf, image, myIcon, ttfIcon, cvFile, cvFormat, pdfPageColor, pdfFontColor);
              case AppConstants.arHighSchool:
                return cvArHighSchool(
                    ttf, image, myIcon, ttfIcon, cvFile, cvFormat, pdfPageColor, pdfFontColor);
              case AppConstants.arSkillbased:
                return cvArSkillBased(
                    ttf, image, myIcon, ttfIcon, cvFile, cvFormat, pdfPageColor, pdfFontColor);
              case AppConstants.enCollegeDegree:
                return cvEnCollegeDegree(
                    ttf, image, myIcon, ttfIcon, cvFile, cvFormat, pdfPageColor, pdfFontColor);
              case AppConstants.enHighSchool:
                return cvEnHighSchool(
                    ttf, image, myIcon, ttfIcon, cvFile, cvFormat, pdfPageColor, pdfFontColor);
              case AppConstants.enSkillbased:
                return cvEnSkillBased(
                    ttf, image, myIcon, ttfIcon, cvFile, cvFormat, pdfPageColor, pdfFontColor);
              default:
                return cvArCollegeDegree(
                    ttf, image, myIcon, ttfIcon, cvFile, cvFormat, pdfPageColor, pdfFontColor);
            }
          }),
    );

    return pdf;
  }
}
