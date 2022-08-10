function Build-Project() {
    [CmdletBinding()]
    param (
        [String]$ProjectPath = "."
    )

    $Seperator = "###################################################################################################"

    Write-Host $Seperator
    Write-Host $ProjectPath
    Write-Host $Seperator

    $ProjectList = Get-Item $ProjectPath


    foreach ($ProjectDirectory in $ProjectList) {


        if (IsJavaMavenProject($ProjectDirectory)) {
            Write-Host $Seperator
            Write-Host "{1} is a Java project directory, it will be build with maven."
            Set-Location $ProjectPath.FullName

            Get-MavenProject $ProjectDirectory.FullName

            mvn clean
            mvn install -DskipTests
            Set-Location $ProjectPath.Parent.FullName
            Write-Host $Seperator

        }
        elseif (IsJavaGradleProject($ProjectDirectory)) {

            Write-Host $Seperator
            Write-Host "{1} is a Java project directory, it will be build with gradle."
            Set-Location $ProjectPath.FullName

            Get-GradleProject $ProjectDirectory.FullName

            gradle clean
            gradle build
            Set-Location $ProjectPath.Parent.FullName
            Write-Host $Seperator

        }
        elseif (IsDotNetProject($ProjectDirectory)) {

            Write-Host $Seperator
            Write-Host "{1} is a .NET project directory, it will be build with msbuild."
            Set-Location $ProjectPath.FullName

            Get-DotNetProject $ProjectDirectory.FullName

            msbuild /p:Configuration=Release
            Set-Location $ProjectPath.Parent.FullName
            Write-Host $Seperator

        }
        elseif (IsJavascriptNodeProject($ProjectDirectory)) {
                
            Write-Host $Seperator
            Write-Host "{1} is a Javascript project directory, it will be build with npm."
            Set-Location $ProjectPath.FullName
    
            Get-JavascriptProject $ProjectDirectory.FullName
    
            npm install
            npm run build
            Set-Location $ProjectPath.Parent.FullName
            Write-Host $Seperator
    
        }
        elseif (IsJavascriptYarnProject($ProjectDirectory)) {
    
            Write-Host $Seperator
            Write-Host "{1} is a Javascript project directory, it will be build with yarn."
            Set-Location $ProjectPath.FullName
    
            Get-JavascriptProject $ProjectDirectory.FullName
    
            yarn install
            yarn run build
            Set-Location $ProjectPath.Parent.FullName
            Write-Host $Seperator
    
        }
        elseif (IsPythonProject($ProjectDirectory)) {
        
            Write-Host $Seperator
            Write-Host "{1} is a Python project directory, it will be build with pip."
            Set-Location $ProjectPath.FullName
        
            Get-PythonProject $ProjectDirectory.FullName
        
            pip install -r requirements.txt
            python setup.py install
            Set-Location $ProjectPath.Parent.FullName
            Write-Host $Seperator
        
        }
        elseif (IsRubyProject($ProjectDirectory)) {
        
            Write-Host $Seperator
            Write-Host "{1} is a Ruby project directory, it will be build with bundle."
            Set-Location $ProjectPath.FullName
        
            Get-RubyProject $ProjectDirectory.FullName
        
            bundle install
            bundle exec rake build
            Set-Location $ProjectPath.Parent.FullName
            Write-Host $Seperator
        
        }
        elseif (IsPHPProject($ProjectDirectory)) {
        
            Write-Host $Seperator
            Write-Host "{1} is a PHP project directory, it will be build with composer."
            Set-Location $ProjectPath.FullName
        
            Get-PHPProject $ProjectDirectory.FullName
        
            composer install
            composer run build
            Set-Location $ProjectPath.Parent.FullName
            Write-Host $Seperator
        
        }
        elseif (IsCSharpProject($ProjectDirectory)) {
        
            Write-Host $Seperator
            Write-Host "{1} is a C# project directory, it will be build with dotnet build."
            Set-Location $ProjectPath.FullName
        
            Get-CSharpProject $ProjectDirectory.FullName
            dotnet clean
            dotnet build
            Set-Location $ProjectPath.Parent.FullName
            Write-Host $Seperator
        
        }
        elseif (IsCProject($ProjectDirectory)) {
        
            Write-Host $Seperator
            Write-Host "{1} is a C project directory, it will be build with make."
            Set-Location $ProjectPath.FullName
        
            Get-CProject $ProjectDirectory.FullName
        
            make
            Set-Location $ProjectPath.Parent.FullName
        }
    }

    Write-Host $Seperator
    Write-Host "Build stage is complete for all projects."
    Write-Host $Seperator

}

