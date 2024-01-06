# APOD - Astronomy Picture of the Day

This project is a Flutter application that shows the Astronomy Picture of the Day.

## Project Structure

The project is structured using the Clean Architecture pattern and is divided into the following layers:

- `core`: This layer contains the core components of the application that are used throughout the project. It includes theme data like `AppTypography`.

- `features`: This layer contains all the features of the application. Each feature is divided into `domain`, `data`, and `presentation` layers. For example, the `splash` feature includes the following:

  - `domain`: Contains the business logic for the splash feature. It includes entities, use cases, and repository interfaces.
  - `data`: Contains the data source implementation and models for the splash feature.
  - `presentation`: Contains the UI for the splash feature. It includes pages, widgets, and state management.

- `test`: Contains all the unit tests for the project.

## Running the Project

To run the project, you need to follow the steps below:

- First of all, you need to install the dependencies for the project. To do so, run the following command:

```bash
flutter pub get
```

- Since we are using Mobx for state management, we need to generate the Mobx files before running the project. To do so, run the following command:

```bash
dart run build_runner build --delete-conflicting-outputs
```

- You will need some API keys to run the project. You can get the API keys from the following links:

  - [NASA API Key](https://api.nasa.gov/)

- Once you have the API keys, you need to edit your launch file to add some dart defines. To do so, open the `launch.json` file in the `.vscode` folder and add the following configuration:

```json
{
  "configurations": [
    {
      "name": "apod",
      "request": "launch",
      "type": "dart",
      "toolArgs": [
        "--dart-define",
        "BASE_LAUNCH_URL=https://fdo.rocketlaunch.live/json/launches", // This is the base URL for the rocket launch API and should not be changed
        "--dart-define",
        "NASA_API_KEY=your_api_key_goes_here", // REPLACE THIS WITH YOUR API KEY FROM THE STEP BEFORE
        "--dart-define",
        "NASA_APOD_BASE_URL=https://api.nasa.gov/planetary/apod" // this is the base URL for the NASA APOD API and should not be changed
      ]
    },
  ]
}
```
  

- This will generate the Mobx files for the project. Now, you can run the project using the following command:

```bash
flutter run
```

## Running the Tests
Assuming that you have already done the steps mentioned in the [Running the Project](#running-the-project) section, you can run the tests using the following command:

```bash
flutter test
```