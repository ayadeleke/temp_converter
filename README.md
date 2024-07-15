# Lite Weather App

Lite Weather App is a simple and intuitive weather application built with Flutter. It provides real-time weather updates for any location, and includes a built-in temperature converter for convenience.

## Features

- **Real-time Weather Updates**: Get current weather information for any location.
- **Temperature Conversion**: Easily convert temperatures between Celsius and Fahrenheit.
- **Unit Switching**: Quickly switch between Celsius and Fahrenheit units.
- **Responsive Design**: Works seamlessly on both portrait and landscape orientations.
- **Error Handling**: Displays appropriate messages for invalid locations or errors in fetching weather data.

## Demo of the app
To view the video demo of the application features and functionalities [click here](https://drive.google.com/file/d/1JOuxU0L65hzcMGmAFY7OFq0FUsrKn9bP/view?usp=sharing)

## Getting Started

### Prerequisites

- Flutter SDK
- A suitable IDE like Android Studio, VSCode, or IntelliJ IDEA.

### Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/ayadeleke/temp_converter.git

    cd temp_converter
    ```

2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Run the app:**
    ```bash
    flutter run
    ```

## Usage

1. **Search for a location:**
   - Enter the location in the search bar and press enter to get the current weather.

2. **Convert temperatures:**
   - Use the temperature converter to convert values between Celsius and Fahrenheit.

3. **Switch units:**
   - Tap the swap icon in the app bar to switch between Celsius and Fahrenheit.

4. **Reset to initial state:**
   - Tap on the app title "Lite Weather App" to reset the app to its initial state.

## Code Structure

- `lib/`
  - `api.dart`: Handles API requests for fetching weather data.
  - `weathermodel.dart`: Defines the data model for the weather data.
  - `weather.dart`: Contains the widget to display weather information.
  - `temp_converter.dart`: Contains the widget for temperature conversion.
  - `main.dart`: Entry point of the application.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes or improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Weatherapi API](https://weatherapi.com) for providing the weather data.
- Flutter team for their comprehensive framework and documentation.

---