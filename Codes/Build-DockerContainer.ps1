function New-DockerImage() {
    $DockerUser = (Read-Host "Docker username");
    $BaseImage = (Read-Host "Base Image");
    $CustomImage = (Read-Host "Custom Image")

    New-Item -Path . -Name $CustomImage -ItemType File -Force

    docker build . -t "$DockerUser/$CustomImage"
}

New-DockerContainer