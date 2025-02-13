import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFE2EE), // Fundo rosa claro
        appBar: AppBar( // APPBAR --------------------------------------------------------------------
          title: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'A Doceria Confeiteira',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF91FFDE), 
          toolbarHeight: 80.0, 
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container( // NAVBAR --------------------------------------------------------------------
              color: const Color(0xFF73CEB4), 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row( // Botões 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Agendamento',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Doces',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Contato',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            // Container branco --------------------------------------------------------------------
            width: 500,
            height: 450,
            alignment:
                Alignment.center, //Itens do container centralizados nele mesmo
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  // Texto 1  --------------------------------------------------------------------
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    'Bem-vindo à nossa doceria! Venha conhecer os melhores doces da cidade!',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  // Imagem  --------------------------------------------------------------------
                  width: 400,
                  height: 245,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Borda arredondada
                    child: Image.asset( '../assets/baker.jpg', fit: BoxFit.cover ),
                  ),
                ),
                const Padding(
                  // Texto 2  --------------------------------------------------------------------
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    'A mistura perfeita entre sabor e carinho.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
