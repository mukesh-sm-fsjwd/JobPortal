<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Post a Job - Mukesh Job Portal</title>
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
    <h1>&#x1F4CB; Post a New Job</h1>
    <p>Fill in the details below to add a new job listing</p>
</div>

<div class="container fade-up">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="form-card">
                <form action="handleForm" method="post">
                    <div class="mb-3">
                        <label for="postId" class="form-label">Post ID</label>
                        <input type="text" class="form-control" id="postId" name="postId"
                               placeholder="e.g. JOB-001" required>
                    </div>

                    <div class="mb-3">
                        <label for="postProfile" class="form-label">Job Title / Profile</label>
                        <input type="text" class="form-control" id="postProfile" name="postProfile"
                               placeholder="e.g. Senior Java Developer" required>
                    </div>

                    <div class="mb-3">
                        <label for="postDesc" class="form-label">Job Description</label>
                        <textarea class="form-control" id="postDesc" name="postDesc"
                                  placeholder="Describe the role, responsibilities..." rows="3" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="reqExperience" class="form-label">Experience Required (years)</label>
                        <input type="number" class="form-control" id="reqExperience" name="reqExperience"
                               placeholder="e.g. 3" min="0" required>
                    </div>

                    <hr class="form-divider">

                    <div class="mb-4">
                        <label for="postTechStack" class="form-label">Tech Stack</label>
                        <select multiple class="form-select" id="postTechStack" name="postTechStack" required>
                            <option value="Java">Java</option>
                            <option value="JavaScript">JavaScript</option>
                            <option value="TypeScript">TypeScript</option>
                            <option value="Python">Python</option>
                            <option value="Go">Go</option>
                            <option value="Kotlin">Kotlin</option>
                            <option value="Rust">Rust</option>
                            <option value="Swift">Swift</option>
                            <option value="PHP">PHP</option>
                            <option value="HTML5">HTML5</option>
                            <option value="CSS3">CSS3</option>
                            <option value="React">React</option>
                            <option value="Vue.js">Vue.js</option>
                            <option value="Angular">Angular</option>
                            <option value="React Native">React Native</option>
                            <option value="Flutter">Flutter</option>
                            <option value="Node.js">Node.js</option>
                            <option value="Express.js">Express.js</option>
                            <option value="Spring Boot">Spring Boot</option>
                            <option value="Django">Django</option>
                            <option value="Flask">Flask</option>
                            <option value="Ruby on Rails">Ruby on Rails</option>
                            <option value="Laravel">Laravel</option>
                            <option value="TensorFlow">TensorFlow</option>
                            <option value="PyTorch">PyTorch</option>
                            <option value="Machine Learning">Machine Learning</option>
                            <option value="Artificial Intelligence">Artificial Intelligence</option>
                            <option value="Docker">Docker</option>
                            <option value="Kubernetes">Kubernetes</option>
                            <option value="Jenkins">Jenkins</option>
                            <option value="AWS (Amazon Web Services)">AWS</option>
                            <option value="Azure">Azure</option>
                            <option value="Google Cloud">Google Cloud</option>
                            <option value="DevOps">DevOps</option>
                            <option value="GraphQL">GraphQL</option>
                            <option value="Apache Kafka">Apache Kafka</option>
                            <option value="Elasticsearch">Elasticsearch</option>
                            <option value="Blockchain">Blockchain</option>
                            <option value="Cybersecurity">Cybersecurity</option>
                            <option value="Unity">Unity</option>
                            <option value="Game Development">Game Development</option>
                            <option value="IoT (Internet of Things)">IoT</option>
                            <option value="Scrum">Scrum</option>
                            <option value="Agile">Agile</option>
                        </select>
                        <div class="select-hint">&#x1F4A1; Hold Ctrl / Cmd to select multiple technologies</div>
                    </div>

                    <button type="submit" class="btn-submit">
                        <i class="fa fa-paper-plane"></i> &nbsp; Post Job
                    </button>
                </form>
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