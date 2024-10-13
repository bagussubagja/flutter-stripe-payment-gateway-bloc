# Flutter Clean Architecture Payment App

This project demonstrates a Flutter application implementing a payment system using Stripe, following Clean Architecture principles. It showcases how to structure a Flutter app for scalability, testability, and maintainability.

## Features

- Clean Architecture implementation in Flutter
- Stripe payment integration
- BLoC pattern for state management
- Dependency Injection using GetIt
- Error handling and user feedback

## Project Structure

The project follows a Clean Architecture structure:

```
lib/
├── data/
│   └── repositories/
│       └── payment_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── payment_intent.dart
│   ├── repositories/
│   │   └── payment_repository.dart
│   └── usecases/
│       └── make_payment_usecase.dart
├── presentation/
│   ├── bloc/
│   │   └── payment_bloc.dart
│   └── views/
│       ├── home_view.dart
│       └── receipt_success_payment_view.dart
├── injection_container.dart
└── main.dart
```

- `data`: Implements the data layer, including repository implementations.
- `domain`: Contains the core business logic, including entities, repository interfaces, and use cases.
- `presentation`: Handles the UI and state management using BLoC.
- `injection_container.dart`: Sets up dependency injection.
- `main.dart`: The entry point of the application.

## Setup

1. Clone the repository:
   ```
   git clone https://github.com/bagussubagja/flutter-stripe-payment-gateway-bloc.git
   ```

2. Navigate to the project directory:
   ```
   cd flutter-stripe-payment-gateway-bloc
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Create a `.env` file in the root of your project and add your Stripe API keys:
   ```
   PUBLIC_KEY=your_publishable_key_here
   SECRET_KEY=your_secret_key_here
   ```

5. Run the app:
   ```
   flutter run
   ```

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management
- [dio](https://pub.dev/packages/dio) for HTTP requests
- [get_it](https://pub.dev/packages/get_it) for dependency injection
- [flutter_stripe](https://pub.dev/packages/flutter_stripe) for Stripe integration
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) for environment variable management

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Credits

Created by [Bagus Subagja] - feel free to contact me at [bagussubagja17@gmail.com]