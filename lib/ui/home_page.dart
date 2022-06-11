import 'package:aula_pos_01/ui/widgets/field_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _etanolController = TextEditingController();
  final _gasolinaController = TextEditingController();
  var _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.monetization_on_outlined),
            Text(' Etanol x Gasolina')
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _calculate, icon: const Icon(Icons.attach_money)),
        ],
      ),
      body: Column(
        children: [
          FieldText(
              controller: _etanolController,
              text: 'Valor do Etanol',
              prefix: 'R\$ '),
          FieldText(
              controller: _gasolinaController,
              text: 'Valor da Gasolina',
              prefix: 'R\$ '),
          ElevatedButton(
            onPressed: _calculate,
            child: const Text('Calcular'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculate,
        child: const Icon(Icons.attach_money),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Etanol x Gasolina',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.attach_money, color: Colors.black),
                  Text(
                    'Calcular',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onTap: _calculate,
            ),
          ],
        ),
      ),
    );
  }

  void _calculate() {
    double etanol =
        double.tryParse(_etanolController.text.replaceAll(',', '.')) ?? 0;
    double gasolina =
        double.tryParse(_gasolinaController.text.replaceAll(',', '.')) ?? 0;

    if (etanol <= 0) {
      showMessage('Valor do Etanol inválido!');
      return;
    }

    if (gasolina <= 0) {
      showMessage('Valor da Gasolina inválido!');
      return;
    }

    if (etanol <= (gasolina * 0.7)) {
      _result = 'Abasteça com Etanol';
    } else {
      _result = 'Abasteça com Gasolina';
    }

    showMessage(_result);
    setState(() {});
  }

  void showMessage(String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Atenção'),
            content: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK')),
            ],
          );
        });
  }
}
