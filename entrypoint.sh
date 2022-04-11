#!/bin/sh -l

url="$1"
file_in_repo="$2"
branch="$3"
commit_options="$4"
add_options="$5"
file_pattern="$6"
push_options="$7"
commit_user_name ="$8"
commit_user_email ="$9"
commit_author="$10"

mkdir -p "$(dirname "$file_in_repo")"

git checkout "$branch" --

wget "$url" -O "$file_in_repo"

git add "$add_options" "$file_pattern"

git config user.name "$commit_user_name "
git config user.email "$commit_user_email "

git commit -m "Update $(basename "$file_in_repo") from $url"  --author="$commit_author" "$commit_options"

git push origin "$push_options"
