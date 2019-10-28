#进入仓库目录下
cd /e/gitTest/git test
#切换到feature分支
git checkout feature
#获取feature最新的提交ID
feature_id=$(git log --oneline | head -n 1|awk '{print $1}')
git checkout release
release_id=$(git log --oneline | head -n 1|awk '{print $1}')
echo $feature_id
echo $release_id
if [[ "$feature_id" == "release_id"]]
then
	echo "feature has no new commit"
else
	git merge feature
	LastestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
	echo -e "最新tag为..."
	echo -e "$LastestTag"
	echo -e "please enter a tag"
	read tagname
	git tag ${$tagName} -m ""
	#推送tag和变更到远程仓库
	git push
fi
