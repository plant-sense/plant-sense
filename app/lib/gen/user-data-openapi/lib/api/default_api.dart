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

  /// Performs an HTTP 'GET /gardens' operation and returns the [Response].
  Future<Response> gardensGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/gardens';

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

  Future<List<Garden>?> gardensGet() async {
    final response = await gardensGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Garden>')
              as List)
          .cast<Garden>()
          .toList(growable: false);
    }
    return null;
  }

  /// Performs an HTTP 'GET /gardens/{id}/devices' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Garden ID
  Future<Response> gardensIdDevicesGetWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/gardens/{id}/devices'.replaceAll('{id}', id);

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
  ///   Garden ID
  Future<Map<String, String>?> gardensIdDevicesGet(
    String id,
  ) async {
    final response = await gardensIdDevicesGetWithHttpInfo(
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
      return Map<String, String>.from(
        await apiClient.deserializeAsync(
            await _decodeBodyBytes(response), 'Map<String, String>'),
      );
    }
    return null;
  }

  /// Performs an HTTP 'PATCH /gardens/{id}/devices' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Garden ID
  ///
  /// * [Map<String, String>] requestBody:
  Future<Response> gardensIdDevicesPatchWithHttpInfo(
    String id, {
    Map<String, String>? requestBody,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/gardens/{id}/devices'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = requestBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PATCH',
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
  ///   Garden ID
  ///
  /// * [Map<String, String>] requestBody:
  Future<Map<String, String>?> gardensIdDevicesPatch(
    String id,
    devicePatch, {
    Map<String, String>? requestBody,
  }) async {
    final response = await gardensIdDevicesPatchWithHttpInfo(
      id,
      requestBody: requestBody,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return Map<String, String>.from(
        await apiClient.deserializeAsync(
            await _decodeBodyBytes(response), 'Map<String, String>'),
      );
    }
    return null;
  }

  /// Performs an HTTP 'GET /gardens/{id}/plants' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Garden ID
  Future<Response> gardensIdPlantsGetWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/gardens/{id}/plants'.replaceAll('{id}', id);

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
  ///   Garden ID
  Future<List<Plant>?> gardensIdPlantsGet(
    String id,
  ) async {
    final response = await gardensIdPlantsGetWithHttpInfo(
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
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Plant>')
              as List)
          .cast<Plant>()
          .toList(growable: false);
    }
    return null;
  }

  /// Performs an HTTP 'POST /gardens/{id}/plants' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Garden ID
  ///
  /// * [PlantCreate] plantCreate:
  Future<Response> gardensIdPlantsPostWithHttpInfo(
    String id, {
    PlantCreate? plantCreate,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/gardens/{id}/plants'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = plantCreate;

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
  /// * [String] id (required):
  ///   Garden ID
  ///
  /// * [PlantCreate] plantCreate:
  Future<List<Plant>?> gardensIdPlantsPost(
    String id, {
    PlantCreate? plantCreate,
  }) async {
    final response = await gardensIdPlantsPostWithHttpInfo(
      id,
      plantCreate: plantCreate,
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

  /// Performs an HTTP 'POST /gardens' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [GardenCreate] gardenCreate:
  Future<Response> gardensPostWithHttpInfo({
    GardenCreate? gardenCreate,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/gardens';

    // ignore: prefer_final_locals
    Object? postBody = gardenCreate;

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
  /// * [GardenCreate] gardenCreate:
  Future<Garden?> gardensPost({
    GardenCreate? gardenCreate,
  }) async {
    final response = await gardensPostWithHttpInfo(
      gardenCreate: gardenCreate,
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
        'Garden',
      ) as Garden;
    }
    return null;
  }

  /// Performs an HTTP 'GET /plants/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Plant ID
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
  ///   Plant ID
  Future<Plant?> plantsIdGet(
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
        'Plant',
      ) as Plant;
    }
    return null;
  }

  /// Performs an HTTP 'PUT /plants/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Plant ID
  ///
  /// * [PlantCreate] plantCreate:
  Future<Response> plantsIdPutWithHttpInfo(
    String id, {
    PlantCreate? plantCreate,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/plants/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = plantCreate;

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
  ///   Plant ID
  ///
  /// * [PlantCreate] plantCreate:
  Future<Plant?> plantsIdPut(
    String id, {
    PlantCreate? plantCreate,
  }) async {
    final response = await plantsIdPutWithHttpInfo(
      id,
      plantCreate: plantCreate,
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
}
