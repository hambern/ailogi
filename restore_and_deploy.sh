#!/bin/bash

# Script to restore .github folder and deploy changes
# Usage: ./restore_and_deploy.sh "Optional commit message"

COMMIT_MSG="${1:-Update site content}"

echo "🔍 Checking for deleted .github folder..."
git checkout HEAD -- .github/
if [ $? -eq 0 ]; then
    echo "✅ .github folder restored."
else
    echo "⚠️  Could not restore .github. Make sure it exists in the last commit."
fi

echo "📦 Adding files..."
git add .

echo "qc Committing changes..."
git commit -m "$COMMIT_MSG"

echo "🚀 Pushing to main..."
git push origin main

echo "🎉 Done!"
