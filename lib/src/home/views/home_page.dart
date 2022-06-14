// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends AppLocaleScreen {
  const HomeView({super.key});

  @override
  Widget buildDefault(BuildContext context, AppLocalizations strings) {
    return Scaffold(
      appBar: AppBar(title: Text(strings.counterAppBarTitle)),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CounterText(),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<CounterCubit>().increment(),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.headline1);
  }
}
