// Package api provides primitives to interact with the openapi HTTP API.
//
// Code generated by github.com/deepmap/oapi-codegen/v2 version v2.1.0 DO NOT EDIT.
package api

import (
	"bytes"
	"compress/gzip"
	"context"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"path"
	"strings"

	"github.com/getkin/kin-openapi/openapi3"
	"github.com/go-chi/chi/v5"
	"github.com/oapi-codegen/runtime"
	strictnethttp "github.com/oapi-codegen/runtime/strictmiddleware/nethttp"
	openapi_types "github.com/oapi-codegen/runtime/types"
)

// Devices defines model for devices.
type Devices map[string]string

// Garden defines model for garden.
type Garden struct {
	Id       openapi_types.UUID `json:"id"`
	ImageUrl *string            `json:"image_url,omitempty"`
	Name     string             `json:"name"`
}

// GardenCreate defines model for garden_create.
type GardenCreate struct {
	Name string `json:"name"`
}

// Plant defines model for plant.
type Plant struct {
	FactsheetId string             `json:"factsheet_id"`
	GardenId    openapi_types.UUID `json:"garden_id"`
	Id          openapi_types.UUID `json:"id"`
	ImageUrl    *string            `json:"image_url,omitempty"`
	Name        string             `json:"name"`
}

// PlantCreate defines model for plant_create.
type PlantCreate struct {
	FactsheetId string             `json:"factsheet_id"`
	GardenId    openapi_types.UUID `json:"garden_id"`
	ImageUrl    *string            `json:"image_url,omitempty"`
	Name        string             `json:"name"`
}

// PostGardensJSONRequestBody defines body for PostGardens for application/json ContentType.
type PostGardensJSONRequestBody = GardenCreate

// PatchGardensIdDevicesJSONRequestBody defines body for PatchGardensIdDevices for application/json ContentType.
type PatchGardensIdDevicesJSONRequestBody = Devices

// PostGardensIdPlantsJSONRequestBody defines body for PostGardensIdPlants for application/json ContentType.
type PostGardensIdPlantsJSONRequestBody = PlantCreate

// PutPlantsIdJSONRequestBody defines body for PutPlantsId for application/json ContentType.
type PutPlantsIdJSONRequestBody = PlantCreate

// ServerInterface represents all server handlers.
type ServerInterface interface {

	// (GET /gardens)
	GetGardens(w http.ResponseWriter, r *http.Request)

	// (POST /gardens)
	PostGardens(w http.ResponseWriter, r *http.Request)

	// (GET /gardens/{id}/devices)
	GetGardensIdDevices(w http.ResponseWriter, r *http.Request, id openapi_types.UUID)

	// (PATCH /gardens/{id}/devices)
	PatchGardensIdDevices(w http.ResponseWriter, r *http.Request, id openapi_types.UUID)

	// (GET /gardens/{id}/plants)
	GetGardensIdPlants(w http.ResponseWriter, r *http.Request, id openapi_types.UUID)

	// (POST /gardens/{id}/plants)
	PostGardensIdPlants(w http.ResponseWriter, r *http.Request, id openapi_types.UUID)

	// (GET /plants/{id})
	GetPlantsId(w http.ResponseWriter, r *http.Request, id openapi_types.UUID)

	// (PUT /plants/{id})
	PutPlantsId(w http.ResponseWriter, r *http.Request, id openapi_types.UUID)
}

// Unimplemented server implementation that returns http.StatusNotImplemented for each endpoint.

type Unimplemented struct{}

// (GET /gardens)
func (_ Unimplemented) GetGardens(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusNotImplemented)
}

// (POST /gardens)
func (_ Unimplemented) PostGardens(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusNotImplemented)
}

// (GET /gardens/{id}/devices)
func (_ Unimplemented) GetGardensIdDevices(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	w.WriteHeader(http.StatusNotImplemented)
}

// (PATCH /gardens/{id}/devices)
func (_ Unimplemented) PatchGardensIdDevices(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	w.WriteHeader(http.StatusNotImplemented)
}

// (GET /gardens/{id}/plants)
func (_ Unimplemented) GetGardensIdPlants(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	w.WriteHeader(http.StatusNotImplemented)
}

// (POST /gardens/{id}/plants)
func (_ Unimplemented) PostGardensIdPlants(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	w.WriteHeader(http.StatusNotImplemented)
}

// (GET /plants/{id})
func (_ Unimplemented) GetPlantsId(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	w.WriteHeader(http.StatusNotImplemented)
}

// (PUT /plants/{id})
func (_ Unimplemented) PutPlantsId(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	w.WriteHeader(http.StatusNotImplemented)
}

