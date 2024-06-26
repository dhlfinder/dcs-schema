# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.0] - 2024-06-27
### Removed
- Shoptype `paketShop` has been removed.

## [2.1.0] - 2024-03-19
### Updated
- Added the following services:
  - `acceptFirstmileParcelLabelled`
  - `acceptFirstmileParcelUnlabelled`
  - `acceptReturnParcelLabelled`
  - `acceptReturnParcelUnlabelled`
- The following services are now DEPRECATED:
  - `acceptUnlabelledParcel`
  - `parcelacceptance`
- The field `<header>` is now optional in the export schema

## [2.0.0] - 2024-03-05
This is the final release for the previous candidates. No further changes.

## [2.0.0-rc3] - 2024-02-07
### Updated
- Updated description text for primaryKeyZipRegion to be more precise

## [2.0.0-rc2] - 2023-10-17
### Updated
- Various descriptions in the schema have been updated to better reflect the content

## [2.0.0-rc1] - 2023-08-28
### Updated
- Documentation for additionalStreet field
- Max length for additionalInfo field is now 80

### Removed
- Shoptypes: relaisCollis, kariboo, paketBox, pointOfSale, parcelStation
- welcomeTexts
- partnerType
- categoryType
- schemaVersion, fileDate, fileName
- Services: EPS, NPS
- addressFormat, format1, format2
- pinService
- closureTime1, +2, +3, +4
- patternPicture
- welcomeText
- files

## [1.1.4] - 2024-02-06
### Changed
- Increased max length of additionalInfo to 80 to match the FACTS data

## [1.1.3] - 2024-01-31
### Changed
- Removed constraints on systemID and primaryKeyDeliverySystem from export schema
- Increased allowed number of locations in export schema to 999,999,999

These changes help to make the export file actually validate successfully against the schema.

## [1.1.2] - 2022-12-16
### Changed
- Updated many field descriptions to be more helpful

## [1.1.1] - 2022-12-16
### Changed
- The following fields or values have been deprecated for import, made optional and will be removed in a future update:
  - shopTypes: relaisCollis, kariboo, paketBox, pointOfSale, parcelStation
  - service: NPS, EPS, PINService
  - timeInfoType: closuretime1, closuretime2, closuretime3, closuretime4
  - schemaVersion
  - fileDate
  - fileName
  - format1
  - format2
  - partnerType
  - welcomeTexts
  - files
- The deprecated fields and values will no longer be exported.
- Updated the description for systemID to be more helpful
- The otherInfoTypes for *packstation_utilization* (including the daily values) have been renamed to just *utilization* to indicate they can be used for any location type


## [1.1.0] - 2022-08-24
### Changed
- Replaced preview service type "mobileParcelStamp" with "acceptUnlabelledParcel" and added it as a real service

## [1.0.1] - 2022-04-01
### Changed
- Fix unique validation of primaryKeyDeliverySystem to allow more diverse tokens again

## [1.0.0] - 2022-03-30
Initial release of standalone schema bundle.

### Changed
(in comparison to embedded version)  
- Enforcing rule: SystemID must be the same in all fields of a document
- Enforcing rule: primaryKeyDeliverySystem must be unique across the document
- Added upcoming services "bulky" and "mobileParcelStamp"
