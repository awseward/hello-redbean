RB_PORT ?= 8080
uri = http://localhost:${RB_PORT}

up: open_bg redbean.com
	echo "${uri}"
	bash -c "./redbean.com -m -p ${RB_PORT} -vv"

open_bg: redbean.com
	bash -c "sleep '0.5'; open '${uri}' || true" &

# TODO: Figure out why this breaks it
index-add: index.html
	zip redbean.com index.html

index.html:
	echo '<h1>hello</h1>' >index.html

rb-ls: redbean.com
	unzip -v redbean.com
	du -h redbean.com

redbean.com:
	curl -s https://justine.lol/redbean/redbean-latest.com >redbean.com
	unzip -v redbean.com
	du -h redbean.com

	chmod +x redbean.com
