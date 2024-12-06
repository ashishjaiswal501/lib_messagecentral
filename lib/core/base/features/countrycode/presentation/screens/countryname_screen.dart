import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/widgets/form_filedController.dart';

class CountryNameDropDown<T extends CountryData> extends StatefulWidget {
  const CountryNameDropDown({
    super.key,
    required this.controller,
    this.hintText,
    this.searchHintText,
    required this.options,
    this.optionLabels,
    this.onChanged,
    this.onChangedForMultiSelect,
    this.icon,
    this.width,
    this.height,
    this.fillColor,
    this.searchHintTextStyle,
    this.searchCursorColor,
    required this.textStyle,
    required this.elevation,
    required this.borderWidth,
    required this.borderRadius,
    required this.borderColor,
    required this.margin,
    this.hidesUnderline = false,
    this.disabled = false,
    this.isSearchable = false,
    this.isMultiSelect = false,
  });

  final FormFieldController<T> controller;
  final String? hintText;
  final String? searchHintText;
  final List<T> options;
  final List<String>? optionLabels;
  final Function(T?)? onChanged;
  final Function(List<T>?)? onChangedForMultiSelect;
  final Widget? icon;
  final double? width;
  final double? height;
  final Color? fillColor;
  final TextStyle? searchHintTextStyle;
  final Color? searchCursorColor;
  final TextStyle textStyle;
  final double elevation;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;
  final EdgeInsetsGeometry margin;
  final bool hidesUnderline;
  final bool disabled;
  final bool isSearchable;
  final bool isMultiSelect;

  @override
  State<CountryNameDropDown<T>> createState() =>
      _CountryCodeDropDownDropDownState<T>();
}

