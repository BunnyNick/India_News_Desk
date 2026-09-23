package com.indianewsdesk.dto;

import java.util.Map;

/**
 * DTO — data transfer object for /api/stats response.
 */
public class StatsDTO {

    private int totalPapers;
    private int totalFavorites;
    private Map<String, Long> byLanguage;
    private Map<String, Long> byRegion;

    public StatsDTO() {}

    public StatsDTO(int totalPapers, int totalFavorites,
                    Map<String, Long> byLanguage, Map<String, Long> byRegion) {
        this.totalPapers    = totalPapers;
        this.totalFavorites = totalFavorites;
        this.byLanguage     = byLanguage;
        this.byRegion       = byRegion;
    }

    public int              getTotalPapers()    { return totalPapers; }
    public int              getTotalFavorites() { return totalFavorites; }
    public Map<String,Long> getByLanguage()     { return byLanguage; }
    public Map<String,Long> getByRegion()       { return byRegion; }

    public void setTotalPapers(int v)               { this.totalPapers = v; }
    public void setTotalFavorites(int v)            { this.totalFavorites = v; }
    public void setByLanguage(Map<String,Long> v)   { this.byLanguage = v; }
    public void setByRegion(Map<String,Long> v)     { this.byRegion = v; }
}
