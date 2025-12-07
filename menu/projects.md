---
layout: page
title: Projects
permalink: /projects
---

<div class="projects-list">
  {% for post in site.posts %}
    <div class="project-list-item">
      <a href="{{ site.github.url }}{{ post.url }}">
        <div class="project-list-content">
          {% if post.image %}
            <div class="project-list-image">
              <img src="{{ site.github.url }}/assets/img/{{ post.image }}" alt="{{ post.title }}">
            </div>
          {% endif %}
          <div class="project-list-text">
            <h2>{{ post.title }}</h2>
            <p>{{ post.excerpt | strip_html | truncate: 200 }}</p>
            <span class="project-list-date">{{ post.date | date: "%B %Y" }}</span>
          </div>
        </div>
      </a>
    </div>
  {% endfor %}
</div>

