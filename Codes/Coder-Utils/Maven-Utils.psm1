function Write-MavenProject {
    [CmdletBinding()]
    param (
        # the maven project root path
        [Parameter(Mandatory = $false)]
        [string]
        $path = $pwd
    )

    try {
        $project = Get-MavenProject -WarningAction SilentlyContinue
    }
    catch {

    }

    Write-Host "[" -NoNewline -ForegroundColor Yellow
    Write-Host $project.GroupId -ForegroundColor Cyan -NoNewline
    Write-Host "." -NoNewline
    Write-Host $project.artifactId -NoNewline -ForegroundColor Green
    Write-Host " " -NoNewline
    Write-Host $project.version -NoNewline -ForegroundColor Gray
    Write-Host "]" -NoNewline -ForegroundColor Yellow
}

function Get-MavenProject {
    [CmdletBinding()]
    param(
        # The maven project root
        [Parameter( Mandatory = $false, Position = 0, ValueFromPipeline = $true )]
        [System.IO.DirectoryInfo[]]
        $ProjectPath = [System.IO.DirectoryInfo]::new($pwd)
    )

    process {

        if (-not (Test-Path $ProjectPath)) {
            $path = (Get-Item $ProjectPath.FullName).FullName
        }
        else {
            $path = (Get-Item $ProjectPath).FullName
        }

        $pom = Get-ChildItem $path -Filter "pom.xml"
        if (-not $pom) {
            Write-Warning "No pom.xml in $ProjectPath"
            return
        }

        $result = [xml](Get-Content $pom.FullName) | ConvertTo-MavenProject
        $result.Path = $path

        $moduleList = New-Object -TypeName System.Collections.ArrayList
        foreach ($subModule in $result.modules) {
            $fp = $path + "\" + $subModule
            Write-Debug $fp
            $moduleList.Add((Get-MavenProject $fp)) | Out-Null
        }
        #Write-Verbose $moduleList
        $result.modules = $moduleList

        Write-Output $result
    }
}

function ConvertTo-MavenProject {
    [CmdletBinding()]
    [OutputType("MavenProject")]
    param(
        # A (set of) xml documents to convert
        [Parameter( Mandatory = $true, Position = 0, ValueFromPipeline = $true )]
        [xml[]]
        $ProjectPath
    )

    begin {
        New-Item function::local:Write-Verbose -Value (
            New-Module -ScriptBlock { param($verb, $fixedName, $verbose) } -ArgumentList @((Get-Command Write-Verbose), $PSCmdlet.MyInvocation.InvocationName, $PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent)
        ).NewBoundScriptBlock{
            param($Message)
            if ($verbose) {
                & $verb -Message "=>$fixedName $Message" -Verbose
            }
            else {
                & $verb -Message "=>$fixedName $Message"
            }
        } | Write-Verbose
    }

    process {
        $pom = $ProjectPath.project

        if (-not $pom) {
            Throw "No project node in input xml"
        }
        if ($pom.groupId) {
            $groupId = $pom.groupId
        }
        elseif ($pom.parent.groupId) {
            $groupId = $pom.parent.groupId
        }
        else {
            $groupId = "UNKNOWN"
        }

        $result = [PSCustomObject]@{
            Name                 = $groupId + ":" + $pom.artifactId;
            GroupId              = $groupId;
            ArtifactId           = $pom.artifactId;
            Version              = $pom.version;
            Parent               = $pom.parent;
            Properties           = $pom.properties;
            DependencyManagement = $pom.dependencyManagement;
            Dependencies         = [psobject[]]@($pom.dependencies.dependency);
            Build                = @{
                plugins = $pom.plugins.plugin;
            };
            Path                 = "";
            Modules              = $pom.modules.module;
            originalObject       = $ProjectPath
        }

        $properties = @{ }
        if ($pom.properties) {
            foreach ($property in ($pom.properties | Get-member | Where-Object MemberType -eq Property)) {
                $properties[$property.name] = $pom.properties[$property.name].'#text'
            }
        }
        $result.properties = New-Object -TypeName psobject -Property $properties

        $result.properties.PSObject.TypeNames.Insert(0, "MavenProject.MavenProperties")
        $result.PSObject.TypeNames.Insert(0, "MavenProject")

        $result | Add-Member -MemberType ScriptMethod -Name "ToString" -Force -Value {
            "$($this.Name) $($this.Version)"
        }

        Write-Output $result
    }
}

function Build-MavenProject(){

    [CmdletBinding()]
    param(
        # The maven project root
        [Parameter( Mandatory = $false, Position = 0, ValueFromPipeline = $true )]
        [System.IO.DirectoryInfo[]]
        $ProjectPath = [System.IO.DirectoryInfo]::new($pwd)
    )

    process {
        $ProjectInfo = Get-MavenProject -ProjectPath $ProjectPath -WarningAction SilentlyContinue

        Write-Output $ProjectInfo

        mvn clean install -f $ProjectInfo.Path -DskipTests
    }

}