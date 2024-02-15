package main

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

const Port = 8080

func main() {
	r := gin.Default()

	r.GET("/", helloWorld)

	r.Run(":" + strconv.Itoa(Port))
}

func helloWorld(c *gin.Context) {
	c.String(http.StatusOK, "hello world")
}
