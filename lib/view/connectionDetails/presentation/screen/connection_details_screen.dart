import 'package:flutter/material.dart';
import '../../../myConnections/data/model/connection_model.dart';
import '../widget/connection_details_appbar.dart';
import '../widget/connection_details_body.dart';

class ConnectionDetailsScreen extends StatelessWidget {
  ConnectionDetailsScreen({Key? key, required this.getData}) : super(key: key);

  final ConnectionData getData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConnectionDetailsAppBar(),
      body: ConnectionDetailsBody(
        getData: getData,
      ),
    );
  }
}
