import 'package:flutter/material.dart';

import 'util.dart';
import 'widget/constants.dart';
import 'widget/custom/custom_text_button.dart';
import 'widget/custom/custom_text_form_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController gasolinaController = TextEditingController();
  final TextEditingController etanolController = TextEditingController();
  String resultado = '';

  @override
  void dispose() {
    gasolinaController.dispose();
    etanolController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.getStandardColor(context),
        centerTitle: true,
        title: Text(
          'Gasolina ou etanol',
          style: TextStyle(
            color: Constants.getTextColor(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Constants.getStandardColor(context),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(isLightTheme
                      ? 'assets/images/fuel_preto.png'
                      : 'assets/images/fuel_branco.png'),
                ),
              ),
              const SizedBox(height: 50),
              CustomTextFormField(
                controller: gasolinaController,
                labelText: 'Gasolina',
                hintText: 'R\$ 0,00',
              ),
              CustomTextFormField(
                controller: etanolController,
                labelText: 'Etanol',
                hintText: 'R\$ 0,00',
              ),
              CustomTextButton(
                onPressed: () {
                  calcular(
                    gasolinaController: gasolinaController,
                    etanolController: etanolController,
                    onResultadoCalculado: (result) {
                      setState(() {
                        resultado = result;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                resultado,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Constants.getTextColor(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
