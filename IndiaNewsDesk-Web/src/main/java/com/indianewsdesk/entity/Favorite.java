package com.indianewsdesk.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

/**
 * JPA ENTITY — stores bookmarked newspapers.
 */
@Entity
@Table(name = "favorites",
       uniqueConstraints = @UniqueConstraint(columnNames = "newspaper_id"))
public class Favorite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "newspaper_id", nullable = false)
    private Newspaper newspaper;

    @Column(name = "saved_at")
    private LocalDateTime savedAt;

    // ── Constructors ─────────────────────────────────────────────
    public Favorite() {}

    public Favorite(Long id, Newspaper newspaper, LocalDateTime savedAt) {
        this.id = id;
        this.newspaper = newspaper;
        this.savedAt = savedAt;
    }

    // ── Builder ──────────────────────────────────────────────────
    public static Builder builder() { return new Builder(); }

    public static class Builder {
        private Long id;
        private Newspaper newspaper;
        private LocalDateTime savedAt;

        public Builder id(Long id)                    { this.id = id; return this; }
        public Builder newspaper(Newspaper newspaper) { this.newspaper = newspaper; return this; }
        public Builder savedAt(LocalDateTime v)       { this.savedAt = v; return this; }

        public Favorite build() {
            return new Favorite(id, newspaper, savedAt);
        }
    }

    @PrePersist
    public void prePersist() {
        this.savedAt = LocalDateTime.now();
    }

    // ── Getters & Setters ────────────────────────────────────────
    public Long          getId()         { return id; }
    public Newspaper     getNewspaper()  { return newspaper; }
    public LocalDateTime getSavedAt()    { return savedAt; }

    public void setId(Long id)                   { this.id = id; }
    public void setNewspaper(Newspaper newspaper){ this.newspaper = newspaper; }
    public void setSavedAt(LocalDateTime savedAt){ this.savedAt = savedAt; }
}
