package uz.lesson.models;

import java.util.Date;

public class Article {
    private int id;
    private int categoryId;
    private String title;
    private String content;
    private long seenCount;
    private Date createdDate;
    private boolean isPublished;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getSeenCount() {
        return seenCount;
    }

    public void setSeenCount(long seenCount) {
        this.seenCount = seenCount;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public boolean isPublished() {
        return isPublished;
    }

    public void setPublished(boolean published) {
        isPublished = published;
    }

    public Article(int id, int categoryId, String title, String content, long seenCount, Date createdDate, boolean isPublished) {
        this.id = id;
        this.categoryId = categoryId;
        this.title = title;
        this.content = content;
        this.seenCount = seenCount;
        this.createdDate = createdDate;
        this.isPublished = isPublished;
    }

    public Article() {
    }
}
