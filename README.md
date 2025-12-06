# 💰 Ederi Ne 

**Ederi Ne** is a mobile application developed with Flutter that helps users track, analyze, and compare product prices effectively. It allows users to keep a record of various items and their estimated or actual values.

## 📱 Features

Based on the current project structure, the application includes the following key features:

* **🔐 User Authentication:** Secure login screen for user access (`login_screen`).
* **➕ Add Price/Item:** Easy-to-use interface to add new products and their prices (`add_price_screen`).
* **📋 Price Tracking:** A comprehensive list view to monitor added items and their values (`price_list_screen`).
* **👤 User Profile:** Customizable profile section for user settings (`profile_screen`).
* **💾 Data Management:** Robust data handling service (`data_service`).

## 🛠️ Technologies & Tools

* **Framework:** [Flutter](https://flutter.dev/)
* **Language:** [Dart](https://dart.dev/)
* **Architecture:** MVC / MVVM (Inferred from folder structure)

## 🚀 Getting Started

To run this project locally, follow these steps:

### Prerequisites

* Flutter SDK installed
* VS Code or Android Studio
* Git

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/AhmedakV2/Ederi_Ne_-BETA-.git](https://github.com/AhmedakV2/Ederi_Ne_-BETA-.git)
    ```

2.  **Navigate to the project directory:**
    ```bash
    cd Ederi_Ne_-BETA-
    ```

3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Run the app:**
    ```bash
    flutter run
    ```
## 📂 Project Structure

The project maintains a clean folder structure to enhance code manageability and readability:

lib/
├── screens/                  # Folder containing application screens (pages)
│   ├── login_screen.dart     # User login screen and authentication logic
│   ├── add_price_screen.dart # Interface for adding new products and price details
│   ├── price_list_screen.dart# Main screen listing added products
│   └── profile_screen.dart   # User profile and settings page
├── services/                 # Data and business logic layer
│   └── data_service.dart     # Service file handling database or API communication
└── main.dart                 # Entry point of the application and theme settings

## 🤝 Contributing

Contributions are welcome! Please follow these steps:
1.  Fork the project.
2.  Create your feature branch (`git checkout -b feature/AmazingFeature`).
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4.  Push to the branch (`git push origin feature/AmazingFeature`).
5.  Open a Pull Request.

## 📧 Contact

**Developer:** [AhmedakV2]
**GitHub:** [AhmedakV2](https://github.com/AhmedakV2)




