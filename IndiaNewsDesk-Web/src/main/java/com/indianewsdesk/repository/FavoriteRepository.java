package com.indianewsdesk.repository;

import com.indianewsdesk.entity.Favorite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FavoriteRepository extends JpaRepository<Favorite, Long> {
    Optional<Favorite> findByNewspaperId(Long newspaperId);
    boolean existsByNewspaperId(Long newspaperId);
}
