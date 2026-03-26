#!/bin/bash

# 1. Create React app
npx create-react-app my-app
cd my-app

# 2. Initialize Git
git init
git add .
git commit -m "initial commit"

# 3. Create GitHub repo and push
gh repo create my-app --public --source=. --remote=origin --push

# 4. Create a feature branch
git checkout -b update_logo

# 5. Replace logo and update link
curl -o src/logo.svg https://www.propelleraero.com/wp-content/uploads/2021/05/Vector.svg
sed -i 's|https://reactjs.org|https://www.propelleraero.com/dirtmate/|g' src/App.js

# 6. Commit changes
git add .
git commit -m "Update logo and link"

# 7. Push feature branch
git push -u origin update_logo

# 8. Create and merge PR
gh pr create --base main --head update_logo --title "Update logo and link" --body "Replaced logo and updated link"
gh pr merge update_logo --merge --delete-branch

# 9. Repository URL
# REPO_URL https://github.com/nakia-lab/my-app
