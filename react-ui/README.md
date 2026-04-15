# 💼 Job Portal – React Frontend

This is the frontend (UI) for your Spring Boot Job Portal.  
Built with **React + Vite**. No need to understand React — just follow the steps below!

---

## 🗂️ Where is this folder?

```
SpringBootWeb/
├── src/                  ← Your Spring Boot backend (Java)
├── react-ui/             ← This folder — React frontend (UI)
│   ├── src/
│   │   ├── components/   ← All pages (Navbar, AllPosts, Create, Edit)
│   │   ├── App.jsx       ← Routing between pages
│   │   └── index.css     ← All styles / design
│   ├── index.html
│   └── package.json
```

---

## ✅ First Time Setup (Do this ONCE)

### Step 1 — Open the Terminal inside IntelliJ

> At the bottom of IntelliJ, click the **"Terminal"** tab.
> It opens a terminal (command prompt) inside your project.

### Step 2 — Go into the react-ui folder

Type this and press **Enter**:

```bash
cd react-ui
```

### Step 3 — Install dependencies (download React libraries)

Type this and press **Enter**:

```bash
npm install
```

⏳ Wait for it to finish. It downloads all needed packages.  
You'll see something like: `added 89 packages` — that means it worked!

> ⚠️ You only need to run `npm install` **once** (or after pulling new changes from Git).

---

## 🚀 Every Time — How to Start the React App

### Step 1 — Open Terminal in IntelliJ (bottom tab)

### Step 2 — Go to the react-ui folder

```bash
cd react-ui
```

### Step 3 — Start the React app

```bash
npm run dev
```

You'll see this output:

```
  VITE ready in 1138 ms

  ➜  Local:   http://localhost:3000/
```

### Step 4 — Open your browser

Go to 👉 **http://localhost:3000**

That's it! Your React UI is running. 🎉

---

## 🔗 Connecting to Spring Boot Backend

Make sure your **Spring Boot app is also running** (on port `8080`).

| What                  | URL                          |
|-----------------------|------------------------------|
| React frontend (UI)   | http://localhost:3000        |
| Spring Boot backend   | http://localhost:8080        |

The React app talks to Spring Boot automatically.  
You don't need to change anything — just keep both running at the same time.

---

## 🛑 How to Stop the React App

Go to the Terminal where `npm run dev` is running,  
then press **Ctrl + C** to stop it.

---

## 📄 Pages in the App

| Page         | URL                         | What it does              |
|--------------|-----------------------------|---------------------------|
| Home         | http://localhost:3000/      | Shows all job listings    |
| Post a Job   | http://localhost:3000/create | Form to add a new job     |
| Edit a Job   | http://localhost:3000/edit   | Form to update a job      |

---

## ❓ Common Issues

### ❌ `npm` not found
→ Install **Node.js** from https://nodejs.org (choose LTS version).  
→ Restart IntelliJ after installing.

### ❌ Page loads but shows "Fetching jobs…" forever
→ Your Spring Boot backend is not running. Start it first in IntelliJ.

### ❌ Port 3000 already in use
→ Another app is using port 3000. Either stop it, or run:
```bash
npx vite --port 3001
```
Then open http://localhost:3001

---

## 🧠 Quick Cheat Sheet

```bash
# Go to the React folder (run this first every time)
cd react-ui

# Install libraries (only once)
npm install

# Start the app
npm run dev

# Stop the app
Ctrl + C
```