// ServerInterfaceWrapper converts contexts to parameters.
type ServerInterfaceWrapper struct {
	Handler            ServerInterface
	HandlerMiddlewares []MiddlewareFunc
	ErrorHandlerFunc   func(w http.ResponseWriter, r *http.Request, err error)
}

type MiddlewareFunc func(http.Handler) http.Handler

// GetGardens operation middleware
func (siw *ServerInterfaceWrapper) GetGardens(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()

	handler := http.Handler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		siw.Handler.GetGardens(w, r)
	}))

	for _, middleware := range siw.HandlerMiddlewares {
		handler = middleware(handler)
	}

	handler.ServeHTTP(w, r.WithContext(ctx))
}

// PostGardens operation middleware
func (siw *ServerInterfaceWrapper) PostGardens(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()

	handler := http.Handler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		siw.Handler.PostGardens(w, r)
	}))

	for _, middleware := range siw.HandlerMiddlewares {
		handler = middleware(handler)
	}

	handler.ServeHTTP(w, r.WithContext(ctx))
}

// GetGardensIdDevices operation middleware
func (siw *ServerInterfaceWrapper) GetGardensIdDevices(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()

	var err error

	// ------------- Path parameter "id" -------------
	var id openapi_types.UUID

	err = runtime.BindStyledParameterWithOptions("simple", "id", chi.URLParam(r, "id"), &id, runtime.BindStyledParameterOptions{ParamLocation: runtime.ParamLocationPath, Explode: false, Required: true})
	if err != nil {
		siw.ErrorHandlerFunc(w, r, &InvalidParamFormatError{ParamName: "id", Err: err})
		return
	}

	handler := http.Handler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		siw.Handler.GetGardensIdDevices(w, r, id)
	}))

	for _, middleware := range siw.HandlerMiddlewares {
		handler = middleware(handler)
	}

	handler.ServeHTTP(w, r.WithContext(ctx))
}

// PatchGardensIdDevices operation middleware
func (siw *ServerInterfaceWrapper) PatchGardensIdDevices(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()

	var err error

	// ------------- Path parameter "id" -------------
	var id openapi_types.UUID

	err = runtime.BindStyledParameterWithOptions("simple", "id", chi.URLParam(r, "id"), &id, runtime.BindStyledParameterOptions{ParamLocation: runtime.ParamLocationPath, Explode: false, Required: true})
	if err != nil {
		siw.ErrorHandlerFunc(w, r, &InvalidParamFormatError{ParamName: "id", Err: err})
		return
	}

	handler := http.Handler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		siw.Handler.PatchGardensIdDevices(w, r, id)
	}))

	for _, middleware := range siw.HandlerMiddlewares {
		handler = middleware(handler)
	}

	handler.ServeHTTP(w, r.WithContext(ctx))
}

// GetGardensIdPlants operation middleware
func (siw *ServerInterfaceWrapper) GetGardensIdPlants(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()

	var err error

	// ------------- Path parameter "id" -------------
	var id openapi_types.UUID

	err = runtime.BindStyledParameterWithOptions("simple", "id", chi.URLParam(r, "id"), &id, runtime.BindStyledParameterOptions{ParamLocation: runtime.ParamLocationPath, Explode: false, Required: true})
	if err != nil {
		siw.ErrorHandlerFunc(w, r, &InvalidParamFormatError{ParamName: "id", Err: err})
		return
	}

	handler := http.Handler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		siw.Handler.GetGardensIdPlants(w, r, id)
	}))

	for _, middleware := range siw.HandlerMiddlewares {
		handler = middleware(handler)
	}

	handler.ServeHTTP(w, r.WithContext(ctx))
}

// PostGardensIdPlants operation middleware
func (siw *ServerInterfaceWrapper) PostGardensIdPlants(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()

	var err error

	// ------------- Path parameter "id" -------------
	var id openapi_types.UUID

	err = runtime.BindStyledParameterWithOptions("simple", "id", chi.URLParam(r, "id"), &id, runtime.BindStyledParameterOptions{ParamLocation: runtime.ParamLocationPath, Explode: false, Required: true})
	if err != nil {
		siw.ErrorHandlerFunc(w, r, &InvalidParamFormatError{ParamName: "id", Err: err})
		return
	}

	handler := http.Handler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		siw.Handler.PostGardensIdPlants(w, r, id)
	}))

	for _, middleware := range siw.HandlerMiddlewares {
		handler = middleware(handler)
	}

	handler.ServeHTTP(w, r.WithContext(ctx))
}

