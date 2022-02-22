import 'package:flutter/material.dart' deferred as M show runApp;
import 'package:get/get.dart' deferred as G show GetMaterialApp;
import 'app/routes/app_pages.dart' deferred as AppPage;

void main() async {
  await G.loadLibrary();
  await AppPage.loadLibrary();
  await M.loadLibrary();
  M.runApp(
    G.GetMaterialApp(
      title: "Application",
      initialRoute: AppPage.AppPages.INITIAL,
      getPages: AppPage.AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
