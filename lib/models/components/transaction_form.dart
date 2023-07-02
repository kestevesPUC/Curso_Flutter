import 'package:flutter/material.dart';

class TransactionFrom extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionFrom(this.onSubmit, {super.key});

  @override
  State<TransactionFrom> createState() => _TransactionFromState();
}

class _TransactionFromState extends State<TransactionFrom> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              controller: valueController,
              decoration: const InputDecoration(
                labelText: 'valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _submitForm(),
                  child: const Text('Nova Transalção'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