// GetPlantsId operation middleware
func (siw *ServerInterfaceWrapper) GetPlantsId(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()

	var err error

	// ------------- Path parameter "id" -------------
	var id openapi_types.UUID

	err = runtime.BindStyledParameterWithOptions("simple", "id", chi.URLParam(r, "id"), &id, runtime.BindStyledParameterOptions{ParamLocation: runtime.ParamLocationPath, Explode: false, Required: true})
	if err != nil {
		siw.ErrorHandlerFunc(w, r, &InvalidParamFormatError{ParamName: "id", Err: err})
		return
	}

	handler := http.Handler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		siw.Handler.GetPlantsId(w, r, id)
	}))

	for _, middleware := range siw.HandlerMiddlewares {
		handler = middleware(handler)
	}

	handler.ServeHTTP(w, r.WithContext(ctx))
}

// PutPlantsId operation middleware
func (siw *ServerInterfaceWrapper) PutPlantsId(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()

	var err error

	// ------------- Path parameter "id" -------------
	var id openapi_types.UUID

	err = runtime.BindStyledParameterWithOptions("simple", "id", chi.URLParam(r, "id"), &id, runtime.BindStyledParameterOptions{ParamLocation: runtime.ParamLocationPath, Explode: false, Required: true})
	if err != nil {
		siw.ErrorHandlerFunc(w, r, &InvalidParamFormatError{ParamName: "id", Err: err})
		return
	}

	handler := http.Handler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		siw.Handler.PutPlantsId(w, r, id)
	}))

	for _, middleware := range siw.HandlerMiddlewares {
		handler = middleware(handler)
	}

	handler.ServeHTTP(w, r.WithContext(ctx))
}

type UnescapedCookieParamError struct {
	ParamName string
	Err       error
}

func (e *UnescapedCookieParamError) Error() string {
	return fmt.Sprintf("error unescaping cookie parameter '%s'", e.ParamName)
}

func (e *UnescapedCookieParamError) Unwrap() error {
	return e.Err
}

type UnmarshalingParamError struct {
	ParamName string
	Err       error
}

func (e *UnmarshalingParamError) Error() string {
	return fmt.Sprintf("Error unmarshaling parameter %s as JSON: %s", e.ParamName, e.Err.Error())
}

func (e *UnmarshalingParamError) Unwrap() error {
	return e.Err
}

type RequiredParamError struct {
	ParamName string
}

func (e *RequiredParamError) Error() string {
	return fmt.Sprintf("Query argument %s is required, but not found", e.ParamName)
}

type RequiredHeaderError struct {
	ParamName string
	Err       error
}

func (e *RequiredHeaderError) Error() string {
	return fmt.Sprintf("Header parameter %s is required, but not found", e.ParamName)
}

func (e *RequiredHeaderError) Unwrap() error {
	return e.Err
}

type InvalidParamFormatError struct {
	ParamName string
	Err       error
}

func (e *InvalidParamFormatError) Error() string {
	return fmt.Sprintf("Invalid format for parameter %s: %s", e.ParamName, e.Err.Error())
}

func (e *InvalidParamFormatError) Unwrap() error {
	return e.Err
}

type TooManyValuesForParamError struct {
	ParamName string
	Count     int
}

func (e *TooManyValuesForParamError) Error() string {
	return fmt.Sprintf("Expected one value for %s, got %d", e.ParamName, e.Count)
}

// Handler creates http.Handler with routing matching OpenAPI spec.
func Handler(si ServerInterface) http.Handler {
	return HandlerWithOptions(si, ChiServerOptions{})
}

type ChiServerOptions struct {
	BaseURL          string
	BaseRouter       chi.Router
	Middlewares      []MiddlewareFunc
	ErrorHandlerFunc func(w http.ResponseWriter, r *http.Request, err error)
}

// HandlerFromMux creates http.Handler with routing matching OpenAPI spec based on the provided mux.
func HandlerFromMux(si ServerInterface, r chi.Router) http.Handler {
	return HandlerWithOptions(si, ChiServerOptions{
		BaseRouter: r,
	})
}

func HandlerFromMuxWithBaseURL(si ServerInterface, r chi.Router, baseURL string) http.Handler {
	return HandlerWithOptions(si, ChiServerOptions{
		BaseURL:    baseURL,
		BaseRouter: r,
	})
}