function IsJavaMavenProject() {
    [CmdletBinding()]
    param (
        [String]$ProjectDirectory
    )

    $ProjectDirectory = $ProjectDirectory.FullName

    if (Test-Path $ProjectDirectory) {
        $ProjectDirectory = Get-ChildItem $ProjectDirectory
        foreach ($ProjectDirectory in $ProjectDirectory) {
            if ($ProjectDirectory.Extension -eq "pom.xml") {
                return $true
            }
        }
    }

    return $false
}

function IsJavaGradleProject() {
    [CmdletBinding()]
    param (
        [String]$ProjectDirectory
    )

    $ProjectDirectory = $ProjectDirectory.FullName

    if (Test-Path $ProjectDirectory) {
        $ProjectDirectory = Get-ChildItem $ProjectDirectory
        foreach ($ProjectDirectory in $ProjectDirectory) {
            if ($ProjectDirectory.Extension -eq "build.gradle") {
                return $true
            }
        }
    }

    return $false
}

function IsJavascriptNodeProject() {
    [CmdletBinding()]
    param (
        [String]$ProjectDirectory
    )

    $ProjectDirectory = $ProjectDirectory.FullName

    if (Test-Path $ProjectDirectory) {
        $ProjectDirectory = Get-ChildItem $ProjectDirectory
        foreach ($ProjectDirectory in $ProjectDirectory) {
            if ($ProjectDirectory.Extension -eq "package.json") {
                return $true
            }
        }
    }

    return $false
}

function IsJavascriptYarnProject() {
    [CmdletBinding()]
    param (
        [String]$ProjectDirectory
    )

    $ProjectDirectory = $ProjectDirectory.FullName

    if (Test-Path $ProjectDirectory) {
        $ProjectDirectory = Get-ChildItem $ProjectDirectory
        foreach ($ProjectDirectory in $ProjectDirectory) {
            if ($ProjectDirectory.Extension -eq "yarn.lock") {
                return $true
            }
        }
    }

    return $false
}

function IsDotNetProject() {
    [CmdletBinding()]
    param (
        [String]$ProjectDirectory
    )

    $ProjectDirectory = $ProjectDirectory.FullName

    if (Test-Path $ProjectDirectory) {
        $ProjectDirectory = Get-ChildItem $ProjectDirectory
        foreach ($ProjectDirectory in $ProjectDirectory) {
            if ($ProjectDirectory.Extension -eq ".csproj") {
                return $true
            }
        }
    }

    return $false
}

function IsPythonProject() {
    [CmdletBinding()]
    param (
        [String]$ProjectDirectory
    )

    $ProjectDirectory = $ProjectDirectory.FullName

    if (Test-Path $ProjectDirectory) {
        $ProjectDirectory = Get-ChildItem $ProjectDirectory
        foreach ($ProjectDirectory in $ProjectDirectory) {
            if ($ProjectDirectory.Extension -eq "requirements.txt") {
                return $true
            }
        }
    }

    return $false
}

function IsRubyProject() {
    [CmdletBinding()]
    param (
        [String]$ProjectDirectory
    )

    $ProjectDirectory = $ProjectDirectory.FullName

    if (Test-Path $ProjectDirectory) {
        $ProjectDirectory = Get-ChildItem $ProjectDirectory
        foreach ($ProjectDirectory in $ProjectDirectory) {
            if ($ProjectDirectory.Extension -eq "Gemfile") {
                return $true
            }
        }
    }

    return $false
}

