enum Endpoint {
  listPeople,
}


class EndpointPaths {
  static Map<Endpoint, String> paths = {
    Endpoint.listPeople:'templates/Xp8zvwDP14dJ/data',

  };

  static String? getEndpointPath(Endpoint e) {
    return paths[e];
  }
}