// HandlerWithOptions creates http.Handler with additional options
func HandlerWithOptions(si ServerInterface, options ChiServerOptions) http.Handler {
	r := options.BaseRouter

	if r == nil {
		r = chi.NewRouter()
	}
	if options.ErrorHandlerFunc == nil {
		options.ErrorHandlerFunc = func(w http.ResponseWriter, r *http.Request, err error) {
			http.Error(w, err.Error(), http.StatusBadRequest)
		}
	}
	wrapper := ServerInterfaceWrapper{
		Handler:            si,
		HandlerMiddlewares: options.Middlewares,
		ErrorHandlerFunc:   options.ErrorHandlerFunc,
	}

	r.Group(func(r chi.Router) {
		r.Get(options.BaseURL+"/gardens", wrapper.GetGardens)
	})
	r.Group(func(r chi.Router) {
		r.Post(options.BaseURL+"/gardens", wrapper.PostGardens)
	})
	r.Group(func(r chi.Router) {
		r.Get(options.BaseURL+"/gardens/{id}/devices", wrapper.GetGardensIdDevices)
	})
	r.Group(func(r chi.Router) {
		r.Patch(options.BaseURL+"/gardens/{id}/devices", wrapper.PatchGardensIdDevices)
	})
	r.Group(func(r chi.Router) {
		r.Get(options.BaseURL+"/gardens/{id}/plants", wrapper.GetGardensIdPlants)
	})
	r.Group(func(r chi.Router) {
		r.Post(options.BaseURL+"/gardens/{id}/plants", wrapper.PostGardensIdPlants)
	})
	r.Group(func(r chi.Router) {
		r.Get(options.BaseURL+"/plants/{id}", wrapper.GetPlantsId)
	})
	r.Group(func(r chi.Router) {
		r.Put(options.BaseURL+"/plants/{id}", wrapper.PutPlantsId)
	})

	return r
}

type GetGardensRequestObject struct {
}

type GetGardensResponseObject interface {
	VisitGetGardensResponse(w http.ResponseWriter) error
}

type GetGardens200JSONResponse []Garden

func (response GetGardens200JSONResponse) VisitGetGardensResponse(w http.ResponseWriter) error {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)

	return json.NewEncoder(w).Encode(response)
}

type GetGardens500Response struct {
}

func (response GetGardens500Response) VisitGetGardensResponse(w http.ResponseWriter) error {
	w.WriteHeader(500)
	return nil
}

type PostGardensRequestObject struct {
	Body *PostGardensJSONRequestBody
}

type PostGardensResponseObject interface {
	VisitPostGardensResponse(w http.ResponseWriter) error
}

type PostGardens200JSONResponse Garden

func (response PostGardens200JSONResponse) VisitPostGardensResponse(w http.ResponseWriter) error {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)

	return json.NewEncoder(w).Encode(response)
}

type PostGardens500Response struct {
}

func (response PostGardens500Response) VisitPostGardensResponse(w http.ResponseWriter) error {
	w.WriteHeader(500)
	return nil
}

type GetGardensIdDevicesRequestObject struct {
	Id openapi_types.UUID `json:"id"`
}

type GetGardensIdDevicesResponseObject interface {
	VisitGetGardensIdDevicesResponse(w http.ResponseWriter) error
}

type GetGardensIdDevices200JSONResponse Devices

func (response GetGardensIdDevices200JSONResponse) VisitGetGardensIdDevicesResponse(w http.ResponseWriter) error {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)

	return json.NewEncoder(w).Encode(response)
}

type GetGardensIdDevices404Response struct {
}

func (response GetGardensIdDevices404Response) VisitGetGardensIdDevicesResponse(w http.ResponseWriter) error {
	w.WriteHeader(404)
	return nil
}

type GetGardensIdDevices500Response struct {
}

func (response GetGardensIdDevices500Response) VisitGetGardensIdDevicesResponse(w http.ResponseWriter) error {
	w.WriteHeader(500)
	return nil
}

type PatchGardensIdDevicesRequestObject struct {
	Id   openapi_types.UUID `json:"id"`
	Body *PatchGardensIdDevicesJSONRequestBody
}

type PatchGardensIdDevicesResponseObject interface {
	VisitPatchGardensIdDevicesResponse(w http.ResponseWriter) error
}

type PatchGardensIdDevices200JSONResponse Devices

func (response PatchGardensIdDevices200JSONResponse) VisitPatchGardensIdDevicesResponse(w http.ResponseWriter) error {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)

	return json.NewEncoder(w).Encode(response)
}

type PatchGardensIdDevices404Response struct {
}

func (response PatchGardensIdDevices404Response) VisitPatchGardensIdDevicesResponse(w http.ResponseWriter) error {
	w.WriteHeader(404)
	return nil
}

type PatchGardensIdDevices500Response struct {
}

func (response PatchGardensIdDevices500Response) VisitPatchGardensIdDevicesResponse(w http.ResponseWriter) error {
	w.WriteHeader(500)
	return nil
}

type GetGardensIdPlantsRequestObject struct {
	Id openapi_types.UUID `json:"id"`
}

type GetGardensIdPlantsResponseObject interface {
	VisitGetGardensIdPlantsResponse(w http.ResponseWriter) error
}

type GetGardensIdPlants200JSONResponse []Plant

func (response GetGardensIdPlants200JSONResponse) VisitGetGardensIdPlantsResponse(w http.ResponseWriter) error {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)

	return json.NewEncoder(w).Encode(response)
}

type GetGardensIdPlants404Response struct {
}

