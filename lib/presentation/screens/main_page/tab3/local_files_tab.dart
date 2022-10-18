import 'package:cv_pdf/presentation/common/logic/cubit/cv_list/cv_list_cubit.dart';

import '../../../../domain/models/models.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../app/app_prefs.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/show_snack_bar.dart';

class LocalFilesTab extends StatefulWidget {
  const LocalFilesTab({Key? key}) : super(key: key);

  @override
  State<LocalFilesTab> createState() => _LocalFilesTabState();
}

class _LocalFilesTabState extends State<LocalFilesTab> {
  final _keyRefresh = GlobalKey<RefreshIndicatorState>();
  bool isTouching = false;
  @override
  void initState() {
    onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvListCubit, CvListState>(
      builder: (context, state) {
        return RefreshIndicator(
          key: _keyRefresh,
          onRefresh: () => onRefresh(),
          child: state.files.isNotEmpty
              ? ListView.builder(
                  itemCount: state.files.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      key: UniqueKey(),
                      startActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: ((slidContext) async {
                              // Delete item
                              var element = state.files[index];
                              state.files.removeAt(index);
                              final List<String> myList =
                                  state.files.map((e) => e.toJson()).toList();
                              AppPreferences.saveList(myList);
                              onRefresh();
                              showSnackBar(context, AppStrings.deleteDone, onPressed: () {
                                state.files.insert(index, element);
                                final List<String> myList =
                                    state.files.map((e) => e.toJson()).toList();
                                AppPreferences.saveList(myList);
                                onRefresh();
                              });
                            }),
                            backgroundColor: ColorManager.error,
                            icon: Icons.delete,
                            label: AppStrings.delete.tr(),
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: ((context) async {
                              // Edit file
                              Navigator.pushNamed(context, Routes.addCVRoute,
                                  arguments: Arguments(cvfile: state.files[index], index: index));
                            }),
                            backgroundColor: ColorManager.green,
                            icon: Icons.drive_file_rename_outline,
                            label: AppStrings.edit.tr(),
                          ),
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                          leading: ClipOval(
                            child: state.files[index].image.isNotEmpty
                                ? SizedBox(
                                    width: AppSize.s60R,
                                    height: AppSize.s60R,
                                    child: AppPreferences.imageFromBase64String(
                                        state.files[index].image),
                                  )
                                : Image.asset(
                                    ImageAssets.emptyProfile,
                                    fit: BoxFit.contain,
                                    width: AppSize.s60R,
                                    height: AppSize.s60R,
                                  ),
                          ),
                          title: Text(state.files[index].fullName.isEmpty
                              ? ""
                              : state.files[index].fullName),
                          subtitle: Text(
                            state.files[index].profile.isEmpty ? "" : state.files[index].profile,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    );
                  },
                )
              : GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      isTouching = true;
                    });
                    onRefresh();
                  },
                  onTapUp: (_) {
                    setState(() {
                      isTouching = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          isTouching ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: SvgPicture.asset(
                      ImageAssets.noData,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  )),
        );
      },
    );
  }

  Future<void> onRefresh() async {
    _keyRefresh.currentState?.show();
    var list = await AppPreferences.getListCvFile();
    context.read<CvListCubit>().toggleCVFiles(list);
    await Future.delayed(const Duration(milliseconds: 1000));
  }
}
