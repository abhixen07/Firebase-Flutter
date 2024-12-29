import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text('Posts',
            style: GoogleFonts.montserrat(
                color: Colors.white,fontWeight: FontWeight.w700
            )),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.logout_rounded,color: Colors.white,))
        ],
      ),
    );
  }
}
