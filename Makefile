image:
	podman build -t docker-fossil .
run:
	podman run --rm -it -p 8080:8080 -v /dev/zero:/dev/zero docker-fossil
run-sh:
	podman run --rm -it -p 8080:8080 -v /dev/zero:/dev/zero docker-fossil sh
