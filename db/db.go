package db

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"strconv"
	"time"

	"github.com/dementiahackers/attentif/internal/entry"
	"github.com/dementiahackers/attentif/internal/user"
)
import _ "github.com/go-sql-driver/mysql"

var db *sql.DB

type fbUser struct {
	ID   string `json:"id"`
	Name string `json:"name"`
}

func init() {
	var err error
	db, err = sql.Open("mysql", "root:@/attentif?parseTime=true")
	if err != nil {
		panic(err)
	}
}

func CreateUser(token string) (string, error) {
	user, err := getFBInfo(token)
	if err != nil {
		return "", err
	}
	res, err := db.Exec(insertUser, user.ID, token, user.Name)
	if err != nil {
		return "", err
	}
	id, err := res.LastInsertId()
	if err != nil {
		return "", err
	}
	return strconv.FormatInt(id, 10), nil
}

func FindUser(id string) (*user.User, error) {
	u := &user.User{}
	err := db.QueryRow("SELECT * FROM users WHERE id=?", id).Scan(
		&u.ID, &u.FacebookID, &u.Token, &u.Name)
	if err != nil {
		return nil, err
	} else {
		return u, nil
	}
}

func CreateEntry(id int64, rate, desc string) (string, error) {
	n, err := strconv.Atoi(rate)
	if err != nil {
		return "", err
	}
	res, err := db.Exec(insertEntry, id, n, desc, time.Now())
	if err != nil {
		return "", err
	}
	e, err := res.LastInsertId()
	if err != nil {
		return "", err
	}
	return strconv.FormatInt(e, 10), nil
}

func FindEntries(id int64, limit int) ([]entry.Entry, error) {
	var entries []entry.Entry
	rows, err := db.Query(queryEntries, id, limit)
	if err != nil {
		return entries, err
	}
	defer rows.Close()
	for rows.Next() {
		e := entry.Entry{}
		err := rows.Scan(&e.ID, &e.Rate, &e.Description, &e.CreatedAt)
		if err != nil {
			return entries, err
		}
		entries = append(entries, e)
	}
	err = rows.Err()
	return entries, err
}

func getFBInfo(token string) (*fbUser, error) {
	api := fmt.Sprintf("https://graph.facebook.com/me?access_token=%s", token)
	r, err := http.Get(api)
	if err != nil {
		return nil, err
	}
	defer r.Body.Close()
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		return nil, err
	}
	u := &fbUser{}
	err = json.Unmarshal(body, &u)
	if err != nil {
		return nil, err
	}
	return u, nil
}
