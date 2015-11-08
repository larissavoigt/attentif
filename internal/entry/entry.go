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

func FeelingsDistribution(entries Entry) []int {
	distribution := map[string]int{
		"sad":     0,
		"neutral": 0,
		"happy":   0,
	}

	for _, e := range entries {
		distribution[e.Feeling]++
	}

	return distribution
}
