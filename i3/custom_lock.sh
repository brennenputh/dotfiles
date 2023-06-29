mkdir -p /tmp/lock-shot/
fswebcam -r 640x480 --jpeg 85 -D 1 /tmp/lock-shot/lock-shot.jpg

ntfy pub \
	--title="Main Desktop Unlocked" \
	--priority=2 \
	--file /tmp/lock-shot/lock-shot.jpg \
	bp-alert-notify \
	"Someone just unlocked your desktop."
