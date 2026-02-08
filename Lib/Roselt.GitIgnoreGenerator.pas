// GitIgnore Generator Library
// Based on templates from: https://github.com/github/gitignore

unit Roselt.GitIgnoreGenerator;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections;

type
  TGitIgnoreTemplate = record
    Name: String;
    Description: String;
    Category: String;
    Content: String;
  end;

function GetGitIgnoreTemplates: TArray<TGitIgnoreTemplate>;
function GetGitIgnoreTemplateByName(const AName: String): String;
function GetTemplateCategories: TArray<String>;
function GetTemplatesByCategory(const ACategory: String): TArray<TGitIgnoreTemplate>;

implementation

function GetGitIgnoreTemplates: TArray<TGitIgnoreTemplate>;
begin
  SetLength(Result, 10);
  
  // Python
  Result[0].Name := 'Python';
  Result[0].Description := 'Python projects';
  Result[0].Category := 'Languages';
  Result[0].Content := 
    '# Byte-compiled / optimized / DLL files' + sLineBreak +
    '__pycache__/' + sLineBreak +
    '*.py[cod]' + sLineBreak +
    '*$py.class' + sLineBreak +
    '' + sLineBreak +
    '# C extensions' + sLineBreak +
    '*.so' + sLineBreak +
    '' + sLineBreak +
    '# Distribution / packaging' + sLineBreak +
    '.Python' + sLineBreak +
    'build/' + sLineBreak +
    'develop-eggs/' + sLineBreak +
    'dist/' + sLineBreak +
    'downloads/' + sLineBreak +
    'eggs/' + sLineBreak +
    '.eggs/' + sLineBreak +
    'lib/' + sLineBreak +
    'lib64/' + sLineBreak +
    'parts/' + sLineBreak +
    'sdist/' + sLineBreak +
    'var/' + sLineBreak +
    'wheels/' + sLineBreak +
    '*.egg-info/' + sLineBreak +
    '.installed.cfg' + sLineBreak +
    '*.egg' + sLineBreak +
    'MANIFEST' + sLineBreak +
    '' + sLineBreak +
    '# PyInstaller' + sLineBreak +
    '*.manifest' + sLineBreak +
    '*.spec' + sLineBreak +
    '' + sLineBreak +
    '# Unit test / coverage reports' + sLineBreak +
    'htmlcov/' + sLineBreak +
    '.tox/' + sLineBreak +
    '.nox/' + sLineBreak +
    '.coverage' + sLineBreak +
    '.coverage.*' + sLineBreak +
    '.cache' + sLineBreak +
    'nosetests.xml' + sLineBreak +
    'coverage.xml' + sLineBreak +
    '*.cover' + sLineBreak +
    '*.py,cover' + sLineBreak +
    '.pytest_cache/' + sLineBreak +
    '' + sLineBreak +
    '# Environments' + sLineBreak +
    '.env' + sLineBreak +
    '.venv' + sLineBreak +
    'env/' + sLineBreak +
    'venv/' + sLineBreak +
    'ENV/' + sLineBreak +
    'env.bak/' + sLineBreak +
    'venv.bak/' + sLineBreak +
    '' + sLineBreak +
    '# IDEs' + sLineBreak +
    '.vscode/' + sLineBreak +
    '.idea/' + sLineBreak +
    '*.swp' + sLineBreak +
    '*.swo' + sLineBreak +
    '*~';
  
  // Node.js
  Result[1].Name := 'Node';
  Result[1].Description := 'Node.js projects';
  Result[1].Category := 'Languages';
  Result[1].Content := 
    '# Logs' + sLineBreak +
    'logs' + sLineBreak +
    '*.log' + sLineBreak +
    'npm-debug.log*' + sLineBreak +
    'yarn-debug.log*' + sLineBreak +
    'yarn-error.log*' + sLineBreak +
    '' + sLineBreak +
    '# Dependency directories' + sLineBreak +
    'node_modules/' + sLineBreak +
    'jspm_packages/' + sLineBreak +
    '' + sLineBreak +
    '# TypeScript cache' + sLineBreak +
    '*.tsbuildinfo' + sLineBreak +
    '' + sLineBreak +
    '# Optional npm cache directory' + sLineBreak +
    '.npm' + sLineBreak +
    '' + sLineBreak +
    '# Optional eslint cache' + sLineBreak +
    '.eslintcache' + sLineBreak +
    '' + sLineBreak +
    '# Optional stylelint cache' + sLineBreak +
    '.stylelintcache' + sLineBreak +
    '' + sLineBreak +
    '# dotenv environment variables file' + sLineBreak +
    '.env' + sLineBreak +
    '.env.test' + sLineBreak +
    '.env.local' + sLineBreak +
    '' + sLineBreak +
    '# Next.js build output' + sLineBreak +
    '.next' + sLineBreak +
    'out' + sLineBreak +
    '' + sLineBreak +
    '# Build output' + sLineBreak +
    'dist' + sLineBreak +
    'build' + sLineBreak +
    '' + sLineBreak +
    '# yarn v3' + sLineBreak +
    '.yarn/*' + sLineBreak +
    '!.yarn/patches' + sLineBreak +
    '!.yarn/plugins' + sLineBreak +
    '!.yarn/releases' + sLineBreak +
    '!.yarn/sdks' + sLineBreak +
    '!.yarn/versions';
  
  // Java
  Result[2].Name := 'Java';
  Result[2].Description := 'Java projects';
  Result[2].Category := 'Languages';
  Result[2].Content := 
    '# Compiled class file' + sLineBreak +
    '*.class' + sLineBreak +
    '' + sLineBreak +
    '# Log file' + sLineBreak +
    '*.log' + sLineBreak +
    '' + sLineBreak +
    '# BlueJ files' + sLineBreak +
    '*.ctxt' + sLineBreak +
    '' + sLineBreak +
    '# Mobile Tools for Java (J2ME)' + sLineBreak +
    '.mtj.tmp/' + sLineBreak +
    '' + sLineBreak +
    '# Package Files' + sLineBreak +
    '*.jar' + sLineBreak +
    '*.war' + sLineBreak +
    '*.nar' + sLineBreak +
    '*.ear' + sLineBreak +
    '*.zip' + sLineBreak +
    '*.tar.gz' + sLineBreak +
    '*.rar' + sLineBreak +
    '' + sLineBreak +
    '# Maven' + sLineBreak +
    'target/' + sLineBreak +
    'pom.xml.tag' + sLineBreak +
    'pom.xml.releaseBackup' + sLineBreak +
    'pom.xml.versionsBackup' + sLineBreak +
    'pom.xml.next' + sLineBreak +
    '' + sLineBreak +
    '# Gradle' + sLineBreak +
    '.gradle' + sLineBreak +
    'build/';
  
  // C#
  Result[3].Name := 'C#';
  Result[3].Description := 'C# / .NET projects';
  Result[3].Category := 'Languages';
  Result[3].Content := 
    '# Build results' + sLineBreak +
    '[Dd]ebug/' + sLineBreak +
    '[Rr]elease/' + sLineBreak +
    'x64/' + sLineBreak +
    'x86/' + sLineBreak +
    '[Bb]in/' + sLineBreak +
    '[Oo]bj/' + sLineBreak +
    '' + sLineBreak +
    '# Visual Studio cache/options' + sLineBreak +
    '.vs/' + sLineBreak +
    '' + sLineBreak +
    '# Visual Studio profiler' + sLineBreak +
    '*.psess' + sLineBreak +
    '*.vsp' + sLineBreak +
    '*.vspx' + sLineBreak +
    '' + sLineBreak +
    '# User-specific files' + sLineBreak +
    '*.rsuser' + sLineBreak +
    '*.suo' + sLineBreak +
    '*.user' + sLineBreak +
    '*.userosscache' + sLineBreak +
    '*.sln.docstates' + sLineBreak +
    '' + sLineBreak +
    '# NuGet Packages' + sLineBreak +
    '*.nupkg' + sLineBreak +
    '**/packages/*' + sLineBreak +
    '' + sLineBreak +
    '# .NET Core' + sLineBreak +
    'project.lock.json' + sLineBreak +
    'project.fragment.lock.json' + sLineBreak +
    'artifacts/';
  
  // Delphi
  Result[4].Name := 'Delphi';
  Result[4].Description := 'Delphi projects';
  Result[4].Category := 'Languages';
  Result[4].Content := 
    '# Compiled files' + sLineBreak +
    '*.dcu' + sLineBreak +
    '*.exe' + sLineBreak +
    '*.dll' + sLineBreak +
    '*.bpl' + sLineBreak +
    '*.dcp' + sLineBreak +
    '*.so' + sLineBreak +
    '*.apk' + sLineBreak +
    '*.drc' + sLineBreak +
    '*.map' + sLineBreak +
    '*.dres' + sLineBreak +
    '*.rsm' + sLineBreak +
    '*.tds' + sLineBreak +
    '*.dsk' + sLineBreak +
    '*.ddp' + sLineBreak +
    '' + sLineBreak +
    '# Delphi local files' + sLineBreak +
    '*.local' + sLineBreak +
    '*.identcache' + sLineBreak +
    '*.projdata' + sLineBreak +
    '*.tvsconfig' + sLineBreak +
    '**/*.stat' + sLineBreak +
    '' + sLineBreak +
    '# Delphi history and backup' + sLineBreak +
    '__history/' + sLineBreak +
    '__recovery/' + sLineBreak +
    '*.~*' + sLineBreak +
    '' + sLineBreak +
    '# Output directories' + sLineBreak +
    'Win32/' + sLineBreak +
    'Win64/' + sLineBreak +
    'OSX32/' + sLineBreak +
    'OSX64/' + sLineBreak +
    'Android/' + sLineBreak +
    'iOSDevice/' + sLineBreak +
    'iOSSimulator/';
  
  // Visual Studio Code
  Result[5].Name := 'Visual Studio Code';
  Result[5].Description := 'VS Code editor';
  Result[5].Category := 'IDEs';
  Result[5].Content := 
    '.vscode/*' + sLineBreak +
    '!.vscode/settings.json' + sLineBreak +
    '!.vscode/tasks.json' + sLineBreak +
    '!.vscode/launch.json' + sLineBreak +
    '!.vscode/extensions.json' + sLineBreak +
    '*.code-workspace' + sLineBreak +
    '' + sLineBreak +
    '# Local History for Visual Studio Code' + sLineBreak +
    '.history/';
  
  // JetBrains IDEs
  Result[6].Name := 'JetBrains';
  Result[6].Description := 'JetBrains IDEs (IntelliJ, PyCharm, WebStorm, etc.)';
  Result[6].Category := 'IDEs';
  Result[6].Content := 
    '# Covers JetBrains IDEs: IntelliJ, RubyMine, PhpStorm, AppCode, PyCharm, CLion, Android Studio, WebStorm and Rider' + sLineBreak +
    '' + sLineBreak +
    '*.iml' + sLineBreak +
    '' + sLineBreak +
    '# User-specific stuff' + sLineBreak +
    '.idea/**/workspace.xml' + sLineBreak +
    '.idea/**/tasks.xml' + sLineBreak +
    '.idea/**/usage.statistics.xml' + sLineBreak +
    '.idea/**/dictionaries' + sLineBreak +
    '.idea/**/shelf' + sLineBreak +
    '' + sLineBreak +
    '# Generated files' + sLineBreak +
    '.idea/**/contentModel.xml' + sLineBreak +
    '' + sLineBreak +
    '# Sensitive or high-churn files' + sLineBreak +
    '.idea/**/dataSources/' + sLineBreak +
    '.idea/**/dataSources.ids' + sLineBreak +
    '.idea/**/dataSources.local.xml' + sLineBreak +
    '.idea/**/sqlDataSources.xml' + sLineBreak +
    '.idea/**/dynamic.xml' + sLineBreak +
    '.idea/**/uiDesigner.xml' + sLineBreak +
    '.idea/**/dbnavigator.xml';
  
  // macOS
  Result[7].Name := 'macOS';
  Result[7].Description := 'macOS system files';
  Result[7].Category := 'Operating Systems';
  Result[7].Content := 
    '# General' + sLineBreak +
    '.DS_Store' + sLineBreak +
    '.AppleDouble' + sLineBreak +
    '.LSOverride' + sLineBreak +
    '' + sLineBreak +
    '# Icon must end with two \r' + sLineBreak +
    'Icon' + sLineBreak +
    '' + sLineBreak +
    '# Thumbnails' + sLineBreak +
    '._*' + sLineBreak +
    '' + sLineBreak +
    '# Files that might appear in the root of a volume' + sLineBreak +
    '.DocumentRevisions-V100' + sLineBreak +
    '.fseventsd' + sLineBreak +
    '.Spotlight-V100' + sLineBreak +
    '.TemporaryItems' + sLineBreak +
    '.Trashes' + sLineBreak +
    '.VolumeIcon.icns' + sLineBreak +
    '.com.apple.timemachine.donotpresent' + sLineBreak +
    '' + sLineBreak +
    '# Directories potentially created on remote AFP share' + sLineBreak +
    '.AppleDB' + sLineBreak +
    '.AppleDesktop' + sLineBreak +
    'Network Trash Folder' + sLineBreak +
    'Temporary Items' + sLineBreak +
    '.apdisk';
  
  // Windows
  Result[8].Name := 'Windows';
  Result[8].Description := 'Windows system files';
  Result[8].Category := 'Operating Systems';
  Result[8].Content := 
    '# Windows thumbnail cache files' + sLineBreak +
    'Thumbs.db' + sLineBreak +
    'Thumbs.db:encryptable' + sLineBreak +
    'ehthumbs.db' + sLineBreak +
    'ehthumbs_vista.db' + sLineBreak +
    '' + sLineBreak +
    '# Dump file' + sLineBreak +
    '*.stackdump' + sLineBreak +
    '' + sLineBreak +
    '# Folder config file' + sLineBreak +
    '[Dd]esktop.ini' + sLineBreak +
    '' + sLineBreak +
    '# Recycle Bin used on file shares' + sLineBreak +
    '$RECYCLE.BIN/' + sLineBreak +
    '' + sLineBreak +
    '# Windows Installer files' + sLineBreak +
    '*.cab' + sLineBreak +
    '*.msi' + sLineBreak +
    '*.msix' + sLineBreak +
    '*.msm' + sLineBreak +
    '*.msp' + sLineBreak +
    '' + sLineBreak +
    '# Windows shortcuts' + sLineBreak +
    '*.lnk';
  
  // Linux
  Result[9].Name := 'Linux';
  Result[9].Description := 'Linux system files';
  Result[9].Category := 'Operating Systems';
  Result[9].Content := 
    '*~' + sLineBreak +
    '' + sLineBreak +
    '# temporary files which can be created if a process still has a handle open of a deleted file' + sLineBreak +
    '.fuse_hidden*' + sLineBreak +
    '' + sLineBreak +
    '# KDE directory preferences' + sLineBreak +
    '.directory' + sLineBreak +
    '' + sLineBreak +
    '# Linux trash folder which might appear on any partition or disk' + sLineBreak +
    '.Trash-*' + sLineBreak +
    '' + sLineBreak +
    '# .nfs files are created when an open file is removed but is still being accessed' + sLineBreak +
    '.nfs*';
