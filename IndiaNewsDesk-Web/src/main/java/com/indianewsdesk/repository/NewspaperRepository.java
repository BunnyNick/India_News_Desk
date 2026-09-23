package com.indianewsdesk.repository;

import com.indianewsdesk.entity.Newspaper;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * SPRING DATA JPA REPOSITORY — auto-generates SQL queries.
 * Java topics: JpaRepository, derived queries, @Query JPQL
 */
@Repository
public interface NewspaperRepository extends JpaRepository<Newspaper, Long> {

    // Derived query — Spring generates: SELECT * WHERE language = ?
    List<Newspaper> findByLanguageIgnoreCase(String language);

    // Derived query — filter by primary state
    List<Newspaper> findByStateIgnoreCase(String state);

    // Combined filter
    List<Newspaper> findByStateIgnoreCaseAndLanguageIgnoreCase(String state, String language);

    // Free ePaper only
    List<Newspaper> findByFreeEpaperTrue();

    // Search by name keyword — JPQL
    @Query("SELECT n FROM Newspaper n WHERE LOWER(n.name) LIKE LOWER(CONCAT('%', :kw, '%'))")
    List<Newspaper> searchByName(@Param("kw") String keyword);

    // All distinct languages
    @Query("SELECT DISTINCT n.language FROM Newspaper n ORDER BY n.language")
    List<String> findDistinctLanguages();

    // All distinct states
    @Query("SELECT DISTINCT n.state FROM Newspaper n ORDER BY n.state")
    List<String> findDistinctStates();

    // Count by language — for stats
    @Query("SELECT n.language, COUNT(n) FROM Newspaper n GROUP BY n.language ORDER BY COUNT(n) DESC")
    List<Object[]> countByLanguage();

    // Count by region
    @Query("SELECT n.region, COUNT(n) FROM Newspaper n GROUP BY n.region ORDER BY COUNT(n) DESC")
    List<Object[]> countByRegion();
}
