package com.main.repository;

import com.main.model.JobPost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Repository
public interface JobRepository extends JpaRepository<JobPost,Integer> {

    List<JobPost> findByPostProfileContainingOrPostDescContaining(String keyword, String keyword1);

}

/*
List<JobPost> jobs = new ArrayList<>(
            Arrays.asList(
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

    public void addJob(JobPost job){
        jobs.add(job);
        System.out.println(jobs);
    }

    public List<JobPost> getJobs(){
        return jobs;
    }

    public JobPost getJob(int postId) {

        for(JobPost job : jobs){
            if(job.getPostId() == postId) return job;
        }
        return null;
    }

    public void updateJob(JobPost jobPost) {
        for(JobPost jobPost1 : jobs){
            if(jobPost1.getPostId() == jobPost.getPostId()){
                jobPost1.setPostDesc(jobPost.getPostDesc());
                jobPost1.setPostProfile(jobPost.getPostProfile());
                jobPost1.setReqExperience(jobPost.getReqExperience());
                jobPost1.setPostTechStack(jobPost.getPostTechStack());
            }
        }
    }

    public String deleteJob(int postId) {
        for(JobPost jobPost : jobs){
            if(jobPost.getPostId() == postId){
                jobs.remove(jobPost);
                return "Success";
            }
        }
        return "Cannot Delete The Job.\nPlease ensure that this object is in the database.";
    }
 */
