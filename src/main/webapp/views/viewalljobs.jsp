<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Jobs - Mukesh Job Portal</title>
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
                <li class="nav-item"><a class="nav-link" href="home"><i class="fa fa-home"></i> Home</a></li>
                <li class="nav-item"><a class="nav-link" href="viewalljobs"><i class="fa fa-list"></i> All Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="https://smmukesh.me" target="_blank"><i class="fa fa-user"></i> Portfolio</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="page-header fade-up">
    <h1>&#x1F50D; All Job Listings</h1>
    <p>Browse all available positions &mdash; <a class="add-job-btn" href="/addjob"><i class="fa fa-plus"></i> Post a Job</a></p>
</div>

<div class="container fade-up" style="padding-bottom: 20px;">
    <c:choose>
        <c:when test="${empty jobPosts}">
            <div class="empty-state">
                <i class="fa fa-briefcase"></i>
                <h4 style="color: #64748b; margin-bottom: 8px;">No jobs posted yet</h4>
                <p style="margin-bottom: 20px;">Be the first one to <a href="/addjob">add a job listing</a>!</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="row row-cols-1 row-cols-md-2 g-4">
                <c:forEach var="jobPost" items="${jobPosts}">
                    <div class="col">
                        <div class="job-card">
                            <div class="job-card-header">
                                <div class="job-avatar">&#x1F4BB;</div>
                                <div>
                                    <div class="job-title">${jobPost.postProfile}</div>
                                    <span class="job-exp-badge">
                                        <i class="fa fa-clock"></i> ${jobPost.reqExperience} yrs exp
                                    </span>
                                </div>
                            </div>
                            <p class="job-desc">${jobPost.postDesc}</p>
                            <hr class="divider">
                            <div class="tech-label"><i class="fa fa-code"></i> Tech Stack</div>
                            <div class="tech-tags">
                                <c:forEach var="tech" items="${jobPost.postTechStack}">
                                    <span class="tech-tag">${tech}</span>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<footer class="footer">
    <p>Built with &#x2665; by <a href="https://smmukesh.me" target="_blank">Mukesh</a> &mdash; Spring Boot Job Portal</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>