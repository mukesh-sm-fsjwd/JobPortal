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

        .navbar-toggler {
            border-color: #334155;
        }

        .navbar-toggler-icon {
            filter: invert(0.7);
        }

        /* Hero Section */
        .hero-section {
            padding: 80px 0 60px;
            text-align: center;
        }

        .hero-badge {
            display: inline-block;
            background: rgba(99, 102, 241, 0.15);
            border: 1px solid rgba(99, 102, 241, 0.3);
            color: #818cf8;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.82rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            margin-bottom: 24px;
            text-transform: uppercase;
        }

        .hero-title {
            font-size: 3rem;
            font-weight: 800;
            line-height: 1.1;
            margin-bottom: 16px;
            background: linear-gradient(135deg, #f1f5f9 0%, #818cf8 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-subtitle {
            font-size: 1.1rem;
            color: #94a3b8;
            max-width: 500px;
            margin: 0 auto 48px;
            line-height: 1.6;
        }

        /* Cards */
        .portal-card {
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 16px;
            padding: 36px 28px;
            text-align: center;
            transition: all 0.3s ease;
            cursor: default;
        }

        .portal-card:hover {
            border-color: #6366f1;
            transform: translateY(-4px);
            box-shadow: 0 20px 40px rgba(99, 102, 241, 0.15);
        }

        .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 1.5rem;
        }

        .card-icon.view {
            background: rgba(99, 102, 241, 0.15);
            color: #818cf8;
        }

        .card-icon.add {
            background: rgba(16, 185, 129, 0.15);
            color: #34d399;
        }

        .portal-card h4 {
            font-size: 1.15rem;
            font-weight: 700;
            color: #f1f5f9;
            margin-bottom: 10px;
        }

        .portal-card p {
            font-size: 0.88rem;
            color: #64748b;
            margin-bottom: 24px;
            line-height: 1.5;
        }

        .btn-indigo {
            background: #6366f1;
            color: #fff;
            border: none;
            padding: 10px 28px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.9rem;
            text-decoration: none;
            display: inline-block;
            transition: all 0.2s ease;
        }

        .btn-indigo:hover {
            background: #4f46e5;
            color: #fff;
            transform: scale(1.02);
        }

        .btn-green {
            background: #059669;
            color: #fff;
            border: none;
            padding: 10px 28px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.9rem;
            text-decoration: none;
            display: inline-block;
            transition: all 0.2s ease;
        }

        .btn-green:hover {
            background: #047857;
            color: #fff;
            transform: scale(1.02);
        }

        /* Footer */
        .footer {
            border-top: 1px solid #1e293b;
            text-align: center;
            padding: 24px;
            color: #475569;
            font-size: 0.83rem;
            margin-top: 80px;
        }

        .footer a {
            color: #818cf8;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* Fade in */
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .fade-up {
            animation: fadeInUp 0.5s ease forwards;
        }

        .fade-up-delay {
            opacity: 0;
            animation: fadeInUp 0.5s ease 0.2s forwards;
        }
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