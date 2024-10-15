import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isActive});

  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 24,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});

                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
              },
              child: ColorItem(
                color: kColors[index],
                isActive: activeIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
