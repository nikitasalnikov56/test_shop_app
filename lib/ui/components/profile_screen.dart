import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shop_app/domain/manager/auth_provider.dart';
import 'package:shop_app/domain/manager/get_user_data_db_provider.dart';
import 'package:shop_app/ui/style/app_style.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    capitalize(String str) =>
        str[0].toUpperCase() + str.substring(1).toLowerCase();
    final currentUser = ref.watch(currentUserProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 28),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const CircleAvatar(
              radius: 80,
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                text: 'Ваше имя:  ',
                style: AppStyle.fontStyle,
                children: [
                  TextSpan(
                    text: capitalize(currentUser.name.toString()),
                    style: AppStyle.fontStyle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                text: 'Ваша почта:  ',
                style: AppStyle.fontStyle,
                children: [
                  TextSpan(
                    text: currentUser.email.toString(),
                    style: AppStyle.fontStyle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  AuthProvider.logout(context, ref);
                },
                child: const Text('Выход')),
          ],
        ),
      ),
    );
  }
}
