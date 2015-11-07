package main

import (
	"fmt"
	"log"
	"net/http"
	"text/template"
)

func main() {

	// server static assets files
	fs := http.FileServer(http.Dir("assets"))
	http.Handle("/assets/", http.StripPrefix("/assets/", fs))

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		p := r.URL.Path[1:]
		if p == "" {
			render(w, "home")
		} else {
			render(w, p)
		}
	})

	log.Println("Listening on Port 8080")

	http.ListenAndServe(":8080", nil)
}

func render(w http.ResponseWriter, name string) {
	t, err := template.ParseFiles(
		"templates/"+name+".html",
		"templates/header.html",
		"templates/head.html",
	)

	if err == nil {
		err = t.ExecuteTemplate(w, name+".html", nil)
	}

	if err != nil {
		fmt.Fprintf(w, err.Error())
	}
}
