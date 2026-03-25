#!/bin/bash
set -euo pipefail

echo "Cleaning up OpenShift resources..."
oc delete application.argoproj.io/discounts -n openshift-gitops --ignore-not-found
oc delete ns/discounts-gitops --ignore-not-found
oc delete ns/discounts-validation --ignore-not-found

echo "Removing discounts directory..."
git pull
rm -rf discounts/

echo "Committing changes..."
git add -A
git commit -m "🔥 Cleanup gitops configuration 🔥"
git push

echo "Done!"
