import 'package:carnava_admin_panel/models/car_model.dart';
import 'package:carnava_admin_panel/utils/utils.dart';
import 'package:carnava_admin_panel/view/navbar/home/car_edit/edit_car_view.dart';
import 'package:carnava_admin_panel/view/navbar/home/widgets/car_card_widget.dart';
import 'package:carnava_admin_panel/view_model/controllers/car/car_view_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final carViewController = Get.put(CarViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
              child: CupertinoSearchTextField(),
            ),
            Expanded(
              child: Obx(
                () {
                  return StreamBuilder<List<CarModel>>(
                    stream: carViewController.carStream.value,
                    builder: (context, snapshot) {
                      if (carViewController.isInitialLoad.value && snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text("No cars found"));
                      }

                      final carList = snapshot.data!;

                      return ListView.builder(
                        itemCount: carList.length,
                        itemBuilder: (context, index) {
                          final car = carList[index];
                          return CarCardWidget(
                            car: car,
                            onEdit: () {
                              Get.to(() => EditCarView(carModel: car));
                            },
                            onDelete: () {
                              Utils.alertDialog("Are you sure to delete this Car?", () {
                                carViewController.deleteCar(car.carId);
                                Get.back();
                              });
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