end;

function GetGitIgnoreTemplateByName(const AName: String): String;
var
  Templates: TArray<TGitIgnoreTemplate>;
  Template: TGitIgnoreTemplate;
begin
  Result := '';
  Templates := GetGitIgnoreTemplates;
  for Template in Templates do
  begin
    if SameText(Template.Name, AName) then
    begin
      Result := Template.Content;
      Break;
    end;
  end;
end;

function GetTemplateCategories: TArray<String>;
var
  Categories: TList<String>;
  Templates: TArray<TGitIgnoreTemplate>;
  Template: TGitIgnoreTemplate;
begin
  Categories := TList<String>.Create;
  try
    Templates := GetGitIgnoreTemplates;
    for Template in Templates do
    begin
      if not Categories.Contains(Template.Category) then
        Categories.Add(Template.Category);
    end;
    Result := Categories.ToArray;
  finally
    Categories.Free;
  end;
end;

function GetTemplatesByCategory(const ACategory: String): TArray<TGitIgnoreTemplate>;
var
  Templates: TArray<TGitIgnoreTemplate>;
  FilteredList: TList<TGitIgnoreTemplate>;
  Template: TGitIgnoreTemplate;
begin
  FilteredList := TList<TGitIgnoreTemplate>.Create;
  try
    Templates := GetGitIgnoreTemplates;
    for Template in Templates do
    begin
      if SameText(Template.Category, ACategory) then
        FilteredList.Add(Template);
    end;
    Result := FilteredList.ToArray;
  finally
    FilteredList.Free;
  end;
end;

end.