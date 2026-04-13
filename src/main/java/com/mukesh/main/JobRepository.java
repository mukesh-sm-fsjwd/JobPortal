package com.mukesh.main;

import com.mukesh.main.model.JobPost;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class JobRepository {

    List<JobPost> jobs = new ArrayList<>();

    public void addJob(JobPost job){
        jobs.add(job);
        System.out.println(jobs);
    }

    public List<JobPost> getJobs(){
        return jobs;
    }

}
