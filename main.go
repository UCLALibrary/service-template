package main

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

const Port = 8080

// App represents your application.
type App struct {
	Router *gin.Engine
}

func main() {
	app := NewApp()
	app.Routes()
	app.Router.Run(":" + strconv.Itoa(Port))
}

// NewApp initializes a new instance of your application.
func NewApp() *App {
	r := gin.Default()
	return &App{Router: r}
}

// Run starts the server.
func (app *App) Routes() {
	app.Router.GET("/", helloWorld)
	app.Router.NoRoute(app.NotFoundHandler)
}

func helloWorld(c *gin.Context) {
	c.String(http.StatusOK, "hello world")
}

func (app *App) NotFoundHandler(c *gin.Context) {
	c.String(http.StatusNotFound, "This is not yet supported")
}
