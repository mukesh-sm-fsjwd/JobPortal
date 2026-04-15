package com.main.service;

import com.main.repository.JobRepository;
import com.main.model.JobPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class JobService {

    private JobRepository jobRepository;

    @Autowired
    public JobService(JobRepository jobRepository) {
        this.jobRepository = jobRepository;
    }

    public void addJob(JobPost jobPost){
        jobRepository.save(jobPost);
    }

    public List<JobPost> getAllJobs(){
        return jobRepository.findAll();
    }

    public JobPost getJob(int postId) {
        return jobRepository.findById(postId).orElse(new JobPost());
    }

    public void updateJob(JobPost jobPost) {
        jobRepository.save(jobPost);
    }

    public String deleteJob(int postId) {
        jobRepository.deleteById(postId);
        return "Success";
    }

    public void loadData() {
        List<JobPost> jobs = new ArrayList<>(
                List.of(
                        new JobPost(1, "Python Developer", "Junior Django Developer Required", 1,
                                new ArrayList<>(Arrays.asList("Python", "Django"))),

                        new JobPost(2, "Java Developer", "Spring Boot Backend Developer", 2,
                                new ArrayList<>(Arrays.asList("Java", "Spring Boot", "MySQL"))),

                        new JobPost(3, "Frontend Developer", "React Developer Needed", 1,
                                new ArrayList<>(Arrays.asList("JavaScript", "React", "CSS"))),

                        new JobPost(4, "Full Stack Developer", "MERN Stack Developer", 3,
                                new ArrayList<>(Arrays.asList("MongoDB", "Express", "React", "Node.js"))),

                        new JobPost(5, "Data Analyst", "SQL and Power BI Expert", 2,
                                new ArrayList<>(Arrays.asList("SQL", "Power BI", "Excel"))),

                        new JobPost(6, "AI Engineer", "Machine Learning Engineer Role", 3,
                                new ArrayList<>(Arrays.asList("Python", "TensorFlow", "PyTorch")))
                )
        );

        jobRepository.saveAll(jobs);
    }

    public List<JobPost> search(String keyword) {
        return jobRepository.findByPostProfileContainingOrPostDescContaining(keyword,keyword);
    }
}