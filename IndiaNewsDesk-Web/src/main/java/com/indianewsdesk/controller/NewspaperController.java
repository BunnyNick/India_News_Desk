package com.indianewsdesk.controller;

import com.indianewsdesk.dto.StatsDTO;
import com.indianewsdesk.entity.Favorite;
import com.indianewsdesk.entity.Newspaper;
import com.indianewsdesk.service.NewspaperService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * REST CONTROLLER — all API endpoints.
 * Java topics: @RestController, @GetMapping, @PostMapping,
 *              @DeleteMapping, @RequestParam, @PathVariable,
 *              ResponseEntity, CORS
 */
@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class NewspaperController {

    private final NewspaperService service;

    public NewspaperController(NewspaperService service) {
        this.service = service;
    }

    // ── GET /api/newspapers ──────────────────────────────────────
    @GetMapping("/newspapers")
    public List<Newspaper> getAll() {
        return service.getAll();
    }

    // ── GET /api/newspapers/filter?state=TN&language=Tamil ───────
    @GetMapping("/newspapers/filter")
    public List<Newspaper> filter(
            @RequestParam(required = false) String state,
            @RequestParam(required = false) String language) {
        return service.getByStateAndLanguage(state, language);
    }

    // ── GET /api/newspapers/{id} ─────────────────────────────────
    @GetMapping("/newspapers/{id}")
    public ResponseEntity<Newspaper> getById(@PathVariable Long id) {
        return service.getAll().stream()
                .filter(n -> n.getId().equals(id))
                .findFirst()
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // ── GET /api/search?keyword=Hindu ───────────────────────────
    @GetMapping("/search")
    public List<Newspaper> search(@RequestParam String keyword) {
        return service.search(keyword);
    }

    // ── GET /api/languages ───────────────────────────────────────
    @GetMapping("/languages")
    public List<String> getLanguages() {
        return service.getAllLanguages();
    }

    // ── GET /api/states ──────────────────────────────────────────
    @GetMapping("/states")
    public List<String> getStates() {
        return service.getAllStates();
    }

    // ── GET /api/stats ───────────────────────────────────────────
    @GetMapping("/stats")
    public StatsDTO getStats() {
        return service.getStats();
    }

    // ── GET /api/favorites ───────────────────────────────────────
    @GetMapping("/favorites")
    public List<Favorite> getFavorites() {
        return service.getAllFavorites();
    }

    // ── POST /api/favorites  body: { "newspaperId": 1 } ─────────
    @PostMapping("/favorites")
    public ResponseEntity<Favorite> addFavorite(@RequestBody Map<String, Long> body) {
        Long nid = body.get("newspaperId");
        if (nid == null) return ResponseEntity.badRequest().build();
        return ResponseEntity.ok(service.addFavorite(nid));
    }

    // ── DELETE /api/favorites/{id} ───────────────────────────────
    @DeleteMapping("/favorites/{id}")
    public ResponseEntity<Void> removeFavorite(@PathVariable Long id) {
        service.removeFavorite(id);
        return ResponseEntity.noContent().build();
    }

    // ── GET /api/favorites/check/{newspaperId} ───────────────────
    @GetMapping("/favorites/check/{newspaperId}")
    public Map<String, Boolean> checkFavorite(@PathVariable Long newspaperId) {
        return Map.of("favorited", service.isFavorite(newspaperId));
    }
}
