import 'package:flutter/material.dart';

class Agendamento extends StatelessWidget {
  const Agendamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento'),
        backgroundColor: Colors.blue, // Cor da AppBar (opcional)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo à AGENDAMENTO!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Voltar para a tela anterior
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}