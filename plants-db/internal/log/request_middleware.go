package log

import (
	"net/http"

	"github.com/rs/zerolog/log"
)

func RequestLogger(next http.Handler) http.Handler {
	fn := func(w http.ResponseWriter, r *http.Request) {
		// entry := f.NewLogEntry(r)
		// ww := NewWrapResponseWriter(w, r.ProtoMajor)

		// t1 := time.Now()
		// defer func() {
		// 	entry.Write(ww.Status(), ww.BytesWritten(), ww.Header(), time.Since(t1), nil)
		// }()

		// next.ServeHTTP(ww, WithLogEntry(r, entry))
		if r == nil {
			return
		}

		if r.Response.StatusCode <= 500 {
			log.Info().Msgf("%s %s %d", r.Method, r.URL.Path, r.Response.StatusCode)
		} else {
			log.Error().Msgf("%s %s %d", r.Method, r.URL.Path, r.Response.StatusCode)
		}
	}
	return http.HandlerFunc(fn)
}
