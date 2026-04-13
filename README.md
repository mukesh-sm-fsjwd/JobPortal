# Job Portal Web App

A simple job portal web application built using **Spring Boot** and **JSP**. I built this from scratch while learning Spring Boot — no tutorials followed step by step, just the docs and a lot of trial and error. It lets you post job listings and browse all available ones.

---

## What it does

- Post a new job with a title, description, experience requirement, and tech stack
- View all posted jobs in a clean card layout
- Each job shows the required tech as clickable tags
- After submitting a job, you get a success page with the full details

---

## Tech Stack

| Layer      | Technology             |
|------------|------------------------|
| Backend    | Java, Spring Boot      |
| View Layer | JSP (Jakarta Server Pages) |
| Styling    | Bootstrap 5, Custom CSS |
| Build Tool | Maven                  |
| Database   | In-memory (Spring Data) |

---

## Project Structure

```
src/
└── main/
    ├── java/com/mukesh/main/
    │   ├── JobPortalApplication.java   # Entry point
    │   ├── JobController.java          # Handles all routes
    │   ├── JobRepository.java          # Data access layer
    │   ├── model/
    │   │   └── JobPost.java            # Job entity
    │   └── service/
    │       └── JobService.java         # Business logic
    ├── resources/
    │   └── application.properties      # App config
    └── webapp/
        ├── css/
        │   └── portal.css              # Shared stylesheet
        └── views/
            ├── home.jsp                # Landing page
            ├── addjob.jsp              # Job posting form
            ├── viewalljobs.jsp         # All jobs listing
            └── success.jsp             # Post confirmation
```

---

## Pages

### Home
The landing page with two options — browse jobs or post a new one.

### Add Job (`/addjob`)
A form where you fill in the job ID, profile/title, description, years of experience required, and pick one or more technologies from the list.

### View All Jobs (`/viewalljobs`)
Shows all posted jobs as cards. Each card has the job title, experience badge, a short description, and the tech stack displayed as tags.

### Success (`/success`)
After submitting a job, this page confirms the submission and shows all the details you just entered.

---

## How to run it locally

Make sure you have **Java 17+** and **Maven** installed.

```bash
# Clone the repo
git clone https://github.com/smmukesh/JobPortal.git
cd JobPortal

# Run the app
./mvnw spring-boot:run
```

Then open your browser and go to: `http://localhost:8080/home`

> On Windows, use `mvnw.cmd spring-boot:run` instead.

---

## Routes

| Method | URL            | What it does                   |
|--------|----------------|--------------------------------|
| GET    | `/home`        | Home page                      |
| GET    | `/addjob`      | Show the job posting form      |
| POST   | `/handleForm`  | Save the job and redirect      |
| GET    | `/viewalljobs` | Show all posted jobs           |

---

## What I learned building this

- How Spring MVC works — controllers, mappings, model attributes
- How JSP integrates with Spring Boot (view resolver config)
- Difference between `@GetMapping` and `@PostMapping`
- How to pass data between controller and view using `Model`
- JSTL tags (`c:forEach`, `c:choose`) for rendering lists in JSP
- Serving static files from `webapp/` in Spring Boot

---

## Author

**Mukesh** — [smmukesh.me](https://smmukesh.me)

This is my first Spring Boot project. Built it to understand how the full request-response cycle works in a Java web app.
