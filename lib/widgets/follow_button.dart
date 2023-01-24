import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import 'package:flutter_svg/svg.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isFollowing ? Colors.white : colors.green,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                blurRadius: 5, color: colors.purpleShadow, offset: Offset(1, 2))
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              setState(() {
                isFollowing = !isFollowing;
              });
            },
            splashColor: colors.purpleShadow,
            overlayColor: MaterialStateProperty.all(colors.purpleShadow),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset(
                      isFollowing
                          ? 'assets/icons/check.svg'
                          : 'assets/icons/add_purple.svg',
                      width: 18),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    isFollowing ? 'Following' : 'Follow',
                    style: const TextStyle(
                        color: colors.purple,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
