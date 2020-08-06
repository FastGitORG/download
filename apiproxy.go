package main

import (
	"github.com/labstack/echo/v4"
	"net/http"
)

func main() {
	e := echo.New()
	e.GET("/*", proxy)
	e.GET("/", func(context echo.Context) error {
		return context.String(200, "It works")
	})
	e.Logger.Fatal(e.Start(":1324"))
}

func proxy(c echo.Context) error {
	realDownloadUrl := "https://api.github.com/" + c.Request().URL.String()
	resp, _ := http.DefaultClient.Get(realDownloadUrl)
	defer resp.Body.Close()
	c.Response().Header().Add("Content-Disposition", resp.Header.Get("Content-Disposition"))
	c.Response().Header().Add("Content-Length", resp.Header.Get("Content-Length"))
	return c.Stream(200, resp.Header.Get("Content-Type"), resp.Body)
}
