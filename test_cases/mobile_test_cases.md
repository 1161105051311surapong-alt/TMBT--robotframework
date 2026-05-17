# Mobile Test Cases & Test Coverage Specification

**Project Name:** Minimal-Todo Mobile Application Automation Testing  
**Target Application:** Minimal-Todo (Android)  
**Testing Framework:** Robot Framework + AppiumLibrary  
**Language Requirement:** English Only (As specified by the assessment guidelines)

---

## 1. Test Coverage Matrix

This matrix maps the application features to their respective automated test cases to ensure full functional coverage of the core user journeys.

| Feature Component | Test Case ID | Test Case Title | Coverage Type | Priority |
| :--- | :--- | :--- | :--- | :--- |
| **Task Management** | TC-01 | Create Todo Item Successfully | Positive | High |
| **Notification / Alerts** | TC-02 | Create Todo With Reminder | Positive | Medium |
| **Task Management** | TC-03 | Edit Existing Todo Item | Positive | High |
| **Task Management** | TC-04 | Delete Existing Todo Item | Positive | High |
| **Input Validation** | TC-05 | Validate Required Todo Title | Negative | Critical |

---

## 2. Detailed Test Case Specifications

### TC-01: Create Todo Item Successfully
* **Objective:** Verify that a user can successfully create a new todo item by providing a valid title.
* **Pre-conditions:** Application is open and running on the main dashboard screen.
* **Test Steps:**
  1. Tap the **Add Todo (+)** Floating Action Button.
  2. Verify that the task creation screen is displayed.
  3. Input text `"Buy milk"` into the **Title** field.
  4. Tap the **Save** Floating Action Button.
* **Expected Result:** The task creation screen closes, and the new todo item `"Buy milk"` is successfully displayed on the main dashboard screen.

---

### TC-02: Create Todo With Reminder
* **Objective:** Verify that a user can create a todo item with the reminder functionality enabled.
* **Pre-conditions:** Application is open and running on the main dashboard screen.
* **Test Steps:**
  1. Tap the **Add Todo (+)** Floating Action Button.
  2. Input text `"Pay credit card"` into the **Title** field.
  3. Toggle the **Reminder Switch** to the `ON` position.
  4. Tap the **Save** Floating Action Button.
* **Expected Result:** The todo item `"Pay credit card"` is successfully created along with its active reminder status and displayed on the main screen.

---

### TC-03: Edit Existing Todo Item
* **Objective:** Verify that a user can select an existing todo item and successfully modify its title.
* **Pre-conditions:** A todo item with the title `"Draft title"` must already exist on the main screen.
* **Test Steps:**
  1. Tap on the existing todo item containing the text `"Draft title"`.
  2. Clear the existing text in the **Title** field.
  3. Input the updated text `"Updated title"` into the **Title** field.
  4. Tap the **Save** Floating Action Button.
* **Expected Result:** The updated title `"Updated title"` replaces the old title and is correctly reflected on the main dashboard screen.

---

### TC-04: Delete Existing Todo Item
* **Objective:** Verify that a user can delete an existing todo item from the main list using a horizontal swipe gesture.
* **Pre-conditions:** A todo item with the title `"Remove me"` must exist on the main screen. The soft keyboard must be hidden to prevent gesture blocking.
* **Test Steps:**
  1. Verify the presence of the todo item `"Remove me"`.
  2. Hide the soft keyboard if active.
  3. Perform a precise horizontal swipe gesture from right to left across the item's boundary coordinates (Start X: 90%, Y: 15% to End X: 10%, Y: 15%) within a duration of `1s` or `500ms`.
* **Expected Result:** The item responds to the swipe animation, gets dismissed from the UI context, and the text `"Remove me"` completely disappears from the screen within 5 seconds.

---

### TC-05: Validate Required Todo Title
* **Objective:** Verify that the system prevents task creation and handles data validation gracefully when the required Title field is left completely empty.
* **Pre-conditions:** Application is open and running on the main dashboard screen.
* **Test Steps:**
  1. Tap the **Add Todo (+)** Floating Action Button.
  2. Leave the **Title** field blank.
  3. Tap the **Save** Floating Action Button.
* **Expected Result:** The application discards the empty creation flow, safely exits the creation context, and routes the user back to the main dashboard screen without generating any corrupted or empty items. The **Add Todo (+)** button remains visible.

---

## 3. Environment & Execution Pre-requisites
To execute the automated counterparts of these test cases (`mobile_minimal_todo_tests.robot`), ensure the following environment configurations are maintained:
* **Appium Server:** Must be explicitly started using the `--base-path /wd/hub` flag to support legacy path resolution.
* **Device Setup:** Android Virtual Device (AVD via Android Studio) or physical device connected properly via ADB with `ANDROID_HOME` correctly exported.
* **Application Path:** The compiled package named `minimal-todo.apk` must reside strictly in the `${EXECDIR}/app/` directory path.
