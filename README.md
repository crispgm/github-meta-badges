# GitHub Meta Badges

Simple GitHub Metadata Badges (e.g. stars, issues, and more)

## Usage

```
![](http://stars-badge.herokuapp.com/[username]/[reponame]/[metaname].svg)
```

Meta Names:

* stars
* forks
* watchers
* issues
* last-pages-build

## Examples

### Stars

![](http://stars-badge.herokuapp.com/crispgm/github-meta-badges/stars.svg)
```
![](http://stars-badge.herokuapp.com/crispgm/github-meta-badges/stars.svg)
```

### Last Pages Build

![](http://stars-badge.herokuapp.com/crispgm/crispgm.com/last-pages-build.svg)
```
![](http://stars-badge.herokuapp.com/crispgm/crispgm.com/last-pages-build.svg)
```

## Heroku

```
$ heroku create your-app-name
$ heroku git:remote -a your-app-name
$ heroku config:set GITHUB_ACCESS_TOKEN=your-github-access-token
$ git push heroku master
```
