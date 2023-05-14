import 'package:flutter/material.dart';
import 'package:flutter_ocr/src/screens/home/home_bloc.dart';
import 'package:flutter_ocr/src/screens/home/home_events.dart';
import 'package:flutter_ocr/src/services/file_picker/file_picker_interface.dart';
import 'package:flutter_ocr/src/services/ocr/ocr_interface.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key, required this.filePicker, required this.ocr});
  final IFilePicker filePicker;
  final IOcr ocr;

  late var bloc = HomeBloc(Initial(), filePicker: filePicker, ocr: ocr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offline OCR Demo"),
        actions: [
          IconButton(onPressed: bloc.reset, icon: const Icon(Icons.restore)),
        ],
      ),
      body: ValueListenableBuilder<HomeState>(
        valueListenable: bloc,
        builder: (context, value, child) {
          if (value is Loading) {
            return _loading();
          } else if (value is Initial) {
            return _initial();
          } else if (value is Loaded) {
            return _body();
          }
          return _exception();
        },
      ),
    );
  }

  Widget _loading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (bloc.value is Loaded)
          Expanded(
            child: SingleChildScrollView(
              child: Image.file(bloc.file!, fit: BoxFit.cover,),
            ),
          ),
        if (bloc.value is AnalyzedImage)
          Expanded(
            child: SingleChildScrollView(
              child: SelectableText(bloc.text),
            ),
          ),
        if (bloc.value is! AnalyzedImage)
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: bloc.analyzeReceipt,
                child: const Text("Analyze"),
              ),
            ),
          )
      ],
    );
  }

  Widget _initial() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: bloc.pickImageFromGallery,
          child: const Text("Pick Image"),
        ),
        ElevatedButton(
          onPressed: bloc.pickImageFromCamera,
          child: const Text("Capture Image"),
        ),
      ],
    );
  }

  Widget _exception() {
    return const Center(
        child: Text(
      "Something went wrong",
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    ));
  }
}
