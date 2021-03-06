// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Keywords' API calls
class Keywords {
  final TMDBApiCore _core;

  Keywords(this._core);

  /// Get the basic information for a specific keyword id.
  ///
  ///     // Usage
  ///     Map result = await tmdb.keywords.getInfo('105');
  Future<Map> getInfo(String id) {
    _checkNotNull(id, 'id');
    return _core._query('keyword/$id');
  }

  /// Get the list of movies for a particular keyword by id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.keywords.getMovies('878');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.keywords.getMovies('878', language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.keywords.getMovies('878', page: 2);
  Future<Map> getMovies(String id, {int page, String language}) {
    _Params params = new _Params();
    _checkNotNull(id, 'id');
    params['page'] = page;
    params['language'] = language;
    return _core._query('keyword/$id/movies', params: params);
  }
}
