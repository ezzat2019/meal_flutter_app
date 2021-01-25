import 'package:flutter/material.dart';
import 'package:meal_flutter_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class GroupRadioButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                value: 0,
                groupValue: Provider.of<ThemeProvider>(
                  context,
                ).radio_value,
                onChanged: (val) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .serRaidoValue(val);

                  if (val == 0) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .seThemeMode(ThemeMode.system);
                  }
                },
                title: Text(
                  "System defulat theme",
                  style: TextStyle(color: Theme.of(context).buttonColor),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 80,
              child: RadioListTile(
                value: 1,
                groupValue: Provider.of<ThemeProvider>(
                  context,
                ).radio_value,
                onChanged: (val) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .serRaidoValue(val);
                  if (val == 1) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .seThemeMode(ThemeMode.light);
                  }
                  print("light $val");
                },
                title: Text("Light theme",
                    style: TextStyle(color: Theme.of(context).buttonColor)),
              ),
            ),
            Expanded(
                flex: 20,
                child: Icon(Icons.wb_sunny_outlined,
                    color: Theme.of(context).buttonColor)),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 80,
              child: RadioListTile(
                value: 2,
                groupValue: Provider.of<ThemeProvider>(
                  context,
                ).radio_value,
                onChanged: (val) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .serRaidoValue(val);
                  if (val == 2) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .seThemeMode(ThemeMode.dark);
                  }
                  print("dark $val");
                },
                title: Text("Dark theme",
                    style: TextStyle(color: Theme.of(context).buttonColor)),
              ),
            ),
            Expanded(
                flex: 20,
                child: Icon(Icons.nights_stay,
                    color: Theme.of(context).buttonColor)),
          ],
        ),
      ],
    );
  }
}