func (response GetGardensIdPlants404Response) VisitGetGardensIdPlantsResponse(w http.ResponseWriter) error {
	w.WriteHeader(404)
	return nil
}

type GetGardensIdPlants500Response struct {
}

func (response GetGardensIdPlants500Response) VisitGetGardensIdPlantsResponse(w http.ResponseWriter) error {
	w.WriteHeader(500)
	return nil
}

type PostGardensIdPlantsRequestObject struct {
	Id   openapi_types.UUID `json:"id"`
	Body *PostGardensIdPlantsJSONRequestBody
}

type PostGardensIdPlantsResponseObject interface {
	VisitPostGardensIdPlantsResponse(w http.ResponseWriter) error
}

type PostGardensIdPlants200JSONResponse []Plant

func (response PostGardensIdPlants200JSONResponse) VisitPostGardensIdPlantsResponse(w http.ResponseWriter) error {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)

	return json.NewEncoder(w).Encode(response)
}

type PostGardensIdPlants404Response struct {
}

func (response PostGardensIdPlants404Response) VisitPostGardensIdPlantsResponse(w http.ResponseWriter) error {
	w.WriteHeader(404)
	return nil
}

type PostGardensIdPlants500Response struct {
}

func (response PostGardensIdPlants500Response) VisitPostGardensIdPlantsResponse(w http.ResponseWriter) error {
	w.WriteHeader(500)
	return nil
}

type GetPlantsIdRequestObject struct {
	Id openapi_types.UUID `json:"id"`
}

type GetPlantsIdResponseObject interface {
	VisitGetPlantsIdResponse(w http.ResponseWriter) error
}

type GetPlantsId200JSONResponse Plant

func (response GetPlantsId200JSONResponse) VisitGetPlantsIdResponse(w http.ResponseWriter) error {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)

	return json.NewEncoder(w).Encode(response)
}

type GetPlantsId404Response struct {
}

func (response GetPlantsId404Response) VisitGetPlantsIdResponse(w http.ResponseWriter) error {
	w.WriteHeader(404)
	return nil
}

type GetPlantsId500Response struct {
}

func (response GetPlantsId500Response) VisitGetPlantsIdResponse(w http.ResponseWriter) error {
	w.WriteHeader(500)
	return nil
}

type PutPlantsIdRequestObject struct {
	Id   openapi_types.UUID `json:"id"`
	Body *PutPlantsIdJSONRequestBody
}

type PutPlantsIdResponseObject interface {
	VisitPutPlantsIdResponse(w http.ResponseWriter) error
}

type PutPlantsId200JSONResponse Plant

func (response PutPlantsId200JSONResponse) VisitPutPlantsIdResponse(w http.ResponseWriter) error {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)

	return json.NewEncoder(w).Encode(response)
}

type PutPlantsId404Response struct {
}

func (response PutPlantsId404Response) VisitPutPlantsIdResponse(w http.ResponseWriter) error {
	w.WriteHeader(404)
	return nil
}

type PutPlantsId500Response struct {
}

func (response PutPlantsId500Response) VisitPutPlantsIdResponse(w http.ResponseWriter) error {
	w.WriteHeader(500)
	return nil
}

// StrictServerInterface represents all server handlers.
type StrictServerInterface interface {

	// (GET /gardens)
	GetGardens(ctx context.Context, request GetGardensRequestObject) (GetGardensResponseObject, error)

	// (POST /gardens)
	PostGardens(ctx context.Context, request PostGardensRequestObject) (PostGardensResponseObject, error)

	// (GET /gardens/{id}/devices)
	GetGardensIdDevices(ctx context.Context, request GetGardensIdDevicesRequestObject) (GetGardensIdDevicesResponseObject, error)

	// (PATCH /gardens/{id}/devices)
	PatchGardensIdDevices(ctx context.Context, request PatchGardensIdDevicesRequestObject) (PatchGardensIdDevicesResponseObject, error)

	// (GET /gardens/{id}/plants)
	GetGardensIdPlants(ctx context.Context, request GetGardensIdPlantsRequestObject) (GetGardensIdPlantsResponseObject, error)

	// (POST /gardens/{id}/plants)
	PostGardensIdPlants(ctx context.Context, request PostGardensIdPlantsRequestObject) (PostGardensIdPlantsResponseObject, error)

	// (GET /plants/{id})
	GetPlantsId(ctx context.Context, request GetPlantsIdRequestObject) (GetPlantsIdResponseObject, error)

	// (PUT /plants/{id})
	PutPlantsId(ctx context.Context, request PutPlantsIdRequestObject) (PutPlantsIdResponseObject, error)
}

type StrictHandlerFunc = strictnethttp.StrictHTTPHandlerFunc
type StrictMiddlewareFunc = strictnethttp.StrictHTTPMiddlewareFunc

