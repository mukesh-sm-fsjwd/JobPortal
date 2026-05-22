package com.main.service;

import com.main.model.JobPost;
import com.main.repository.JobRepository;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class JobService {

    private JobRepository jobRepository;

    @Autowired
    public JobService(JobRepository jobRepository){
        this.jobRepository = jobRepository;
    }

    public void addJob(JobPost jobPost){
        jobRepository.save(jobPost);
    }

    public List<JobPost> getAllJobs(){
        return jobRepository.findAll();
    }

    public JobPost getJob(int postId){
        return jobRepository.findById(postId).orElse(new JobPost());
    }

    public void updateJob(JobPost jobPost) {
        jobRepository.save(jobPost);
    }

    public void deleteJob(int postId){
        jobRepository.deleteById(postId);
    }


    public List<JobPost> getPostByProfileAndDesc(String keyword){
        return jobRepository.findByPostProfileContainingOrPostDescContaining(keyword,keyword);
    }

    public void loadData(){
        List<JobPost> jobs = new ArrayList<>(Arrays.asList(
                new JobPost(1, "Java Developer", "Backend development using Spring Boot", 2,
                        Arrays.asList("Java", "Spring Boot", "MySQL")),

                new JobPost(2, "Frontend Developer", "UI development using React", 1,
                        Arrays.asList("HTML", "CSS", "JavaScript", "React")),

                new JobPost(3, "Full Stack Developer", "End-to-end web application development", 3,
                        Arrays.asList("Java", "Spring Boot", "React", "PostgreSQL")),

                new JobPost(4, "Data Analyst", "Analyze and visualize data", 2,
                        Arrays.asList("Python", "Pandas", "SQL", "Power BI")),

                new JobPost(5, "DevOps Engineer", "CI/CD and cloud deployment", 4,
                        Arrays.asList("Docker", "Kubernetes", "AWS", "Jenkins")),

                new JobPost(6, "Machine Learning Engineer", "Build ML models", 3,
                        Arrays.asList("Python", "TensorFlow", "Scikit-learn")),

                new JobPost(7, "Android Developer", "Mobile app development", 2,
                        Arrays.asList("Java", "Kotlin", "Android SDK")),

                new JobPost(8, "Database Administrator", "Manage and optimize databases", 5,
                        Arrays.asList("MySQL", "Oracle", "PostgreSQL"))
        ));
        jobRepository.saveAll(jobs);
    }
}
