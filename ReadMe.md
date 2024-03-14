this is a template repo for projects using my GithubDL "package manager" make sure you edit the manifest and any other TODO labels i add

also, manifest paths are relative to the repo root, and the files section entries are "CC path"="Repo Path"
description isn't used currently, but i might get arround to fixing that at some point, so add one anyways.
lastly, a project name must be unique inside the repo, things won't break if it matches projects outside the repo, but it may cause annoyance for users as it will require them being more specific when saying which project to install



add repo command:
```
GithubDL addRepo <GithubRepoUrl> [branch]
```

install package:
```
GithubDL install <projectName>
```
or:
```
GithubDL install <owner.repo.projectName>
```
or:
```
GithubDL install <owner.repo.branch.projectName>
```