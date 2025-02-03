//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DefaultApi {
  DefaultApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /plants' operation and returns the [Response].
  Future<Response> plantsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/plants';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<List<Plant>?> plantsGet() async {
    final response = await plantsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Plant>')
              as List)
          .cast<Plant>()
          .toList(growable: false);
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /plants/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   plant ID
  Future<Response> plantsIdDeleteWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/plants/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  ///   plant ID
  Future<Factsheet?> plantsIdDelete(
    String id,
  ) async {
    final response = await plantsIdDeleteWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'Factsheet',
      ) as Factsheet;
    }
    return null;
  }

  /// Performs an HTTP 'GET /plants/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   plant ID
  Future<Response> plantsIdGetWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/plants/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  ///   plant ID
  Future<Factsheet?> plantsIdGet(
    String id,
  ) async {
    final response = await plantsIdGetWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'Factsheet',
      ) as Factsheet;
    }
    return null;
  }

  /// Performs an HTTP 'PUT /plants/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   plant ID
  ///
  /// * [Plant] plant:
  Future<Response> plantsIdPutWithHttpInfo(
    String id, {
    Plant? plant,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/plants/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = plant;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  ///   plant ID
  ///
  /// * [Plant] plant:
  Future<Plant?> plantsIdPut(
    String id, {
    Plant? plant,
  }) async {
    final response = await plantsIdPutWithHttpInfo(
      id,
      plant: plant,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'Plant',
      ) as Plant;
    }
    return null;
  }

  /// Performs an HTTP 'GET /plants/{id}/requirements' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> plantsIdRequirementsGetWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/plants/{id}/requirements'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Requirements?> plantsIdRequirementsGet(
    String id,
  ) async {
    final response = await plantsIdRequirementsGetWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'Requirements',
      ) as Requirements;
    }
    return null;
  }

  /// Performs an HTTP 'GET /plants/{id}/taxonomy' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> plantsIdTaxonomyGetWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/plants/{id}/taxonomy'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Taxonomy?> plantsIdTaxonomyGet(
    String id,
  ) async {
    final response = await plantsIdTaxonomyGetWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'Taxonomy',
      ) as Taxonomy;
    }
    return null;
  }

  /// Performs an HTTP 'POST /plants' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Plant] plant:
  Future<Response> plantsPostWithHttpInfo({
    Plant? plant,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/plants';

    // ignore: prefer_final_locals
    Object? postBody = plant;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [Plant] plant:
  Future<Plant?> plantsPost({
    Plant? plant,
  }) async {
    final response = await plantsPostWithHttpInfo(
      plant: plant,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'Plant',
      ) as Plant;
    }
    return null;
  }

  /// Performs an HTTP 'POST /search' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [SearchRequest] searchRequest:
  Future<Response> searchPostWithHttpInfo({
    SearchRequest? searchRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/search';

    // ignore: prefer_final_locals
    Object? postBody = searchRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [SearchRequest] searchRequest:
  Future<List<Plant>?> searchPost({
    SearchRequest? searchRequest,
  }) async {
    final response = await searchPostWithHttpInfo(
      searchRequest: searchRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Plant>')
              as List)
          .cast<Plant>()
          .toList(growable: false);
    }
    return null;
  }
}
