# My Flutter Station

A production-ready Flutter starter template built with **Clean Architecture**, **BLoC state management**, and modern software engineering best practices.

My Flutter Station is designed to help developers start Flutter projects faster with a clean, scalable, and maintainable structure.

---

## ✨ Overview

**My Flutter Station** provides a solid foundation for building professional Flutter applications.  
It includes a structured architecture, reusable core utilities, dependency injection, routing, networking, error handling, and a modern UI foundation.

This project is suitable for:

- Production-ready Flutter apps
- Starter template projects
- Scalable mobile applications
- Clean Architecture learning
- BLoC-based Flutter development
- Modern UI/UX experimentation

---

## 🚀 Features

- Clean Architecture project structure
- BLoC state management
- Monostate-style BLoC implementation
- Dependency Injection using GetIt
- Dio HTTP client integration
- Centralized Dio error handler
- App Router with route names
- Light and dark theme support
- Modern glassmorphism UI style
- Reusable design system components
- Infinite scroll example module
- Form input showcase
- Button showcase
- Card showcase
- Dialog showcase
- Bottom sheet showcase
- Feedback and toast showcase
- Scalable folder structure
- Ready for real-world development

---

## 🧱 Architecture

This project follows **Clean Architecture** principles by separating the application into clear layers:

```txt
lib/
├── app/
│   ├── app.dart
│   ├── router/
│   └── theme/
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── design_system/
│   ├── posts/
│   └── ...
│
├── injection_container.dart
└── main.dart
```
