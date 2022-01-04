import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flufin/i18n/strings.g.dart';
import 'package:flufin/providers/providers.dart';
import 'package:flufin/services/services.dart';
import 'package:flufin/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class ServerForm extends StatelessWidget {
  const ServerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serverForm = Provider.of<ServerFormProvider>(context);

    return Form(
      key: serverForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.url,
            decoration: InputDecorations.globalInputDecoration(
              context: context,
              hintText: 'Eg: http://192.168.1.1:8096',
              labelText: t.serverAddress,
              prefixIcon: Icons.storage_rounded,
            ),
            onChanged: (value) => serverForm.address = value,
            validator: (value) {
              return isURL(
                value,
                requireTld: true,
                requireProtocol: true,
              )
                  ? null
                  : 'Error';
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 15,
              ),
              child: Text(
                serverForm.isLoading ? '${t.wait}...' : t.connect,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            onPressed: serverForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    if (!serverForm.isValidForm()) return;
                    serverForm.isLoading = true;

                    final server = Provider.of<ServerService>(
                      context,
                      listen: false,
                    );
                    try {
                      await server.connect(serverForm.address);
                      await server.saveServer(serverForm.address);
                      Navigator.pushReplacementNamed(context, 'login');
                    } catch (e, s) {
                      MessengerService.showSnakbar('Connection error');
                      serverForm.isLoading = false;
                      FirebaseCrashlytics.instance.recordError(e, s);
                    }
                  },
          )
        ],
      ),
    );
  }
}
