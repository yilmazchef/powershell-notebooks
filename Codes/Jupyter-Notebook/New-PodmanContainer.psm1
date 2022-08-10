function New-NetworkPodman(){
    podman network create --driver bridge edunet
}

function Get-NetworkPodman(){
    podman network inspect edunet
}

function New-VolumePodman(){
    podman volume create eduvol
    podman volume inspect --format '{{ .Mountpoint }}' eduvol
}

function New-JavaNotebookPodman() {

    podman run `
        --name jnb `
        --publish '8888' `
        --env PASSWORD=edunet `
        --env JUPYTER_TOKEN=edunet `
        --detach `
        --network edunet `
        --volume eduvol:'/home/jovyan/work/' `
        docker.io/yilmazchef/java-notebook-server:latest
        
    podman container inspect jnb
    podman logs jnb
}

function New-DotNetNotebookPodman() {

    podman run `
        --name dnnb `
        --publish '8888' `
        --env PASSWORD=edunet `
        --env JUPYTER_TOKEN=edunet `
        --detach `
        --network edunet `
        --volume eduvol:'/home/jovyan/work/' `
        docker.io/yilmazchef/dotnet-notebook-server:latest
        
    podman container inspect dnnb
    podman logs dnnb
}

function New-JavascriptNotebookPodman(){

    podman run `
        --name jsnb `
        --publish '8888' `
        --env PASSWORD=edunet `
        --env JUPYTER_TOKEN=edunet `
        --detach `
        --network edunet `
        --volume eduvol:'/home/jovyan/work/' `
        docker.io/yilmazchef/javascript-notebook-server:latest
        
    podman container inspect jsnb
    podman logs jsnb
}

function New-PythonNotebookPodman(){

    podman run `
        --name pynb `
        --publish '8888' `
        --env PASSWORD=edunet `
        --env JUPYTER_TOKEN=edunet `
        --detach `
        --network edunet `
        --volume eduvol:'/home/jovyan/work/' `
        docker.io/yilmazchef/python-notebook-server:latest
        
    podman container inspect pynb
    podman logs pynb
}
