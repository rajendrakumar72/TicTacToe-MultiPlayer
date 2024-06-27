import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/resources/socket_methods.dart';
import 'package:tic_tac_toe_app/responsive/responsive.dart';
import 'package:tic_tac_toe_app/widgets/custom_button.dart';
import 'package:tic_tac_toe_app/widgets/custom_text.dart';
import 'package:tic_tac_toe_app/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName='/create_room_screen';

  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController=TextEditingController();
  final SocketMethod _socketMethods =SocketMethod();


  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }


  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(shadows: [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 40
                )
              ], text: 'Create Room', fontSize: 70),
              SizedBox(height: size.height*0.08),
              CustomTextField(controller: _nameController, hintText: 'Enter your nickname'),
              SizedBox(height: size.height*0.08),
              CustomButton(onTab: ()=>_socketMethods.createRoom(_nameController.text), btnText: 'Create')
            ],
          ),
        
        ),
      ),
    );
  }
}
