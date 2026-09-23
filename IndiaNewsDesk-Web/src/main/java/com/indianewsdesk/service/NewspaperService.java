package com.indianewsdesk.service;

import com.indianewsdesk.dto.StatsDTO;
import com.indianewsdesk.entity.Favorite;
import com.indianewsdesk.entity.Newspaper;
import com.indianewsdesk.repository.FavoriteRepository;
import com.indianewsdesk.repository.NewspaperRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * SERVICE LAYER — business logic between controller and repository.
 * Java topics: @Service, @Transactional, Streams, Optional,
 *              Map collectors, LinkedHashMap ordering
 */
@Service
public class NewspaperService {

    private final NewspaperRepository newspaperRepo;
    private final FavoriteRepository  favoriteRepo;

    public NewspaperService(NewspaperRepository newspaperRepo,
                            FavoriteRepository favoriteRepo) {
        this.newspaperRepo = newspaperRepo;
        this.favoriteRepo  = favoriteRepo;
    }

    // ── Newspaper queries ────────────────────────────────────────

    public List<Newspaper> getAll() {
        return newspaperRepo.findAll()
                .stream()
                .sorted(Comparator.comparing(Newspaper::getName))
                .collect(Collectors.toList());
    }

    public List<Newspaper> getByState(String state) {
        return newspaperRepo.findByStateIgnoreCase(state);
    }

    public List<Newspaper> getByLanguage(String language) {
        return newspaperRepo.findByLanguageIgnoreCase(language);
    }

    public List<Newspaper> getByStateAndLanguage(String state, String language) {
        if (state == null || state.isBlank())   return getByLanguage(language);
        if (language == null || language.isBlank()) return getByState(state);
        return newspaperRepo.findByStateIgnoreCaseAndLanguageIgnoreCase(state, language);
    }

    public List<Newspaper> search(String keyword) {
        if (keyword == null || keyword.isBlank()) return getAll();
        return newspaperRepo.searchByName(keyword);
    }

    public List<String> getAllLanguages() {
        return newspaperRepo.findDistinctLanguages();
    }

    public List<String> getAllStates() {
        return newspaperRepo.findDistinctStates();
    }

    // ── Stats ────────────────────────────────────────────────────

    public StatsDTO getStats() {
        // Convert Object[] rows → Map<language, count>
        Map<String, Long> byLang = newspaperRepo.countByLanguage()
                .stream()
                .collect(Collectors.toMap(
                        row -> (String) row[0],
                        row -> (Long)   row[1],
                        (a, b) -> a,
                        LinkedHashMap::new));

        Map<String, Long> byRegion = newspaperRepo.countByRegion()
                .stream()
                .collect(Collectors.toMap(
                        row -> (String) row[0],
                        row -> (Long)   row[1],
                        (a, b) -> a,
                        LinkedHashMap::new));

        return new StatsDTO(
                (int) newspaperRepo.count(),
                (int) favoriteRepo.count(),
                byLang,
                byRegion
        );
    }

    // ── Favorites ────────────────────────────────────────────────

    public List<Favorite> getAllFavorites() {
        return favoriteRepo.findAll()
                .stream()
                .sorted(Comparator.comparing(Favorite::getSavedAt).reversed())
                .collect(Collectors.toList());
    }

    @Transactional
    public Favorite addFavorite(Long newspaperId) {
        // Prevent duplicate favorites
        if (favoriteRepo.existsByNewspaperId(newspaperId)) {
            return favoriteRepo.findByNewspaperId(newspaperId).orElseThrow();
        }
        Newspaper paper = newspaperRepo.findById(newspaperId)
                .orElseThrow(() -> new NoSuchElementException("Newspaper not found: " + newspaperId));
        return favoriteRepo.save(Favorite.builder().newspaper(paper).build());
    }

    @Transactional
    public void removeFavorite(Long id) {
        favoriteRepo.deleteById(id);
    }

    public boolean isFavorite(Long newspaperId) {
        return favoriteRepo.existsByNewspaperId(newspaperId);
    }
}
