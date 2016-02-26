Feature: OSB Emissions Fix - Manage VIN import data (VWOSBEB-1)
  As a Tribal Admin
  I want to Manage VIN lists of affected and fixed vehicles
  So that I can have a clear view on customers who are eligible for emission fix work

Scenario: Letter sent batch 1 (check user able to book Emissions Fix if VIN is part of batch)
  Given VINs (with letters from batch 1 sent to their owners) imported to Tribal databsee
  When booking a service with a vehicle reg which corresponds to any of those VINs
  Then The user should be able to see 'Emissions Fix' in the 'select work' section
  And be able to book it

Scenario: Letter sent batch 1 (check user NOT able to book Emissions Fix if VIN is NOT part of batch)
  Given VINs (with letters from batch 1 sent to their owners) imported to Tribal databsee
  When booking a service with a vehicle reg which DOES NOT correspond to any of those VINs
  Then The user should NOT be able to see 'Emissions Fix' in the 'select work' section

Scenario: Letter sent batch 2 (check user still able to book Emissions Fix if VIN from batch 1, and batch 2 is consolidated to DB)
  Given VINs (with letters from batch 1 sent to their owners) imported to Tribal database
  And now VINs (with letters from batch 2 sent to their owners) also imported to Tribal database
  When booking a service with a vehicle reg which corresponds to any of those VINs with letters from batch 1
  Then The user should STILL be able to see 'Emissions Fix' in the 'select work' section
  And be able to book it

Scenario: Letter sent batch 2 (check user NOT able to book Emissions Fix if VIN is NOT part of batch 1 and 2 letters)
  Given VINs (with letters from batch 1 sent to their owners) imported to Tribal database
  And now VINs (with letters from batch 2 sent to their owners) also imported to Tribal database
  When booking a service with a vehicle reg which DOES NOT correspond to any of those VINs with letters from batch 1 or 2
  Then The user should NOT be able to see 'Emissions Fix' in the 'select work' section

Scenario: Letter sent batch 2 (check user able to book Emissions Fix if VIN is part of batch 2 only)
  Given VINs (with letters from batch 1 sent to their owners) imported to Tribal database
  And now VINs (with letters from batch 2 sent to their owners) also imported to Tribal database
  When booking a service with a vehicle reg which DOES NOT correspond to any of those VINs with letters from batch 1
  But has a vehicle reg corresponding to those VINs with letters from batch 2
  Then The user should be able to see 'Emissions Fix' in the 'select work' section
  And be able to book it

Scenario: Fixed batch 1 (check user NOT able to book Emissions Fix if VIN from 'letters sent batch 1' is now in 'Fixed batch 1')
  Given VINs (with letters batch 1 and batch 2) imported to Tribal database
  And now VINs (from the Fixed batch 1) now imported to Tribal database
  When booking a service for a vehicle reg which corresponds to any of those VINs from 'letters batch 1' as well as 'fixed batch 1'
  Then The user should NOT be able to see 'Emissions Fix' in the 'select work' section

Scenario: Fixed batch 1 (check user able to book Emissions Fix if VIN from 'letters sent batch 1' but is NOT in 'Fixed batch 1')
  Given VINs (with letters batch 1 and batch 2) imported to Tribal database
  And now VINs (from the Fixed batch 1) now imported to Tribal database
  When booking a service for a vehicle reg which corresponds to any of those VINs from 'letters batch 1' BUT NOT in 'fixed batch 1'
  Then The user should be able to see 'Emissions Fix' in the 'select work' section
  And be able to book it

Scenario: Fixed batch 2 (check user NOT able to book Emissions Fix if VIN from 'letters sent batch 1 or batch 2' is now in 'Fixed batch 2')
  Given VINs (with letters batch 1 and batch 2) imported to Tribal database
  And VINs (from the Fixed batch 1) have been imported to Tribal database
  And now VINs (from the Fixed batch 2) are imported to Tribal database
  When booking a service for a vehicle reg which corresponds to any of those VINs from 'letters batch 1 or 2' as well as 'fixed batch 2'
  Then The user should NOT be able to see 'Emissions Fix' in the 'select work' section
