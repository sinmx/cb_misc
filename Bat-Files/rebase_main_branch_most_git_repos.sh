if [ -z "$HOMEDRIVE" ]
then
  cd ~/devel/open_source_code/version_control/git_repos
else
  cd $HOMEDRIVE/Users/$USERNAME/devel/open_source_code/version_control/git_repos
fi

# cd codeblocks_custom_build && git checkout master && git fetch origin && git rebase origin/master
cd wxTortoiseGit && git checkout master && git fetch upstream && git rebase upstream/master && \
cd ../wxWidgets && git checkout master && git fetch upstream && git rebase upstream/master
