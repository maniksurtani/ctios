#!/bin/bash

endpoints="connectastic.EventsApi connectastic.AuthApi connectastic.DeviceRegistrationApi connectastic.GeoApi"

if [ -d ".git" ] ; then
  echo Working...
  ## Fetch service definitions first.
  if [ -d "../connectastic-web" ] ; then
    /usr/local/google_appengine/endpointscfg.py get_discovery_doc -a ../connectastic-web $endpoints --format rpc -o EndpointDefinitions

    for i in EndpointDefinitions/*.discovery ; do
      bin/ServiceGenerator --outputDir Connectastic-Endpoints/ $i
      if [ $? -eq 0 ] ; then echo OK ; else echo FAIL ; fi
    done
    echo
    echo
    echo "*********************************************************************"
    echo "Endpoint definitions downloaded and stubs built. You need to:"
    echo "   1. Check for any FAILs in the messages above."
    echo "   2. Re-import your CocoaPods by running 'pod install'"
    echo "   3. Build and test the app with the new client libs."
    echo "   4. Commit any of the newly generated files."
    echo "*********************************************************************"
  else
    echo "FATAL: Checkout 'connectastic-web' first. Needs to be under the same parent directory as 'connectastic-ios'."
  fi
else
  echo "FATAL: Run this from the 'connectastic-ios' directory, nowhere else!"
  exit 127
fi
