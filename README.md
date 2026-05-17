# TTB Spark Automation Test Assignment

This folder contains the completed source code and test artifacts for the assignment.

## Folder Structure

- `python/duplicate_items.py` - Question 1: find duplicated items between two lists.
- `python/simple_cipher.py` - Question 6: decrypt uppercase text by shifting counterclockwise on the alphabet wheel.
- `robot/web_login_tests.robot` - Question 2: website login automation tests using Robot Framework + SeleniumLibrary.
- `robot/api_reqres_tests.robot` - Question 3: REST API GET request tests using Robot Framework + RequestsLibrary.
- `robot/mobile_minimal_todo_tests.robot` - Question 4: mobile automation scripts using Robot Framework + AppiumLibrary.
- `test_cases/mobile_test_cases.md` - Question 4: designed test coverage for Minimal-Todo.
- `Jenkinsfile` - Question 5: Jenkins pipeline for checkout, test execution, and publishing Robot reports.
- `requirements.txt` - Python packages needed for the Robot Framework tests.

## Prerequisites

- Python 3.10+
- Google Chrome and ChromeDriver, or Selenium Manager support.
- Appium Server 2.x for mobile tests.
- Android emulator or Android device.
- Minimal-Todo APK built from: `https://github.com/avjinder/Minimal-Todo`

Install dependencies:

```bash
pip install -r requirements.txt
```

## Run Python Answers

```bash
python python/duplicate_items.py
python python/simple_cipher.py
```

## Run Web Login Tests

```bash
robot -d results/web robot/web_login_tests.robot
```

## Run API Tests

```bash
robot -d results/api robot/api_reqres_tests.robot
```

ReqRes currently requires a valid `x-api-key` header for every request. The old sample key `reqres-free-v1` now returns `401 Unauthorized`. Create a key at `https://app.reqres.in/api-keys`, then run:

```bash
robot -v API_KEY:<your_key> -d results/api robot/api_reqres_tests.robot
```

## Run Mobile Tests

Start Appium first:

```bash
appium --base-path /wd/hub
```

Run Robot tests. Update the APK path to match your local machine:

```bash
robot -d results/mobile -v APP_PATH:"C:/path/to/minimal-todo.apk" robot/mobile_minimal_todo_tests.robot
```

## Jenkins

The `Jenkinsfile` checks out the source, installs dependencies, runs all available automated tests, and publishes Robot Framework output files.
