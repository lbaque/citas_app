import 'package:flutter/material.dart';

const colorapp = Color.fromRGBO(252, 34, 193, 1);

const textInputDecoration = InputDecoration(
  labelText: '',
  labelStyle: TextStyle(fontSize: 17),
  contentPadding: EdgeInsets.symmetric(vertical: 10),
  alignLabelWithHint: true,
);

const FOOD_DATA = [
  {
    "name": "Cosultas",
    "brand": "Generales",
    "price": 2.99,
    "image": "consultas.png"
  },
  {
    "name": "Proflaxis",
    "brand": "Dentales",
    "price": 1.49,
    "image": "profilaxis.png"
  },
  {
    "name": "Exodoncias",
    "brand": "Extracciones",
    "price": 2.99,
    "image": "exodoncia.png"
  },
  {
    "name": "Restauraciones",
    "brand": "Curaciones",
    "price": 6.99,
    "image": "restauraciones.png"
  },
  {
    "name": "Cirugía",
    "brand": "Complejas y de terceros",
    "price": 6.99,
    "image": "cirujia.png"
  },
  {"name": "Molares", "brand": "", "price": 6.99, "image": "molares.png"},
  {
    "name": "Endodoncias",
    "brand": "",
    "price": 6.99,
    "image": "endodoncia.png"
  },
  {
    "name": "Ortodoncia",
    "brand": "Brackets",
    "price": 6.99,
    "image": "ortodoncia.png"
  },
  {
    "name": "Controles de",
    "brand": "Ortodoncia",
    "price": 6.99,
    "image": "control_ortodoncia.png"
  },
  {
    "name": "Caries",
    "brand": "Detantales",
    "price": 6.99,
    "image": "caries.png"
  },
  {
    "name": "Aclaramiento",
    "brand": "",
    "price": 6.99,
    "image": "aclaramiento.png"
  },
  {
    "name": "Diseño",
    "brand": "De sonrisa",
    "price": 6.99,
    "image": "diseno.png"
  },
];
