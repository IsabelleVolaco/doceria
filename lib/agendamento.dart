import 'package:flutter/material.dart';

class Agendamento extends StatefulWidget {
  const Agendamento({super.key});

  @override
  _AgendamentoState createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {
  final _formKey = GlobalKey<FormState>();

  // Variáveis para armazenar os valores dos campos
  String? nome, email, telefone, saborBolo;
  DateTime? dataEntrega;

  // Lista de sabores de bolo
  final List<String> sabores = ['Chocolate', 'Morango', 'Baunilha', 'Coco'];

  // Validação de telefone: aceita apenas números
  String? _validarTelefone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu telefone';
    }
    final RegExp regex = RegExp(r'^\d{10,11}$'); // 10 ou 11 dígitos
    if (!regex.hasMatch(value)) {
      return 'Telefone inválido. Digite apenas números (10 ou 11 dígitos)';
    }
    return null;
  }

  // Validação de email
  String? _validarEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu email';
    }
    final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!regex.hasMatch(value)) {
      return 'Email inválido. Formato esperado: exemplo@dominio.com';
    }
    return null;
  }

  // Validação de data de entrega: não pode ser uma data no passado
  String? _validarDataEntrega(String? value) {
    if (dataEntrega == null) {
      return 'Por favor, selecione a data';
    }
    if (dataEntrega!.isBefore(DateTime.now())) {
      return 'A data de entrega não pode ser no passado';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento'),
        backgroundColor:  const Color(0xFF91FFDE),
      ),
      backgroundColor: const Color(0xFFFFE2EE),
      body: Center(
        child: Container(
          width: 500,
          height: 600,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Agende o seu bolo!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (value) => nome = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu nome';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (value) => email = value,
                    validator: _validarEmail, // Usando a função de validação de email
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (value) => telefone = value,
                    validator: _validarTelefone, // Usando a função de validação de telefone
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Sabor de Bolo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: sabores.map((sabor) {
                      return DropdownMenuItem<String>(
                        value: sabor,
                        child: Text(sabor),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        saborBolo = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Por favor, selecione um sabor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Data de Entrega',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(), // Não permite datas passadas
                        lastDate: DateTime(2101),
                      );
                      if (selectedDate != null && selectedDate != dataEntrega) {
                        setState(() {
                          dataEntrega = selectedDate;
                        });
                      }
                    },
                    readOnly: true,
                    controller: TextEditingController(
                      text: dataEntrega != null
                          ? '${dataEntrega?.day}/${dataEntrega?.month}/${dataEntrega?.year}'
                          : '',
                    ),
                    validator: _validarDataEntrega, // Usando a função de validação de data
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        // Processar o envio do formulário
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Agendamento Confirmado'),
                            content: Text(
                              'Nome: $nome\nEmail: $email\nTelefone: $telefone\nSabor: $saborBolo\nData de Entrega: ${dataEntrega?.day}/${dataEntrega?.month}/${dataEntrega?.year}',
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text('Enviar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}