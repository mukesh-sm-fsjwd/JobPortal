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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #0f172a;
            color: #f1f5f9;
            min-height: 100vh;
        }

        /* Navbar */
        .navbar {
            background-color: #1e293b !important;
            border-bottom: 1px solid #334155;
            padding: 1rem 0;
        }

        .navbar-brand {
            color: #818cf8 !important;
            font-weight: 800;
            font-size: 1.4rem !important;
            letter-spacing: -0.5px;
        }

        .navbar-brand span {
            color: #f1f5f9;
        }

        .nav-link {
            color: #94a3b8 !important;
            font-weight: 500;
            transition: color 0.2s ease;
            padding: 0.4rem 0.9rem !important;
            border-radius: 6px;
        }

        .nav-link:hover {
            color: #818cf8 !important;
            background-color: rgba(129, 140, 248, 0.08);
        }

        .navbar-toggler { border-color: #334155; }
        .navbar-toggler-icon { filter: invert(0.7); }

        /* Page Header */
        .page-header {
            padding: 48px 0 32px;
            text-align: center;
        }

        .page-header h1 {
            font-size: 2rem;
            font-weight: 800;
            background: linear-gradient(135deg, #f1f5f9 0%, #818cf8 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .page-header p {
            color: #64748b;
            margin-top: 8px;
            font-size: 0.92rem;
        }

        /* Job Card */
        .job-card {
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 14px;
            padding: 24px;
            transition: all 0.3s ease;
            height: 100%;
        }

        .job-card:hover {
            border-color: #6366f1;
            transform: translateY(-3px);
            box-shadow: 0 16px 32px rgba(99, 102, 241, 0.12);
        }

        .job-card-header {
            display: flex;
            align-items: flex-start;
            gap: 14px;
            margin-bottom: 16px;
        }

        .job-avatar {
            width: 46px;
            height: 46px;
            border-radius: 12px;
            background: rgba(99, 102, 241, 0.15);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            flex-shrink: 0;
        }

        .job-title {
            font-size: 1.05rem;
            font-weight: 700;
            color: #f1f5f9;
            margin-bottom: 4px;
        }

        .job-exp-badge {
            display: inline-block;
            background: rgba(16, 185, 129, 0.12);
            color: #34d399;
            padding: 2px 10px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .job-desc {
            font-size: 0.85rem;
            color: #64748b;
            line-height: 1.6;
            margin-bottom: 16px;
        }

        .divider {
            border: none;
            border-top: 1px solid #334155;
            margin: 16px 0;
        }

        .tech-label {
            font-size: 0.72rem;
            font-weight: 700;
            color: #475569;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            margin-bottom: 10px;
        }

        .tech-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
        }

        .tech-tag {
            background: rgba(99, 102, 241, 0.12);
            color: #818cf8;
            border: 1px solid rgba(99, 102, 241, 0.2);
            padding: 3px 10px;
            border-radius: 6px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 80px 20px;
            color: #475569;
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 16px;
            display: block;
            color: #334155;
        }

        .empty-state a {
            color: #818cf8;
            text-decoration: none;
            font-weight: 600;
        }

        .add-job-btn {
            display: inline-block;
            background: #6366f1;
            color: #fff;
            padding: 8px 20px;
            border-radius: 8px;
            font-size: 0.85rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .add-job-btn:hover {
            background: #4f46e5;
            color: #fff;
        }

        /* Footer */
        .footer {
            border-top: 1px solid #1e293b;
            text-align: center;
            padding: 24px;
            color: #475569;
            font-size: 0.83rem;
            margin-top: 60px;
        }

        .footer a {
            color: #818cf8;
            text-decoration: none;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .fade-up { animation: fadeInUp 0.5s ease forwards; }
    </style>
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