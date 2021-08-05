import 'dart:math';
import 'package:flutter/material.dart';
import 'package:demo1/widget/particle/particle_model.dart';

class ParticlesWidget extends StatefulWidget {
  final int numberOfParticles;
  // ParticlesWidget({Key key}) : super(key: key);
  ParticlesWidget(this.numberOfParticles);

  @override
  _ParticlesWidgetState createState() {
    return _ParticlesWidgetState();
  }
}

class _ParticlesWidgetState extends State<ParticlesWidget> {
  final Random random = Random();
  final List<ParticleModel> particles = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}