type StrictHTTPServerOptions struct {
	RequestErrorHandlerFunc  func(w http.ResponseWriter, r *http.Request, err error)
	ResponseErrorHandlerFunc func(w http.ResponseWriter, r *http.Request, err error)
}

func NewStrictHandler(ssi StrictServerInterface, middlewares []StrictMiddlewareFunc) ServerInterface {
	return &strictHandler{ssi: ssi, middlewares: middlewares, options: StrictHTTPServerOptions{
		RequestErrorHandlerFunc: func(w http.ResponseWriter, r *http.Request, err error) {
			http.Error(w, err.Error(), http.StatusBadRequest)
		},
		ResponseErrorHandlerFunc: func(w http.ResponseWriter, r *http.Request, err error) {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		},
	}}
}

func NewStrictHandlerWithOptions(ssi StrictServerInterface, middlewares []StrictMiddlewareFunc, options StrictHTTPServerOptions) ServerInterface {
	return &strictHandler{ssi: ssi, middlewares: middlewares, options: options}
}

type strictHandler struct {
	ssi         StrictServerInterface
	middlewares []StrictMiddlewareFunc
	options     StrictHTTPServerOptions
}

// GetGardens operation middleware
func (sh *strictHandler) GetGardens(w http.ResponseWriter, r *http.Request) {
	var request GetGardensRequestObject

	handler := func(ctx context.Context, w http.ResponseWriter, r *http.Request, request interface{}) (interface{}, error) {
		return sh.ssi.GetGardens(ctx, request.(GetGardensRequestObject))
	}
	for _, middleware := range sh.middlewares {
		handler = middleware(handler, "GetGardens")
	}

	response, err := handler(r.Context(), w, r, request)

	if err != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, err)
	} else if validResponse, ok := response.(GetGardensResponseObject); ok {
		if err := validResponse.VisitGetGardensResponse(w); err != nil {
			sh.options.ResponseErrorHandlerFunc(w, r, err)
		}
	} else if response != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, fmt.Errorf("unexpected response type: %T", response))
	}
}

// PostGardens operation middleware
func (sh *strictHandler) PostGardens(w http.ResponseWriter, r *http.Request) {
	var request PostGardensRequestObject

	var body PostGardensJSONRequestBody
	if err := json.NewDecoder(r.Body).Decode(&body); err != nil {
		sh.options.RequestErrorHandlerFunc(w, r, fmt.Errorf("can't decode JSON body: %w", err))
		return
	}
	request.Body = &body

	handler := func(ctx context.Context, w http.ResponseWriter, r *http.Request, request interface{}) (interface{}, error) {
		return sh.ssi.PostGardens(ctx, request.(PostGardensRequestObject))
	}
	for _, middleware := range sh.middlewares {
		handler = middleware(handler, "PostGardens")
	}

	response, err := handler(r.Context(), w, r, request)

	if err != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, err)
	} else if validResponse, ok := response.(PostGardensResponseObject); ok {
		if err := validResponse.VisitPostGardensResponse(w); err != nil {
			sh.options.ResponseErrorHandlerFunc(w, r, err)
		}
	} else if response != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, fmt.Errorf("unexpected response type: %T", response))
	}
}

// GetGardensIdDevices operation middleware
func (sh *strictHandler) GetGardensIdDevices(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	var request GetGardensIdDevicesRequestObject

	request.Id = id

	handler := func(ctx context.Context, w http.ResponseWriter, r *http.Request, request interface{}) (interface{}, error) {
		return sh.ssi.GetGardensIdDevices(ctx, request.(GetGardensIdDevicesRequestObject))
	}
	for _, middleware := range sh.middlewares {
		handler = middleware(handler, "GetGardensIdDevices")
	}

	response, err := handler(r.Context(), w, r, request)

	if err != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, err)
	} else if validResponse, ok := response.(GetGardensIdDevicesResponseObject); ok {
		if err := validResponse.VisitGetGardensIdDevicesResponse(w); err != nil {
			sh.options.ResponseErrorHandlerFunc(w, r, err)
		}
	} else if response != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, fmt.Errorf("unexpected response type: %T", response))
	}
}

// PatchGardensIdDevices operation middleware
func (sh *strictHandler) PatchGardensIdDevices(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	var request PatchGardensIdDevicesRequestObject

	request.Id = id

	var body PatchGardensIdDevicesJSONRequestBody
	if err := json.NewDecoder(r.Body).Decode(&body); err != nil {
		sh.options.RequestErrorHandlerFunc(w, r, fmt.Errorf("can't decode JSON body: %w", err))
		return
	}
	request.Body = &body

	handler := func(ctx context.Context, w http.ResponseWriter, r *http.Request, request interface{}) (interface{}, error) {
		return sh.ssi.PatchGardensIdDevices(ctx, request.(PatchGardensIdDevicesRequestObject))
	}
	for _, middleware := range sh.middlewares {
		handler = middleware(handler, "PatchGardensIdDevices")
	}

	response, err := handler(r.Context(), w, r, request)

	if err != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, err)
	} else if validResponse, ok := response.(PatchGardensIdDevicesResponseObject); ok {
		if err := validResponse.VisitPatchGardensIdDevicesResponse(w); err != nil {
			sh.options.ResponseErrorHandlerFunc(w, r, err)
		}
	} else if response != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, fmt.Errorf("unexpected response type: %T", response))
	}
}

