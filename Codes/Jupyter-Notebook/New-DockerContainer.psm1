function New-NetworkDocker(){
    docker network create --driver bridge edunet
}

function Get-NetworkDocker(){
    docker network inspect edunet
}

function New-VolumeDocker(){
    docker volume create eduvol
    docker volume inspect --format '{{ .Mountpoint }}' eduvol
}

function New-JavaNotebookDocker() {

    docker run `
        --name jnb `
        --publish '8888' `
        --env PASSWORD=edunet `
        --env JUPYTER_TOKEN=edunet `
        --detach `
        --network edunet `
        --volume eduvol:'/home/jovyan/work/' `
        docker.io/yilmazchef/java-notebook-server:latest
        
    docker container inspect jnb
    docker logs jnb
}

function New-DotNetNotebookDocker() {

    docker run `
        --name dnnb `
        --publish '8888' `
        --env PASSWORD=edunet `
        --env JUPYTER_TOKEN=edunet `
        --detach `
        --network edunet `
        --volume eduvol:'/home/jovyan/work/' `
        docker.io/yilmazchef/dotnet-notebook-server:latest
        
    docker container inspect dnnb
    docker logs dnnb
}

function New-JavascriptNotebookDocker(){

    docker run `
        --name jsnb `
        --publish '8888' `
        --env PASSWORD=edunet `
        --env JUPYTER_TOKEN=edunet `
        --detach `
        --network edunet `
        --volume eduvol:'/home/jovyan/work/' `
        docker.io/yilmazchef/javascript-notebook-server:latest
        
    docker container inspect jsnb
    docker logs jsnb
}

function New-PythonNotebookDocker(){

    docker run `
        --name pynb `
        --publish '8888' `
        --env PASSWORD=edunet `
        --env JUPYTER_TOKEN=edunet `
        --detach `
        --network edunet `
        --volume eduvol:'/home/jovyan/work/' `
        docker.io/yilmazchef/python-notebook-server:latest
        
    docker container inspect pynb
    docker logs pynb
}