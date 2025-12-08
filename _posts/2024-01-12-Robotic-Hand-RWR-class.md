---
layout: post
title: "Dextrous Robotic Hand - Faour Hand"
author: "Mihnea Toader"
categories: project
tags: [project, CAD, control, stereo, motion retargeting, manufacturing, design]
image: RWR_img.png
excerpt: Building a dextrous robotic manipulator from scratch
---

## Project Overview

During the first edition of the Real World Robotics class we were tasked with desigining, manufacturing, building and programming a dextrous robotic manipulator - all from scratch (well, mostly). Teams of 4-5 people worked to solve teleoperation and reinforcement learning tasks for a semester. It was an ambitious challenge, but it let me train some muscles I hadn't in a bit: CAD design, manufacturing, and simple Blender animations. Take a look at this video featured on the Soft Robotics Lab youtube channel.

<div class="video-container" style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin: 20px 0;">
  <iframe style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" src="https://www.youtube.com/embed/CCer3cUU1JQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

## Hand design

<div style="float: right; margin: 0 0 20px 20px;">
  <div style="display: flex; align-items: center;">
    <div class="finger-reveal-container" style="position: relative; width: 300px; cursor: ns-resize; user-select: none;">
      <img src="../assets/img/finger.png" alt="Finger closed" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: contain; pointer-events: none;">
      <div class="finger-reveal-wrapper" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; overflow: hidden; clip-path: inset(0 0 100% 0); pointer-events: none;">
        <img src="../assets/img/finger_open.png" alt="Finger cross-section" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: contain;">
      </div>
      <div class="slider-line" style="position: absolute; top: 0; left: 0; width: 100%; height: 3px; background-color: rgba(255, 255, 255, 0.9); box-shadow: 0 0 10px rgba(0,0,0,0.5); pointer-events: none; z-index: 10; margin-top: -1.5px;"></div>
      <img src="../assets/img/finger.png" alt="" style="width: 100%; visibility: hidden;">
    </div>
    <div class="slider-handle" style="position: relative; width: 40px; margin-left: 15px; display: flex; align-items: center; justify-content: center; cursor: ns-resize; align-self: stretch;">
      <div class="handle-circle" style="position: absolute; top: 0; width: 40px; height: 40px; background-color: rgba(255, 255, 255, 0.9); border-radius: 50%; box-shadow: 0 2px 10px rgba(0,0,0,0.3); display: flex; align-items: center; justify-content: center; font-size: 16px; color: #333; cursor: ns-resize; transform: translateY(-50%);">⇕</div>
    </div>
  </div>
</div>

I really like the finished look of the robot hand. But not only does it look pretty, it's also pretty functional. Take a look at the finger, for instance. The workhorse joints are rolling contact, minimizing friction. The red nubs are ligament tighteners, which make for a dead simple manufacturing process. And the sleek outside hides a complex internal routing of tendons. See for yourself - you can drag the slider down and reveal a cross-section. The finger design is the same across the hand, even the thumb. As a result it looks somewhat freakishly long, but it really helped in some of the teleoperation tasks.

## Control

This is the not-from-scratch part. We had Oak-D depth cameras with a hand pose reconstruction pipeline running on them, which we used to retarget someone's hand motion directly to the robot hand. It's a surreal feeling to see a robot hand copying your movements. 













<script>
document.addEventListener('DOMContentLoaded', function() {
  const container = document.querySelector('.finger-reveal-container');
  const wrapper = document.querySelector('.finger-reveal-wrapper');
  const sliderHandle = document.querySelector('.slider-handle');
  const handleCircle = document.querySelector('.handle-circle');
  const sliderLine = document.querySelector('.slider-line');
  
  if (container && wrapper && sliderHandle && handleCircle && sliderLine) {
    let isDragging = false;
    
    function updateReveal(clientY) {
      const rect = container.getBoundingClientRect();
      const y = clientY - rect.top;
      const percent = Math.max(0, Math.min(100, (y / rect.height) * 100));
      
      wrapper.style.clipPath = `inset(0 0 ${100 - percent}% 0)`;
      handleCircle.style.top = `${percent}%`;
      sliderLine.style.top = `${percent}%`;
    }
    
    sliderHandle.addEventListener('mousedown', function(e) {
      isDragging = true;
      updateReveal(e.clientY);
      e.preventDefault();
    });
    
    container.addEventListener('mousedown', function(e) {
      isDragging = true;
      updateReveal(e.clientY);
    });
    
    document.addEventListener('mousemove', function(e) {
      if (isDragging) {
        updateReveal(e.clientY);
      }
    });
    
    document.addEventListener('mouseup', function() {
      isDragging = false;
    });
    
    // Touch support
    sliderHandle.addEventListener('touchstart', function(e) {
      isDragging = true;
      updateReveal(e.touches[0].clientY);
      e.preventDefault();
    });
    
    container.addEventListener('touchstart', function(e) {
      isDragging = true;
      updateReveal(e.touches[0].clientY);
      e.preventDefault();
    });
    
    document.addEventListener('touchmove', function(e) {
      if (isDragging) {
        updateReveal(e.touches[0].clientY);
        e.preventDefault();
      }
    });
    
    document.addEventListener('touchend', function() {
      isDragging = false;
    });
  }
});
</script> 