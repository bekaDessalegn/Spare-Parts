import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneValidators extends StatefulWidget {
  const PhoneValidators({Key? key}) : super(key: key);

  @override
  State<PhoneValidators> createState() => _PhoneValidatorsState();
}

class _PhoneValidatorsState extends State<PhoneValidators> {

  final formKey = GlobalKey<FormState>();
  final phoneController = PhoneController(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            PhoneFormField(
              key: Key('phone-field'), // controller & initialValue value
              initialValue: null,   // can't be supplied simultaneously
              shouldFormat: true  ,  // default
              defaultCountry: IsoCode.US, // default
              decoration: InputDecoration(
                  labelText: 'Phone',          // default to null
                  border: OutlineInputBorder() // default to UnderlineInputBorder(),
                // ...
              ),
              validator: PhoneValidator.compose([
                // list of validators to use
                PhoneValidator.required(errorText: "You must enter a value"),
                PhoneValidator.valid(),
                // ..
              ]), // default PhoneValidator.valid()
              isCountryChipPersistent: false, // default
              isCountrySelectionEnabled: true, // default
              countrySelectorNavigator: CountrySelectorNavigator.bottomSheet(),
              showFlagInInput: true,  // default
              flagSize: 16,           // default
              autofillHints: [AutofillHints.telephoneNumber], // default to null
              enabled: true,          // default
              autofocus: false,       // default// default null
              // ... + other textfield params
            ),
            SizedBox(height: 50,),
            PhoneFormField(
              controller: phoneController,
              defaultCountry: IsoCode.ET,
              decoration: InputDecoration(
                hintText: "Enter your phone number",
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              if(formKey.currentState!.validate()){
                print(phoneController.value);
                print(phoneController.value!.countryCode);
                print(phoneController.value!.nsn);
              }
            }, child: Text("Click Me"))
          ],
        ),
      ),
    );
  }
}
