# GitHub Meta Badges

Simple GitHub Metadata Badges (e.g. stars, issues, and more)

## Usage

```
![](https://stars-badge.herokuapp.com/[username]/[reponame]/[metaname].svg)
```

Meta Names:

* [stars](#stars)
* [forks](#forks)
* [watchers](#watchers)
* [issues](#issues)
* [last-pages-build](#last-pages-build)

## Examples

### Stars

![](https://stars-badge.herokuapp.com/crispgm/github-meta-badges/stars.svg)
```
![](https://stars-badge.herokuapp.com/crispgm/github-meta-badges/stars.svg)
```

### Forks

![](https://stars-badge.herokuapp.com/crispgm/github-meta-badges/forks.svg)
```
![](https://stars-badge.herokuapp.com/crispgm/github-meta-badges/forks.svg)
```

### Watchers

![](https://stars-badge.herokuapp.com/crispgm/github-meta-badges/watchers.svg)
```
![](https://stars-badge.herokuapp.com/crispgm/github-meta-badges/watchers.svg)
```

### Issues

![](https://stars-badge.herokuapp.com/crispgm/github-meta-badges/issues.svg)
```
![](https://stars-badge.herokuapp.com/crispgm/github-meta-badges/issues.svg)
```

### Last Pages Build

![](https://stars-badge.herokuapp.com/crispgm/github-meta-badges/last-pages-build.svg)
```
![](https://stars-badge.herokuapp.com/crispgm/github-meta-badges/last-pages-build.svg)
```

## Heroku

```
$ heroku create your-app-name
$ heroku git:remote -a your-app-name
$ heroku config:set GITHUB_ACCESS_TOKEN=your-github-access-token
$ git push heroku master
```

## License

MIT
