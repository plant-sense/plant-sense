package common

import (
	"context"
	"log"
	"strings"

	"github.com/redis/go-redis/v9"
)

func RedisCreateObject(rdb *redis.Client, name string) bool {
	resp := rdb.TSCreate(context.Background(), name)
	if resp.Err() != nil && !strings.HasSuffix(resp.Err().Error(), "key already exists") {
		log.Println(resp.Err())
		return false
	}
	return true
}
