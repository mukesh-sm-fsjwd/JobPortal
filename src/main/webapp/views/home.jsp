<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mukesh Job Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="/css/portal.css">
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="home">&#x1F4BC; <span>Mukesh</span> Job Portal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="home"><i class="fa fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="viewalljobs"><i class="fa fa-list"></i> All Jobs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://smmukesh.me" target="_blank"><i class="fa fa-user"></i> Portfolio</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="hero-section fade-up">
    <div class="container">
        <div class="hero-badge">&#x2728; Open Positions Available</div>
        <h1 class="hero-title">Find Your Next<br>Big Opportunity</h1>
        <p class="hero-subtitle">Browse job listings or post a new opening. Simple, fast, and built with Spring Boot.</p>
    </div>
</div>

<div class="container fade-up-delay">
    <div class="row g-4 justify-content-center">
        <div class="col-md-5">
            <div class="portal-card">
                <div class="card-icon view">
                    <i class="fa fa-search"></i>
                </div>
                <h4>Browse Jobs</h4>
                <p>Explore all available job listings and find the perfect role that matches your skills and experience.</p>
                <a href="/viewalljobs" class="btn-indigo">View All Jobs</a>
            </div>
        </div>
        <div class="col-md-5">
            <div class="portal-card">
                <div class="card-icon add">
                    <i class="fa fa-plus"></i>
                </div>
                <h4>Post a Job</h4>
                <p>Hiring? Add a new job listing with tech stack requirements and get your opening in front of candidates.</p>
                <a href="/addjob" class="btn-green">Add Job</a>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <p>Built with &#x2665; by <a href="https://smmukesh.me" target="_blank">Mukesh</a> &mdash; Spring Boot Job Portal</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>