class _CountryCodeDropDownDropDownState<T extends CountryData>
    extends State<CountryNameDropDown<T>> {
  final TextEditingController _textEditingController = TextEditingController();

  late void Function() listener;

  @override
  void initState() {
    super.initState();
    listener = widget.isMultiSelect
        ? () {}
        : () => widget.onChanged?.call(widget.controller.value);
    widget.controller.addListener(listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listener);
    super.dispose();
  }

  List<T> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    final optionToDisplayValue = Map.fromEntries(
      widget.options.asMap().entries.map((option) => MapEntry(
          option.value,
          widget.optionLabels == null ||
                  widget.optionLabels!.length < option.key + 1
              ? '${option.value.name}'
              : widget.optionLabels![option.key])),
    );
    final value = widget.options.contains(widget.controller.value)
        ? widget.controller.value
        : null;
    final items = widget.options
        .map(
          (option) => DropdownMenuItem<T>(
            value: option,
            child: Text(
              optionToDisplayValue[option] ?? '',
              style: widget.textStyle,
            ),
          ),
        )
        .toList();
    final hintText = widget.hintText != null
        ? Text(widget.hintText!,
            style: widget.textStyle.merge(TextStyle(
              color: Theme.of(context).hintColor,
            )))
        : null;
    final void Function(T?)? onChanged = widget.disabled || widget.isMultiSelect
        ? null
        : (value) => widget.controller.value = value;
    final dropdownWidget = widget.isMultiSelect
        ? _buildMultiSelectDropdown(
            hintText,
            optionToDisplayValue,
            widget.isSearchable,
            widget.onChangedForMultiSelect!,
            widget.disabled,
          )
        : widget.isSearchable
            ? _buildSearchableDropdown(
                value,
                items,
                onChanged,
                hintText,
                optionToDisplayValue,
              )
            : _buildNonSearchableDropdown(value, items, onChanged, hintText);
    final childWidget = Padding(
        padding: EdgeInsets.zero, // widget.margin,
        child: widget.hidesUnderline
            ? DropdownButtonHideUnderline(child: dropdownWidget)
            : dropdownWidget);
    // DecoratedBox(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(widget.borderRadius),
    //     border: Border.all(
    //       color: widget.borderColor,
    //       width: widget.borderWidth,
    //     ),
    //     color: widget.fillColor,
    //   ),
    //   child: Padding(
    //     padding: widget.margin,
    //     child: widget.hidesUnderline
    //         ? DropdownButtonHideUnderline(child: dropdownWidget)
    //         : dropdownWidget,
    //   ),
    // );
    if (widget.height != null || widget.width != null) {
      return SizedBox(
        width: widget.width,
        //height: widget.height,
        child: childWidget,
      );
    }
    return childWidget;
  }

  Widget _buildNonSearchableDropdown(
    T? value,
    List<DropdownMenuItem<T>>? items,
    void Function(T?)? onChanged,
    Text? hintText,
  ) {
    return DropdownButton<T>(
      value: value,
      hint: hintText,
      items: items ?? [],
      elevation: widget.elevation.toInt(),
      onChanged: onChanged,
      icon: widget.icon,
      isExpanded: true,
      dropdownColor: widget.fillColor,
      focusColor: Colors.transparent,
    );
  }

  Widget _buildSearchableDropdown(
    T? value,
    List<DropdownMenuItem<T>>? items,
    void Function(T?)? onChanged,
    Text? hintText,
    Map<T, String> optionLabels,
  ) {
    final overlayColor = MaterialStateProperty.resolveWith<Color?>((states) =>
        states.contains(MaterialState.focused) ? Colors.transparent : null);
    final iconStyleData = widget.icon != null
        ? IconStyleData(icon: widget.icon!)
        : const IconStyleData();
    return DropdownButton2<T>(
      value: value,
      hint: hintText,
      items: items ?? [],
      iconStyleData: iconStyleData,
      buttonStyleData: ButtonStyleData(
        elevation: widget.elevation.toInt(),
        overlayColor: overlayColor,
      ),
      menuItemStyleData: MenuItemStyleData(overlayColor: overlayColor),
      dropdownStyleData: DropdownStyleData(
        elevation: widget.elevation.toInt(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: widget.fillColor,
        ),
      ),
      onChanged: onChanged,
      isExpanded: true,
      dropdownSearchData: DropdownSearchData<T>(
        searchController: _textEditingController,
        searchInnerWidgetHeight: 50,
        searchInnerWidget: Container(
          height: 50,
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          child: TextFormField(
            expands: true,
            maxLines: null,
            controller: _textEditingController,
            cursorColor: widget.searchCursorColor,
            style: const TextStyle(
              color: Color(0xFF243757),
            ),
            decoration: InputDecoration(
              isDense: true,
              labelStyle: widget.searchHintTextStyle,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              hintText: widget.searchHintText,
              hintStyle: widget.searchHintTextStyle!
                  .merge(TextStyle(color: Theme.of(context).hintColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        searchMatchFn: (item, searchValue) {
          return (optionLabels[item.value] ?? '')
              .toLowerCase()
              .contains(searchValue.toLowerCase());
        },
      ),

      // This to clear the search value when you close the menu
      onMenuStateChange: (isOpen) {
        if (!isOpen) {
          _textEditingController.clear();
        }
      },
    );
  }

  List<String> selectedItemsvalue = [];

  String getSelectedItemsNames() {
    if (selectedItems.isNotEmpty) {
      return selectedItems.map((item) => item.name).join(', ');
    } else {
      return "";
    }
  }

  Widget _buildMultiSelectDropdown(
    Text? hintText,
    Map<T, String> optionLabels,
    bool isSearchable,
    Function(List<T>?) onChangedForMultiSelect,
    bool disabled,
  ) {
    final overlayColor = MaterialStateProperty.resolveWith<Color?>((states) =>
        states.contains(MaterialState.focused) ? Colors.transparent : null);
    final iconStyleData = widget.icon != null
        ? IconStyleData(icon: widget.icon!)
        : const IconStyleData();
    return DropdownButtonFormField2<CountryData>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      value: selectedItems.isEmpty ? null : selectedItems.last,
      isExpanded: true,
      decoration: const InputDecoration(
        isDense: true,
        contentPadding: EdgeInsetsDirectional.fromSTEB(12.0, 14, 12.0, 14),
      ),
      validator: (value) {
        if (value == null) {
          return "Country is required";
        } else {
          return null;
        }
      },

      items: widget.options.map<DropdownMenuItem<CountryData>>((country) {
        return DropdownMenuItem<CountryData>(
            value: country,
            child: StatefulBuilder(builder: (context, menuSetState) {
              final isSelected = selectedItems.contains(country);
              return InkWell(
                onTap: () {
                  // isSelected
                  //     ? selectedItems.remove(country)
                  //     : selectedItems.add(country);
                  // onChangedForMultiSelect(selectedItems);

                  //This rebuilds the StatefulWidget to update the button's text

                  //This rebuilds the dropdownMenu Widget to update the check mark
                  menuSetState(() {
                    isSelected
                        ? selectedItems.remove(country)
                        : selectedItems.add(country);
                    onChangedForMultiSelect(selectedItems);
                  });
                  setState(() {});
                },
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      if (isSelected)
                        const Icon(
                          Icons.check_box_outlined,
                          color: Color(0xFF243757),
                        )
                      else
                        const Icon(
                          Icons.check_box_outline_blank,
                          color: Color(0xFF243757),
                        ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          optionLabels[country] ?? '',
                          style: widget.textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
      }).toList(),
      hint: hintText,
      iconStyleData: iconStyleData,
      buttonStyleData: ButtonStyleData(
        elevation: widget.elevation.toInt(),
        overlayColor: overlayColor,
      ),
      menuItemStyleData: MenuItemStyleData(overlayColor: overlayColor),
      dropdownStyleData: DropdownStyleData(
        elevation: widget.elevation.toInt(),
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: widget.fillColor,
        ),
      ),
      // onChanged is handled by the onChangedForMultiSelect function
      // onChanged: (value) {
      //   onChangedForMultiSelect(value!);

      // },
      onChanged: (val) {},
      dropdownSearchData: isSearchable
          ? DropdownSearchData<T>(
              searchController: _textEditingController,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Container(
                height: 50,
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  style: const TextStyle(
                    color: Color(0xFF243757),
                  ),
                  controller: _textEditingController,
                  cursorColor: widget.searchCursorColor,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: widget.searchHintText,
                    hintStyle: widget.searchHintTextStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return (optionLabels[item.value] ?? '')
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
              },
            )
          : null,
      // This to clear the search value when you close the menu
      // ticket
      onMenuStateChange: isSearchable
          ? (isOpen) {
              if (!isOpen) {
                _textEditingController.clear();
              }
            }
          : null,
      selectedItemBuilder: (context) {
        return widget.options.map(
          (item) {
            return Container(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                getSelectedItemsNames(),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF243757),
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            );
          },
        ).toList();
      },
    );

    // return DropdownButton2<CountryData>(
    //   value:  selectedItems.isEmpty ? null : selectedItems.last,
    //   hint: hintText,
    //   items: widget.options.map((item) {
    //     return DropdownMenuItem(
    //       value: item,
    //       // Disable default onTap to avoid closing menu when selecting an item
    //       enabled: false,
    //       child: StatefulBuilder(
    //         builder: (context, menuSetState) {
    //           final isSelected = selectedItems.contains(item);
    //           return InkWell(
    //             onTap: () {
    //               isSelected
    //                   ? selectedItems.remove(item)
    //                   : selectedItems.add(item);
    //               onChangedForMultiSelect(selectedItems);
    //               //This rebuilds the StatefulWidget to update the button's text
    //               setState(() {});
    //               //This rebuilds the dropdownMenu Widget to update the check mark
    //               menuSetState(() {});
    //             },
    //             child: Container(
    //               height: double.infinity,
    //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //               child: Row(
    //                 children: [
    //                   if (isSelected)
    //                     const Icon(Icons.check_box_outlined)
    //                   else
    //                     const Icon(Icons.check_box_outline_blank),
    //                   const SizedBox(width: 16),
    //                   Expanded(
    //                     child: Text(
    //                       optionLabels[item] ?? '',
    //                       style: widget.textStyle,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     );
    //   }).toList(),
    //   iconStyleData: iconStyleData,
    //   buttonStyleData: ButtonStyleData(
    //     elevation: widget.elevation.toInt(),
    //     overlayColor: overlayColor,
    //   ),
    //   menuItemStyleData: MenuItemStyleData(overlayColor: overlayColor),
    //   dropdownStyleData: DropdownStyleData(
    //     elevation: widget.elevation.toInt(),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(4),
    //       color: widget.fillColor,
    //     ),
    //   ),
    //   // onChanged is handled by the onChangedForMultiSelect function
    //   onChanged: disabled ? null : (val) {},
    //   isExpanded: true,
    //   selectedItemBuilder: (context) {
    //     return widget.options.map(
    //       (item) {
    //         return Container(
    //           alignment: AlignmentDirectional.center,
    //           child: Text(
    //             selectedItems.join(','),
    //             style: const TextStyle(
    //               fontSize: 14,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //             maxLines: 1,
    //           ),
    //         );
    //       },
    //     ).toList();
    //   },
    //   dropdownSearchData: isSearchable
    //       ? DropdownSearchData<T>(
    //           searchController: _textEditingController,
    //           searchInnerWidgetHeight: 50,
    //           searchInnerWidget: Container(
    //             height: 50,
    //             padding: const EdgeInsets.only(
    //               top: 8,
    //               bottom: 4,
    //               right: 8,
    //               left: 8,
    //             ),
    //             child: TextFormField(
    //               expands: true,
    //               maxLines: null,
    //               controller: _textEditingController,
    //               cursorColor: widget.searchCursorColor,
    //               decoration: InputDecoration(
    //                 isDense: true,
    //                 contentPadding: const EdgeInsets.symmetric(
    //                   horizontal: 10,
    //                   vertical: 8,
    //                 ),
    //                 hintText: widget.searchHintText,
    //                 hintStyle: widget.searchHintTextStyle,
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(8),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           searchMatchFn: (item, searchValue) {
    //             return (optionLabels[item.value] ?? '')
    //                 .toLowerCase()
    //                 .contains(searchValue.toLowerCase());
    //           },
    //         )
    //       : null,
    //   // This to clear the search value when you close the menu
    //   onMenuStateChange: isSearchable
    //       ? (isOpen) {
    //           if (!isOpen) {
    //             _textEditingController.clear();
    //           }
    //         }
    //       : null,
    // );
  }
}
