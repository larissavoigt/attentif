package db

const insertUser = `
	INSERT INTO users (facebook_id, token, name)
	VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE
	token=VALUES(token), name=VALUES(name)
`

const queryEntries = `
	SELECT id, rate, description, created_at
	FROM entries
	WHERE user_id = ?
	ORDER BY id DESC
`

const insertEntry = `
	INSERT INTO entries (user_id, rate, description, created_at)
	VALUES(?, ?, ?, ?)
`
