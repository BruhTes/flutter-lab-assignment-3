# Flutter Lab Assignment 3

**Name**: Biruh Tesfahun  
**ID**: UGR/8028/15  
**Section**: 3  

---

## 📌 Objective

Create a Flutter application that fetches a list of album titles and associated photos from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com). The app should:

- Display albums in a scrollable list.
- Navigate to a detail screen showing full information when an album is selected.

---

## 🧩 Functional Requirements

### Data Retrieval & Caching

- Use `httpClient` to fetch data from:
  - [https://jsonplaceholder.typicode.com/albums](https://jsonplaceholder.typicode.com/albums)
  - [https://jsonplaceholder.typicode.com/photos](https://jsonplaceholder.typicode.com/photos)
- Implement caching where applicable.

### User Interface

#### 🔹 List Screen

- Show album title and thumbnail photo.
- Scrollable list with clear loading indicators and error messages.

#### 🔹 Detail Screen

- On item tap, navigate to a screen that shows detailed information about the album.

### Navigation

- Use `GoRouter` package for screen navigation.

### Error Handling

- Display appropriate error messages for network issues.
- Option to retry failed requests.

---

## Technical Stack

- **UI Layer**: Flutter Widgets
- **Networking**: `httpClient`
- **State Management**: Bloc
- **Architecture**: MVVM (Model-View-ViewModel as shown in the lecture slides)

---

