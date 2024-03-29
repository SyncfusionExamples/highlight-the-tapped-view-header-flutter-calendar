# How to highlight the tapped view header in the Flutter Calendar?

This example demonstrates how to highlight the tapped view header in the Flutter Calendar.

By hiding the default headers and including the custom widgets, you can highlight the selected view header date and day in the Flutter Event Calendar.

## Higlighting the tapped view header

You can get the visible dates details from the [onViewChanged](https://pub.dev/documentation/syncfusion_flutter_calendar/latest/calendar/SfCalendar/onViewChanged.html) callback and using the ListView.builder widget load the view header text with GestureDetector. Then based on the selected index highlight the view header day and date text.

![Highlight](https://user-images.githubusercontent.com/46158936/203063694-795bddb0-d521-4eae-ba4e-f871a9a31e93.gif)

## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).