// GetGardensIdPlants operation middleware
func (sh *strictHandler) GetGardensIdPlants(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	var request GetGardensIdPlantsRequestObject

	request.Id = id

	handler := func(ctx context.Context, w http.ResponseWriter, r *http.Request, request interface{}) (interface{}, error) {
		return sh.ssi.GetGardensIdPlants(ctx, request.(GetGardensIdPlantsRequestObject))
	}
	for _, middleware := range sh.middlewares {
		handler = middleware(handler, "GetGardensIdPlants")
	}

	response, err := handler(r.Context(), w, r, request)

	if err != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, err)
	} else if validResponse, ok := response.(GetGardensIdPlantsResponseObject); ok {
		if err := validResponse.VisitGetGardensIdPlantsResponse(w); err != nil {
			sh.options.ResponseErrorHandlerFunc(w, r, err)
		}
	} else if response != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, fmt.Errorf("unexpected response type: %T", response))
	}
}

// PostGardensIdPlants operation middleware
func (sh *strictHandler) PostGardensIdPlants(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	var request PostGardensIdPlantsRequestObject

	request.Id = id

	var body PostGardensIdPlantsJSONRequestBody
	if err := json.NewDecoder(r.Body).Decode(&body); err != nil {
		sh.options.RequestErrorHandlerFunc(w, r, fmt.Errorf("can't decode JSON body: %w", err))
		return
	}
	request.Body = &body

	handler := func(ctx context.Context, w http.ResponseWriter, r *http.Request, request interface{}) (interface{}, error) {
		return sh.ssi.PostGardensIdPlants(ctx, request.(PostGardensIdPlantsRequestObject))
	}
	for _, middleware := range sh.middlewares {
		handler = middleware(handler, "PostGardensIdPlants")
	}

	response, err := handler(r.Context(), w, r, request)

	if err != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, err)
	} else if validResponse, ok := response.(PostGardensIdPlantsResponseObject); ok {
		if err := validResponse.VisitPostGardensIdPlantsResponse(w); err != nil {
			sh.options.ResponseErrorHandlerFunc(w, r, err)
		}
	} else if response != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, fmt.Errorf("unexpected response type: %T", response))
	}
}

// GetPlantsId operation middleware
func (sh *strictHandler) GetPlantsId(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	var request GetPlantsIdRequestObject

	request.Id = id

	handler := func(ctx context.Context, w http.ResponseWriter, r *http.Request, request interface{}) (interface{}, error) {
		return sh.ssi.GetPlantsId(ctx, request.(GetPlantsIdRequestObject))
	}
	for _, middleware := range sh.middlewares {
		handler = middleware(handler, "GetPlantsId")
	}

	response, err := handler(r.Context(), w, r, request)

	if err != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, err)
	} else if validResponse, ok := response.(GetPlantsIdResponseObject); ok {
		if err := validResponse.VisitGetPlantsIdResponse(w); err != nil {
			sh.options.ResponseErrorHandlerFunc(w, r, err)
		}
	} else if response != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, fmt.Errorf("unexpected response type: %T", response))
	}
}

// PutPlantsId operation middleware
func (sh *strictHandler) PutPlantsId(w http.ResponseWriter, r *http.Request, id openapi_types.UUID) {
	var request PutPlantsIdRequestObject

	request.Id = id

	var body PutPlantsIdJSONRequestBody
	if err := json.NewDecoder(r.Body).Decode(&body); err != nil {
		sh.options.RequestErrorHandlerFunc(w, r, fmt.Errorf("can't decode JSON body: %w", err))
		return
	}
	request.Body = &body

	handler := func(ctx context.Context, w http.ResponseWriter, r *http.Request, request interface{}) (interface{}, error) {
		return sh.ssi.PutPlantsId(ctx, request.(PutPlantsIdRequestObject))
	}
	for _, middleware := range sh.middlewares {
		handler = middleware(handler, "PutPlantsId")
	}

	response, err := handler(r.Context(), w, r, request)

	if err != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, err)
	} else if validResponse, ok := response.(PutPlantsIdResponseObject); ok {
		if err := validResponse.VisitPutPlantsIdResponse(w); err != nil {
			sh.options.ResponseErrorHandlerFunc(w, r, err)
		}
	} else if response != nil {
		sh.options.ResponseErrorHandlerFunc(w, r, fmt.Errorf("unexpected response type: %T", response))
	}
}

