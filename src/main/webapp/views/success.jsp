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

        .navbar-brand span { color: #f1f5f9; }

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

        /* Success Banner */
        .success-banner {
            text-align: center;
            padding: 48px 0 32px;
        }

        .success-icon {
            width: 72px;
            height: 72px;
            border-radius: 50%;
            background: rgba(16, 185, 129, 0.15);
            border: 2px solid rgba(16, 185, 129, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            margin: 0 auto 20px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.15); }
            50%       { box-shadow: 0 0 0 12px rgba(16, 185, 129, 0); }
        }

        .success-banner h1 {
            font-size: 1.9rem;
            font-weight: 800;
            background: linear-gradient(135deg, #f1f5f9 0%, #34d399 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .success-banner p {
            color: #64748b;
            margin-top: 8px;
            font-size: 0.92rem;
        }

        /* Detail Card */
        .detail-card {
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 60px;
        }

        .detail-card-header {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 24px;
            padding-bottom: 20px;
            border-bottom: 1px solid #334155;
        }

        .detail-avatar {
            width: 52px;
            height: 52px;
            border-radius: 14px;
            background: rgba(99, 102, 241, 0.15);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.4rem;
        }

        .detail-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: #f1f5f9;
        }

        .exp-badge {
            display: inline-block;
            background: rgba(16, 185, 129, 0.12);
            color: #34d399;
            padding: 3px 12px;
            border-radius: 20px;
            font-size: 0.78rem;
            font-weight: 600;
            margin-top: 4px;
        }

        .detail-row {
            margin-bottom: 20px;
        }

        .detail-label {
            font-size: 0.72rem;
            font-weight: 700;
            color: #475569;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            margin-bottom: 6px;
        }

        .detail-value {
            font-size: 0.9rem;
            color: #cbd5e1;
            line-height: 1.6;
        }

        .divider {
            border: none;
            border-top: 1px solid #334155;
            margin: 20px 0;
        }

        .tech-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 7px;
        }

        .tech-tag {
            background: rgba(99, 102, 241, 0.12);
            color: #818cf8;
            border: 1px solid rgba(99, 102, 241, 0.2);
            padding: 4px 12px;
            border-radius: 6px;
            font-size: 0.78rem;
            font-weight: 600;
        }

        /* Action Buttons */
        .action-btns {
            display: flex;
            gap: 12px;
            margin-top: 24px;
        }

        .btn-indigo {
            background: #6366f1;
            color: #fff;
            border: none;
            padding: 10px 22px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.88rem;
            text-decoration: none;
            transition: all 0.2s ease;
            flex: 1;
            text-align: center;
        }

        .btn-indigo:hover {
            background: #4f46e5;
            color: #fff;
        }

        .btn-outline {
            background: transparent;
            color: #94a3b8;
            border: 1px solid #334155;
            padding: 10px 22px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.88rem;
            text-decoration: none;
            transition: all 0.2s ease;
            flex: 1;
            text-align: center;
        }

        .btn-outline:hover {
            border-color: #6366f1;
            color: #818cf8;
        }

        /* Footer */
        .footer {
            border-top: 1px solid #1e293b;
            text-align: center;
            padding: 24px;
            color: #475569;
            font-size: 0.83rem;
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