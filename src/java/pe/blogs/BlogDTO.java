package pe.blogs;

import java.util.Date;

public class BlogDTO {
            private int id;
            private String title;
            private String content;
            private String author;
            private Date publishDate;
            
            public BlogDTO() {}

            public BlogDTO(int id, String title, String content, String author, Date publishDate) {
                this.id = id;
                this.title = title;
                this.content = content;
                this.author = author;
                this.publishDate = publishDate;
            }

            public int getId() {
                return id;
            }

            public String getTitle() {
                return title;
            }

            public String getContent() {
                return content;
            }

            public String getAuthor() {
                return author;
            }

            public Date getPublishDate() {
                return publishDate;
            }

            public void setId(int id) {
                this.id = id;
            }

            public void setTitle(String title) {
                this.title = title;
            }

            public void setContent(String content) {
                this.content = content;
            }

            public void setAuthor(String author) {
                this.author = author;
            }

            public void setPublishDate(Date publishDate) {
                this.publishDate = publishDate;
            }
            
            
            
}
