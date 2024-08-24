# Journey Maps Client Flutter Example App

An app to demonstrate the Journey Maps Client Flutter Library.

## Setup

Add an `.env` file to the root of the example project directory containing the api key. The file should look like this:
```
JOURNEY_MAPS_API_KEY=your_secret_api_key_or_the_example_one
```

## Known Bugs
The build runner may not pick up changes to your `.env` file. This is documented here and here.
[here](https://pub.dev/packages/envied#known-issues) and [here](https://github.com/dart-lang/build/issues/967).

**Workaround**

Please remove the generated env.g.dart file to make sure it is newly generated. Running
`dart run build_runner clean` does not seem to work correctly under all circumstances.
