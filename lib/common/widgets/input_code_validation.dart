import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_styles.dart';
import 'package:make_it/common/widgets/edit_text_field.dart';

class InputCodeValidation extends StatelessWidget {
  const InputCodeValidation({
    super.key,
    required this.onChanged,
    this.isCenter = true,
    this.stringTime,
  });

  final Function(int, String) onChanged;
  final bool isCenter;
  final String? stringTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isCenter ? Alignment.center : null,
      height: 51.sp,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5, // hours and minutes have 5 symbols with ':'
        separatorBuilder: (_, index) => SizedBox(width: 12.sp),
        itemBuilder: (_, index) => _Item(
          index: index,
          onChanged: onChanged,
          text: stringTime?[index],
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({
    required this.index,
    required this.onChanged,
    this.text,
  });

  final int index;
  final Function(int, String) onChanged;
  final String? text;

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  final _focus = FocusNode();
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final text = widget.text == 'X' ? '' : widget.text;
    _controller = TextEditingController(text: text);
  }

  @override
  void dispose() {
    _focus.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = widget.index;

    if (index == 2) {
      return Text(
        ':',
        style: AppStyles.shared.h1BoldGrey,
      );
    }

    return EditTextField(
      width: 44.sp,
      controller: _controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.allow(RegExp(r'\d*\.?\d*')),
      ],
      textAlignCenter: true,
      keyboardType: TextInputType.number,
      focus: _focus,
      onChanged: (number) {
        widget.onChanged.call(index, number);

        if (number == '') return;

        index != 4 ? _focus.nextFocus() : _focus.unfocus();
      },
    );
  }
}