function IsPHPProject() {
    [CmdletBinding()]
    param (
        [String]$ProjectDirectory
    )

    $ProjectDirectory = $ProjectDirectory.FullName

    if (Test-Path $ProjectDirectory) {
        $ProjectDirectory = Get-ChildItem $ProjectDirectory
        foreach ($ProjectDirectory in $ProjectDirectory) {
            if ($ProjectDirectory.Extension -eq "composer.json") {
                return $true
            }
        }
    }

    return $false
}

function IsCSharpProject() {
    [CmdletBinding()]
    param (
        [String]$ProjectDirectory
    )

    $ProjectDirectory = $ProjectDirectory.FullName

    if (Test-Path $ProjectDirectory) {
        $ProjectDirectory = Get-ChildItem $ProjectDirectory
        foreach ($ProjectDirectory in $ProjectDirectory) {
            if ($ProjectDirectory.Extension -eq ".sln") {
                return $true
            }
        }
    }

    return $false
}

function IsCProject() {
    [CmdletBinding()]
    param (
        [String]$ProjectDirectory
    )

    $ProjectDirectory = $ProjectDirectory.FullName

    if (Test-Path $ProjectDirectory) {
        $ProjectDirectory = Get-ChildItem $ProjectDirectory
        foreach ($ProjectDirectory in $ProjectDirectory) {
            if ($ProjectDirectory.Extension -eq "Makefile") {
                return $true
            }
        }
    }

    return $false
}


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

function ConvertTo-GradleProject() {
    [CmdletBinding()]
    [OutputType("GradleProject")]
    param(
        # A (set of) xml documents to convert
        [Parameter( Mandatory = $true, Position = 0, ValueFromPipeline = $true )]
        [json[]]
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

        $result.properties.PSObject.TypeNames.Insert(0, "GradleProject.GradleProperties")
        $result.PSObject.TypeNames.Insert(0, "GradleProject")

        $result | Add-Member -MemberType ScriptMethod -Name "ToString" -Force -Value {
            "$($this.Name) $($this.Version)"
        }

        Write-Output $result
    }

}

function Build-MavenProject() {

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

function Get-GradleProject() {
    [CmdletBinding()]
    param(
        # The maven project root
        [Parameter( Mandatory = $false, Position = 0, ValueFromPipeline = $true )]
        [System.IO.DirectoryInfo[]]
        $ProjectPath = [System.IO.DirectoryInfo]::new($pwd)
    )


    process {

        $project = Get-ChildItem $ProjectPath -Filter "build.gradle"
        if (-not $project) {
            Write-Warning "No build.gradle in $ProjectPath"
            return
        }

        $json = $ProjectPath.GetChildFile("build.gradle")
        $result = Get-Content $json | ConvertFrom-Json
        $result.Path = $project.FullName

        Write-Output $result
    }
}

function Get-DotNetProject() {
    [CmdletBinding()]
    param(
        # The maven project root
        [Parameter( Mandatory = $false, Position = 0, ValueFromPipeline = $true )]
        [System.IO.DirectoryInfo[]]
        $ProjectPath = [System.IO.DirectoryInfo]::new($pwd)
    )

    process {
        $project = Get-ChildItem $ProjectPath -Filter "*.csproj"
        if (-not $project) {
            Write-Warning "No csproj in $ProjectPath"
            return
        }

        $json = $ProjectPath.GetChildFile("project.json")
        $result = Get-Content $json | ConvertFrom-Json
        $result.Path = $project.FullName

        Write-Output $result
    }
}

function Get-JavascriptProject() {
    [CmdletBinding()]
    param(
        # The maven project root
        [Parameter( Mandatory = $false, Position = 0, ValueFromPipeline = $true )]
        [System.IO.DirectoryInfo[]]
        $ProjectPath = [System.IO.DirectoryInfo]::new($pwd)
    )

    process {
        $project = Get-ChildItem $ProjectPath -Filter "package.json"
        if (-not $project) {
            Write-Warning "No package.json in $ProjectPath"
            return
        }

        $json = $ProjectPath.GetChildFile("package.json")
        $result = Get-Content $json | ConvertFrom-Json
        $result.Path = $project.FullName

        Write-Output $result
    }
}