// Base64 encoded, gzipped, json marshaled Swagger object
var swaggerSpec = []string{

	"H4sIAAAAAAAC/9xWQW/bPAz9KwG/7+jF3tYdquNQoAgGbL3sVBSFZjGJCltSKbpAUfi/D5KcJq7dJdvc",
	"IuslMWSK4nt8j9YDlLZ21qBhD+IBfLnGWsZHhXe6xPgoldKsrZHVBVmHxDqt871DEOCZtFlBm20W7I8b",
	"LDksrCQpNCHW9XZqFX6XlmrJIKBptIJsmE/XcoXXDVWjpxlZ48iLNgPC20YTKhCXEDPH0KvHgq5LQsk4",
	"rOuwlI/ZXCUND7MsZcl+jcjXCeeg8q6KQ1l4ZbK21WV9KNkT5M/SODUBEyDbDyrs0GZpYy7NVUj23SPN",
	"lGQ580jBD5DBHZLX1oCAYv5+XoQSrEMjnQYBH+fFvIAMnOR1pCJPB8fnFUaxBKZk8NNCgYBz5PMuJFTs",
	"nTU+sfihKMJfaQ1jkpl0rtJl3JvfeGu2lo2mYqzjxv8JlyDgv3xr7rxzdlfOjlklkbyHiF6hL0k7Tui+",
	"fQlRn1IR/VcLw0hGVpEVpBkSWUo5nPUjIC+s76G8bdDzZ6vufwvgflwbRbZt6v9fsHkIidOQ1maPKskf",
	"tGrzndG7RzILddbFviDaTTnPwj0pToZwv1qeLW1j1B+pSJKskZE8iMun+xL22eIMgmFBRLNtfCzSDNta",
	"n6nBbAfpnmnTXkXzlusREYflUeKnl/MO5+1bau1A6/FDcpjUL1Loa0zJ9GE/eEi+OQPsG+K9Zkyv/t7t",
	"YgIL/As9D85IZojG+JUjEvcL9ZJDv2PjSBQfEb+k4JsxvTd9po9f50fU0HBOWkv9jLd3WDM7keeNR3oX",
	"rtXitDgtoL1qfwYAAP//elq8mYkOAAA=",
}

// GetSwagger returns the content of the embedded swagger specification file
// or error if failed to decode
func decodeSpec() ([]byte, error) {
	zipped, err := base64.StdEncoding.DecodeString(strings.Join(swaggerSpec, ""))
	if err != nil {
		return nil, fmt.Errorf("error base64 decoding spec: %w", err)
	}
	zr, err := gzip.NewReader(bytes.NewReader(zipped))
	if err != nil {
		return nil, fmt.Errorf("error decompressing spec: %w", err)
	}
	var buf bytes.Buffer
	_, err = buf.ReadFrom(zr)
	if err != nil {
		return nil, fmt.Errorf("error decompressing spec: %w", err)
	}

	return buf.Bytes(), nil
}

var rawSpec = decodeSpecCached()

// a naive cached of a decoded swagger spec
func decodeSpecCached() func() ([]byte, error) {
	data, err := decodeSpec()
	return func() ([]byte, error) {
		return data, err
	}
}

// Constructs a synthetic filesystem for resolving external references when loading openapi specifications.
func PathToRawSpec(pathToFile string) map[string]func() ([]byte, error) {
	res := make(map[string]func() ([]byte, error))
	if len(pathToFile) > 0 {
		res[pathToFile] = rawSpec
	}

	return res
}

// GetSwagger returns the Swagger specification corresponding to the generated code
// in this file. The external references of Swagger specification are resolved.
// The logic of resolving external references is tightly connected to "import-mapping" feature.
// Externally referenced files must be embedded in the corresponding golang packages.
// Urls can be supported but this task was out of the scope.
func GetSwagger() (swagger *openapi3.T, err error) {
	resolvePath := PathToRawSpec("")

	loader := openapi3.NewLoader()
	loader.IsExternalRefsAllowed = true
	loader.ReadFromURIFunc = func(loader *openapi3.Loader, url *url.URL) ([]byte, error) {
		pathToFile := url.String()
		pathToFile = path.Clean(pathToFile)
		getSpec, ok := resolvePath[pathToFile]
		if !ok {
			err1 := fmt.Errorf("path not found: %s", pathToFile)
			return nil, err1
		}
		return getSpec()
	}
	var specData []byte
	specData, err = rawSpec()
	if err != nil {
		return
	}
	swagger, err = loader.LoadFromData(specData)
	if err != nil {
		return
	}
	return
}