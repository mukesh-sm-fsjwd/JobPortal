<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.mukesh.main.model.JobPost" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job Posted! - Mukesh Job Portal</title>
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

<%
    JobPost myJobPost = (JobPost) request.getAttribute("jobPost");
%>

<div class="success-banner fade-up">
    <div class="success-icon">&#x2713;</div>
    <h1>Job Posted Successfully!</h1>
    <p>Your listing is now live and visible to all candidates</p>
</div>

<div class="container fade-up">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="detail-card">
                <div class="detail-card-header">
                    <div class="detail-avatar">&#x1F4BB;</div>
                    <div>
                        <div class="detail-title"><%= myJobPost.getPostProfile() %></div>
                        <div class="exp-badge">
                            <i class="fa fa-clock"></i> <%= myJobPost.getReqExperience() %> years experience required
                        </div>
                    </div>
                </div>

                <div class="detail-row">
                    <div class="detail-label"><i class="fa fa-align-left"></i> Description</div>
                    <div class="detail-value"><%= myJobPost.getPostDesc() %></div>
                </div>

                <hr class="divider">

                <div class="detail-row">
                    <div class="detail-label"><i class="fa fa-code"></i> Tech Stack</div>
                    <div class="tech-tags">
                        <% for (String tech : myJobPost.getPostTechStack()) { %>
                        <span class="tech-tag"><%= tech %></span>
                        <% } %>
                    </div>
                </div>

                <div class="action-btns">
                    <a href="/viewalljobs" class="btn-indigo"><i class="fa fa-search"></i> View All Jobs</a>
                    <a href="/addjob" class="btn-outline"><i class="fa fa-plus"></i> Add Another</a>
                </div>
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