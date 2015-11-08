package entry

import (
	"database/sql"
	"time"
)

type Entry struct {
	ID          int64
	UserID      int64
	Rate        int64
	Description sql.NullString
	CreatedAt   time.Time
}

type RateStats struct {
	Days []string
	Rate []int
}

func (e *Entry) Timestamp() string {
	return e.CreatedAt.Local().Format("Jan 2, 3:04pm")
}

func (e *Entry) Feeling() string {
	if e.Rate < 33 {
		return "sad"
	} else if e.Rate < 66 {
		return "neutral"
	} else {
		return "happy"
	}
}

func FeelingsDistribution(entries []Entry) map[string]int {
	distribution := map[string]int{
		"sad":     0,
		"neutral": 0,
		"happy":   0,
	}

	for _, e := range entries {
		distribution[e.Feeling()]++
	}

	return distribution
}

func RateByDay(entries []Entry) RateStats {
	var stats RateStats
	i := -1
	current := 0
	count := 0

	for _, e := range entries {
		key := e.CreatedAt.Local().Format("01/02")
		if i >= 0 {
			c := stats.Days[i]
			if key == c {
				current += int(e.Rate)
				count++
			} else {
				current += int(e.Rate)
				count++
				stats.Rate[i] = current / count
				stats.Days = append(stats.Days, key)
				stats.Rate = append(stats.Rate, 0)
				current = 0
				count = 0
				i++
			}
		} else {
			i++
			stats.Days = append(stats.Days, key)
			stats.Rate = append(stats.Rate, 0)
			current = int(e.Rate)
			count = 1
		}
	}

	stats.Rate[i] = current

	return stats
}
