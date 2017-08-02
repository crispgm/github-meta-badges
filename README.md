# GitHub Meta Badges

![](https://travis-ci.org/crispgm/github-meta-badges.svg)

Simple GitHub Metadata Badges (e.g. stars, issues, and more)

## Usage

```
![](https://github-meta-badges.herokuapp.com/[username]/[reponame]/[metaname].svg)
```

Metadata Supported:

* [stars](#stars)
* [forks](#forks)
* [watchers](#watchers)
* [issues](#issues)
* [last-pages-build](#last-pages-build)

## Examples

### Stars

![](https://github-meta-badges.herokuapp.com/crispgm/github-meta-badges/stars.svg)
```
![](https://github-meta-badges.herokuapp.com/crispgm/github-meta-badges/stars.svg)
```

### Forks

![](https://github-meta-badges.herokuapp.com/crispgm/github-meta-badges/forks.svg)
```
![](https://github-meta-badges.herokuapp.com/crispgm/github-meta-badges/forks.svg)
```

### Watchers

![](https://github-meta-badges.herokuapp.com/crispgm/github-meta-badges/watchers.svg)
```
![](https://github-meta-badges.herokuapp.com/crispgm/github-meta-badges/watchers.svg)
```

### Issues

![](https://github-meta-badges.herokuapp.com/crispgm/github-meta-badges/issues.svg)
```
![](https://github-meta-badges.herokuapp.com/crispgm/github-meta-badges/issues.svg)
```

### Last Pages Build

![](https://github-meta-badges.herokuapp.com/crispgm/github-meta-badges/last-pages-build.svg)
```
![](https://github-meta-badges.herokuapp.com/crispgm/github-meta-badges/last-pages-build.svg)
```

## Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/crispgm/github-meta-badges)

```
$ heroku create your-app-name
$ heroku git:remote -a your-app-name
$ heroku config:set GITHUB_ACCESS_TOKEN=your-github-access-token
$ git push heroku master
```

## License

MIT
