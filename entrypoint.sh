#!/bin/sh -l

url="${1}"
file_in_repo="${2}"
repository="${3}"
branch="${4}"
commit_options="${5}"
add_options="${6}"
file_pattern="${7}"
push_options="${8}"
commit_user_name ="${9}"
commit_user_email ="${10}"
commit_author="${11}"
commit_message="${12}"

mkdir -p "$(dirname "$file_in_repo")"
wget "$url" -O "$file_in_repo"

cd "$repository"

git checkout "$branch" --

git add "$add_options" "$file_pattern"

git config user.name "$commit_user_name"
git config user.email "$commit_user_email"

git commit -m "$commit_message" --author="$commit_author" "$commit_options"

git push origin "$push_options"
