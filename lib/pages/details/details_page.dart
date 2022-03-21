import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/data/repository/entity/manufactory_details.dart';
import 'package:test_project/pages/base/main_status.dart';

import 'details_cubit.dart';
import 'details_state.dart';

class DetailsPage extends StatelessWidget {
  final int manufactoryId;

  const DetailsPage({Key? key, required this.manufactoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = GetIt.instance.get<DetailsCubit>();
    cubit.initManufactoryId(manufactoryId);
    cubit.loadManufactoryDetails();
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Details'),
          ),
          body: const _ContentDetails()),
    );
  }
}

class _ContentDetails extends StatelessWidget {
  const _ContentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(builder: (context, state) {
      switch (state.status) {
        case MainStatus.init:
        case MainStatus.loading:
          return Center(
            child: const CircularProgressIndicator(),
          );
        case MainStatus.success:
          return state.details != null ? _ManufactoryDetails(details: state.details!) : Container();
        case MainStatus.fail:
          return Center(
            child: _ErrorLoad(error: state.error ?? "Reload"),
          );
      }
    });
  }
}

class _ManufactoryDetails extends StatelessWidget {
  final ManufactoryDetails details;

  const _ManufactoryDetails({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final types = details.vehicleTypes;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 16),
        Text(details.mfrName),
        SizedBox(height: 16),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(types.elementAt(index).name),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 1);
                },
                itemCount: types.length))
      ],
    );
  }
}

class _ErrorLoad extends StatelessWidget {
  const _ErrorLoad({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.read<DetailsCubit>().loadManufactoryDetails();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Icon(Icons.refresh), const SizedBox(width: 16), Text(error)],
          ),
        ),
      ),
    );
  }
}
