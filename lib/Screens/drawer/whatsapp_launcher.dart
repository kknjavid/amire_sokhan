import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

Future drawerLaunchWhatsApp() async {
  const link = WhatsAppUnilink(phoneNumber: "0989397195490", text: "سلام");
  await launch(link.toString());
}

