## 2.0.0

- **Breaking**: consolidated multiple endpoint classes into single resource-specific
  builders (`MptZonesEndpoint`, `MptSolatV1Endpoint`, `MptSolatV2Endpoint`).
  Use the new named constructors (`listAll`, `byState`, `byGps`, `monthly`, `daily`,
  `byZone`) to recreate prior URLs.
- **Breaking**: removed `BaseEndpoint` and `getFullUrl`. Endpoint helpers now expose
  static methods that return `Uri` instances directly (e.g. `MptSolatV2Endpoint.byZone`).
  Update code to use the returned `Uri` instead of calling `.getFullUrl()`.

## 1.0.1

- Updated dhuha calculation to be 25 minutes after syuruk.

## 1.0.0

- Initial version.
