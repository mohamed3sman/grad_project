import 'package:flutter/material.dart';

class RewardView extends StatelessWidget {
  const RewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Congratulations',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Image.asset(
              'assets/coins_reward.png',
              width: MediaQuery.sizeOf(context).width * 0.6,
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              '+50',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              'Ponus Points',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              textAlign: TextAlign.center,
              'you have earned 50 points for sharing your skills with Ali hassan',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                width: 353,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xff4547EB),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Got It",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
