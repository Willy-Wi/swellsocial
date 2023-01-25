import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import '../arguments/argument.dart';
import 'action_chip_button.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key, required this.username, required this.message});

  final String username, message;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        overlayColor: MaterialStateProperty.all(colors.purpleSplashRipple),
        splashColor: colors.purpleSplashRipple,
        borderRadius: BorderRadius.circular(25),
        onTap: () => Navigator.pushNamed(context, '/post_detail',
            arguments: Arguments(
              widget.username,
              widget.message,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: Column(children: [
            // User Profile
            ListTile(
              textColor: colors.dark,
              contentPadding: EdgeInsets.zero,
              leading: GestureDetector(
                // ignore this onTap
                onTap: () {},
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: colors.purpleGreenGradient,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              title: Row(children: [
                // ignore this onTap
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    widget.username,
                    style: textTheme.titleMedium,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ]),
              subtitle: Text('12 min ago', style: textTheme.labelLarge),
              // trailing: Material(
              //   color: Colors.transparent,
              //   shape: const CircleBorder(),
              //   child: InkWell(
              //     splashColor: colors.purpleSplashRipple,
              //     overlayColor:
              //         MaterialStateProperty.all(colors.purpleSplashRipple),
              //     customBorder: const CircleBorder(),
              //     onTap: () {},
              //     child: Padding(
              //       padding: const EdgeInsets.all(8),
              //       child: SvgPicture.asset('assets/icons/more_menu.svg',
              //           width: 24),
              //     ),
              //   ),
              // ),
            ),
            // Body
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.message, style: textTheme.labelLarge),
            ),
            const SizedBox(height: 15),
            // Image
            // AspectRatio(
            //   aspectRatio: 4 / 3,
            //   child: Container(
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       gradient: colors.purpleGreenGradient,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ActionChipButton(
                    icon: 'like_false', onPressed: () {}, label: '40'),
                const SizedBox(width: 10),
                ActionChipButton(
                    icon: 'comments', onPressed: () {}, label: '40'),
                const Spacer(),
                ActionChipButton(
                    icon: 'share', onPressed: () {}, label: 'Share'),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
