
import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({required Key? key}) : super(key:key);

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState> ();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Select Range"),
    ),
    body: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            RangeSelectorTextFormField(
              labelText: 'Minimum',
              intValueSetter: (value) => _min = value,
            ),
            SizedBox(height: 12),
             RangeSelectorTextFormField(
              labelText: 'Maximum',
              intValueSetter: (value) => _max = value,
            ),
        ],
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: const Icon(IconData(0xe09b, fontFamily: 'MaterialIcons', matchTextDirection: true),
      ),
      onPressed:() {
        if(formKey.currentState?.validate() == true){
          formKey.currentState?.save();
        }
        // TODO: Navigate to  the generator page
      },
      ),
  );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
   RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  void Function(int value) intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        border:OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if(value == null || int.tryParse(value) == null) {
          return 'it is an integer';
        }else{
          return null;
        }
      },
      onSaved :(newValue) => intValueSetter(int.parse(newValue?? '')),
    );
  }
}