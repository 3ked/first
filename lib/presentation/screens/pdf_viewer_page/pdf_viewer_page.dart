import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  PDFViewController? _controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final file = ModalRoute.of(context)!.settings.arguments as dynamic;

    final name = basename(file.path);
    final text = "${indexPage + 1} - $pages";

    return Scaffold(
      appBar: AppBar(title: Text(name), actions: [
        Center(
          child: Text(text),
        ),
        IconButton(
            onPressed: () {
              final page = indexPage == 0 ? pages : indexPage - 1;
              _controller!.setPage(page);
            },
            icon: const Icon(Icons.chevron_left, size: 32)),
        IconButton(
            onPressed: () {
              final page = indexPage == pages - 1 ? 0 : indexPage + 1;
              _controller!.setPage(page);
            },
            icon: const Icon(Icons.chevron_right, size: 32)),
      ]),
      body: PDFView(
        filePath: file.path,
        pageSnap: false,
        autoSpacing: false,
        enableSwipe: true,
        pageFling: false,
        onRender: (_pages) {
          setState(() {
            pages = _pages!;
            //isReady = true;
          });
        },
        // onError: (error) {
        //   print(error.toString());
        // },
        // onPageError: (page, error) {
        //   print('$page: ${error.toString()}');
        // },
        onViewCreated: (PDFViewController pdfViewController) {
          setState(() => _controller = pdfViewController);
          //_controller.complete(pdfViewController);
        },
        onPageChanged: (indexPage, _) => setState(() {
          this.indexPage = indexPage!;
        }),
        // onPageChanged: (int page, int total) {
        //   print('page change: $page/$total');
        // },
      ),
    );
  }
}
