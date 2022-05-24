function New-DockerContainer() {
	docker run --detach `
		--name (Read-Host "Container Name") `
		--env MYSQL_ROOT_PASSWORD=toor `
		--env MYSQL_DATABASE=intecdb `
		--env MYSQL_USER=intec `
		--env MYSQL_PASSWORD=intec-123 `
		--publish (Read-Host "External port"):3306 `
		mysql:latest
}

New-DockerContainer
