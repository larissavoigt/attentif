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
