function New-NetworkPodman(){
    podman network create --driver bridge edunet
}

function New-NetworkDocker(){
    docker network create --driver bridge edunet
}

function Inspect-NetworkPodman(){
    podman network inspect edunet
}

function Inspect-NetworkDocker(){
    docker network inspect edunet
}

function Run-JavaPodman() {

    podman run `
        --name jnb `
        --publish '8888' `
        --env PASSWORD=intec-123 `
        --env JUPYTER_TOKEN=intec-123 `
        --detach `
        --network edunet `
        --volume ./:/home/jovyan/work/ `
        docker.io/yilmazchef/java-notebook-server:latest
        
    podman container inspect jnb
    podman logs jnb
    Inspect-NetworkPodman

}

function Run-JavaDocker() {

    docker run `
        --name jnb `
        --publish '8888' `
        --env PASSWORD=intec-123 `
        --env JUPYTER_TOKEN=intec-123 `
        --detach `
        --network edunet `
        --volume ./:/home/jovyan/work/ `
        docker.io/yilmazchef/java-notebook-server:latest
        
    docker container inspect jnb
    docker logs jnb
    Inspect-NetworkDocker

}

function Run-DotNetPodman() {

    podman run `
        --name dnnb `
        --publish '8888' `
        --env PASSWORD=intec-123 `
        --env JUPYTER_TOKEN=intec-123 `
        --detach `
        --network edunet `
        --volume ./:/home/jovyan/work/ `
        docker.io/yilmazchef/dotnet-notebook-server:latest
        
    podman container inspect dnnb
    podman logs dnnb
    Inspect-NetworkPodman

}

function Run-DotNetDocker() {

    docker run `
        --name dnnb `
        --publish '8888' `
        --env PASSWORD=intec-123 `
        --env JUPYTER_TOKEN=intec-123 `
        --detach `
        --network edunet `
        --volume ./:/home/jovyan/work/ `
        docker.io/yilmazchef/dotnet-notebook-server:latest
        
    docker container inspect dnnb
    docker logs dnnb
    Inspect-NetworkDocker

}

function Run-JavascriptPodman(){

    podman run `
        --name jsnb `
        --publish '8888' `
        --env PASSWORD=intec-123 `
        --env JUPYTER_TOKEN=intec-123 `
        --detach `
        --network edunet `
        --volume ./:/home/jovyan/work/ `
        docker.io/yilmazchef/javascript-notebook-server:latest
        
    podman container inspect jsnb
    podman logs jsnb
    Inspect-NetworkPodman

}

function Run-JavascriptDocker(){

    docker run `
        --name jsnb `
        --publish '8888' `
        --env PASSWORD=intec-123 `
        --env JUPYTER_TOKEN=intec-123 `
        --detach `
        --network edunet `
        --volume ./:/home/jovyan/work/ `
        docker.io/yilmazchef/javascript-notebook-server:latest
        
    docker container inspect jsnb
    docker logs jsnb
    Inspect-NetworkDocker

}

function Run-PythonPodman(){

    podman run `
        --name pynb `
        --publish '8888' `
        --env PASSWORD=intec-123 `
        --env JUPYTER_TOKEN=intec-123 `
        --detach `
        --network edunet `
        --volume ./:/home/jovyan/work/ `
        docker.io/yilmazchef/python-notebook-server:latest
        
    podman container inspect pynb
    podman logs pynb
    Inspect-NetworkPodman
}

function Run-PythonDocker(){

    docker run `
        --name pynb `
        --publish '8888' `
        --env PASSWORD=intec-123 `
        --env JUPYTER_TOKEN=intec-123 `
        --detach `
        --network edunet `
        --volume ./:/home/jovyan/work/ `
        docker.io/yilmazchef/python-notebook-server:latest
        
    docker container inspect pynb
    docker logs pynb
    Inspect-NetworkDocker
}