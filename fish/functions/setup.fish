## Defines abbreviations
function setup
    for abbreviation in (abbr -l)
        abbr -e $abbreviation
    end
    abbr c code .
    abbr g git
    abbr ga git add --all
    abbr gap git add --patch
    abbr gc git commit -m
    abbr gcm git checkout master
    abbr gco git checkout
    abbr gd git diff
    abbr gf git fetch
    abbr gg git graph
    abbr gm git merge --no-ff
    abbr gp git pull
    abbr gr git rb FETCH_HEAD
    abbr gs git status
    abbr gsm git submodule update --init --recursive
    abbr prune git remote prune origin
    abbr hash git rev-parse --short HEAD
    abbr ll ls -lhA
    abbr eh sudo vim /etc/hosts
    abbr bs brew services
    abbr .. cd ..
    abbr prod vtex config set env prod
    abbr staging vtex config set env staging
end
