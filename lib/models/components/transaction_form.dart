import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionFrom extends StatefulWidget {
  final void Function(String, double, DateTime?) onSubmit;

  const TransactionFrom(this.onSubmit, {super.key});

  @override
  State<TransactionFrom> createState() => _TransactionFromState();
}

class _TransactionFromState extends State<TransactionFrom> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              controller: _valueController,
              decoration: const InputDecoration(
                labelText: 'valor (R\$)',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? "Nenhuma data selecionada!"
                      : 'Data selecionada: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'),
                ),
                TextButton(
                  child: const Text("Selecionar data"),
                  onPressed: _showDatePicker,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                  ),
                  child: const Text('Nova Transação'),
                  onPressed: () => _submitForm(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
