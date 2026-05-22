# Job Portal

A full-stack job portal app built with **Spring Boot** and **React**.

I started this project to learn Spring Boot from scratch.  
**Version 1** used JSP as the view layer (server-side rendering).  
**Version 2 (this branch — `main`)** keeps the same Spring Boot backend but replaces JSP with a proper React SPA — with a real PostgreSQL database, REST API, and a live search feature.

> **Branch guide:**
> - `main` → React UI version (current, latest)
> - `v1-jsp` → Original JSP version (archive)

---

## What it does

- **Browse all job listings** — card-based grid with job title, description, experience, and tech stack
- **Live search** — type any keyword and results update instantly (searches job title + description)
- **Post a new job** — fill in the title, description, experience required, and pick tech skills
- **Edit an existing job** — update any field of a posted job
- **Delete a job** — remove a listing with one click

---

## Tech Stack

| Layer | Version 1 (JSP) | Version 2 (React — this branch) |
|---|---|---|
| Backend | Spring Boot + Spring MVC | Spring Boot + Spring Data JPA |
| View | JSP + JSTL | React (Create React App) + Axios |
| Database | In-memory ArrayList | PostgreSQL |
| Styling | Plain CSS | Material UI (MUI) |
| Search | None | Live per-keystroke keyword search |

---

## Project Structure

```
JobPortalReact/
│
├── src/                                      # Spring Boot backend
│   └── main/
│       ├── java/com/main/
│       │   ├── SpringBootWebApplication.java  # App entry point
│       │   ├── controller/
│       │   │   └── JobController.java         # All REST endpoints
│       │   ├── service/
│       │   │   └── JobService.java            # Business logic
│       │   ├── repository/
│       │   │   └── JobRepository.java         # JPA queries (search included)
│       │   └── model/
│       │       └── JobPost.java               # Job entity
│       └── resources/
│           └── application.properties         # DB + server config
│
└── frontend/                                 # React frontend (Create React App)
    └── src/
        ├── index.js                           # React entry point
        ├── App.js                             # Client-side routes
        ├── index.css                          # Global styles
        └── components/
            ├── AllPosts.jsx                   # Job listing + live search
            ├── Create.jsx                     # Create job form
            ├── Edit.jsx                       # Edit job form
            └── Navbar.jsx                     # Navigation bar
```

---

## REST API Endpoints

| Method | URL | What it does |
|---|---|---|
| `GET` | `/jobs` | Get all job posts |
| `GET` | `/job/keyword/{keyword}` | Search by keyword (title or description) |
| `GET` | `/jobs/{id}` | Get a single job by ID |
| `POST` | `/jobs` | Create a new job |
| `PUT` | `/jobs` | Update an existing job |
| `DELETE` | `/jobs/{postId}` | Delete a job |
| `GET` | `/load` | Seed the database with sample jobs |

---

## Live Search — How it works

The search feature on the **All Posts** page calls the backend on every keystroke.

**Frontend** (`AllPosts.jsx`):
```js
useEffect(() => {
  if (query.length === 0) {
    // Empty search → fetch all jobs
    axios.get('http://localhost:8080/jobs').then(...);
  } else if (query.length > 2) {
    // Has text → search by keyword
    axios.get(`http://localhost:8080/job/keyword/${query}`).then(...);
  }
}, [query]);
```

**Backend** (`JobRepository.java`):
```java
// Spring Data JPA generates the SQL automatically from the method name
List<JobPost> findByPostProfileContainingOrPostDescContaining(String keyword, String keyword1);
```

This searches both the **job title** and the **job description** at the same time.  
No extra SQL needed — Spring Data JPA handles it from the method name alone.

---

## How to Run Locally

### 1. Clone the repo

```bash
git clone https://github.com/mukesh-sm-fsjwd/JobPortal.git
cd JobPortal
```

### 2. Set up the database

Create a PostgreSQL database and update `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/jobportal_db
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
```

### 3. Start the backend

```bash
# Windows
mvnw.cmd spring-boot:run

# Mac / Linux
./mvnw spring-boot:run
```

Backend runs at: `http://localhost:8080`

Load sample jobs (run once in browser):
```
http://localhost:8080/load
```

### 4. Start the frontend

```bash
cd frontend
npm install
npm start
```

Frontend runs at: `http://localhost:3000`

---

## What changed from v1 → v2

| Thing | v1 (JSP) | v2 (React) |
|---|---|---|
| How pages are rendered | Server sends full HTML | React builds the page in the browser |
| Data storage | ArrayList in memory (resets on restart) | PostgreSQL (real persistent database) |
| Backend communication | Spring MVC model attributes | REST API with JSON |
| Search | No search | Live search on every keystroke |
| Routing | Spring MVC `@GetMapping` for each page | React Router (client-side routes) |
| Styling | Plain CSS | Material UI (MUI) components |

---

## What I learned

**From v1 (JSP):**
- How Spring MVC works — controllers, mappings, model attributes
- How JSP integrates with Spring Boot (view resolver config)
- Difference between `@GetMapping` and `@PostMapping`
- How to pass data between controller and view using `Model`
- JSTL tags (`c:forEach`, `c:choose`) for rendering lists in JSP

**Added in v2 (React):**
- How to build a REST API with Spring Boot (`@RestController`, `@CrossOrigin`)
- Spring Data JPA — repository pattern, derived query methods
- How CORS works and how to allow the React app to talk to the backend
- How React talks to a backend using Axios
- React Router for client-side navigation
- React hooks — `useState`, `useEffect` for data fetching and live search
- How to structure a full-stack project with separate frontend and backend

---

## Author

Mukesh — [smmukesh.me](https://smmukesh.me)  
This project went from my first Spring Boot app to a proper full-stack React + REST API application.
