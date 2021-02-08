import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_presenter.dart';

import '../../../helpers/helpers.dart';

class LoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return RaisedButton(
            onPressed: snapshot.data == true
                ? presenter.auth
                : null,
            child: Text(R.string.signIn),
          );
        });
  }
}