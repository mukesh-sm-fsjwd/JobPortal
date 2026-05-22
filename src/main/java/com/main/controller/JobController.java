package com.main.controller;

import com.main.model.JobPost;
import com.main.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class JobController {

    @Autowired
    private JobService jobService;

    @GetMapping("jobs")
    public List<JobPost> getAllJobs(){
        return jobService.getAllJobs();
    }

    @GetMapping("jobs/{id}")
    public JobPost getJob(@PathVariable int id){
        return jobService.getJob(id);
    }

    @PostMapping("jobs")
    public void addJob(@RequestBody JobPost jobPost){
        jobService.addJob(jobPost);
    }

    @PutMapping("jobs")
    public JobPost updateJob(@RequestBody JobPost jobPost){
        jobService.updateJob(jobPost);
        return jobService.getJob(jobPost.getPostId());
    }

    @DeleteMapping("jobs/{postId}")
    public void deleteJob(@PathVariable int postId){
        jobService.deleteJob(postId);
    }

    @GetMapping("load")
    public void load(){
        jobService.loadData();
    }

    @GetMapping("job/keyword/{keyword}")
    public List<JobPost> getByProfileAndDesc(@PathVariable String keyword){
        return jobService.getPostByProfileAndDesc(keyword);
    }

}
