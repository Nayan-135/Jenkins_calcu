# Jenkins Calculator CI/CD with SonarQube

This project demonstrates a **complete CI/CD pipeline** using **Jenkins**, **Flask**, **Docker**, and **SonarQube**.  
A simple **static calculator web application** is built with Flask and automatically analyzed for code quality using SonarQube as part of the Jenkins pipeline.

---

## 📌 Project Overview

- Flask-based calculator web application
- Jenkins pipeline for CI
- Python virtual environment for dependency management
- Automated testing with pytest
- Code coverage reporting
- Static code analysis using SonarQube
- Jenkins running inside Docker

---

## 🛠️ Tech Stack

- **Backend**: Flask (Python)
- **CI/CD**: Jenkins
- **Code Quality**: SonarQube
- **Testing**: Pytest, Pytest-Cov
- **Containerization**: Docker
- **Version Control**: GitHub

---

## 📁 Project Structure

Take-1/
│
├── app.py
├── requirements.txt
├── Jenkinsfile
├── Dockerfile
├── templates/
│ └── index.html
└── tests/
└── test_app.py

---

## 🚀 Application Description

- The calculator UI is rendered using HTML.
- All calculations are performed on the client side (JavaScript).
- Flask is used only to serve the webpage.
- The application is tested and analyzed automatically during Jenkins builds.

---

## ⚙️ Jenkins Pipeline Stages

1. **Checkout**
   - Pulls source code from GitHub repository.

2. **Setup Python Environment**
   - Creates a Python virtual environment.
   - Installs project dependencies.

3. **Run Tests & Coverage**
   - Executes unit tests using pytest.
   - Generates coverage report (`coverage.xml`).

4. **SonarQube Analysis**
   - Runs static code analysis using SonarScanner.
   - Uploads code quality and coverage results to SonarQube.

5. **Post Actions**
   - Cleans Jenkins workspace after build.

---

## 📄 Jenkinsfile (Pipeline Logic)

- Uses `sh` commands (Linux-based Jenkins).
- Uses `withSonarQubeEnv` for secure authentication.
- Complies with Python PEP 668 using virtual environments.

---