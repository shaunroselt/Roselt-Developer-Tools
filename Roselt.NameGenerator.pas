// This will be a unit to generate random names of people
//
// Look at the following for inspiration :
//
// https://randomwordgenerator.com/name.php
// https://www.behindthename.com/random/
// https://www.randomlists.com/random-first-names?dup=false&qty=12
// https://www.name-generator.org.uk/
unit Roselt.NameGenerator;

interface

function GenerateRandomName(const GenerateFullName: Boolean = false): string;

implementation

uses
  System.Classes, System.Types, System.SysUtils;

function GenerateRandomName(const GenerateFullName: Boolean = false): string;
begin
  var slFirstNames := TStringList.Create;
  var slLastNames := TStringList.Create;
  try
    // Load First Names from Resources
    var firstnamesStream := TResourceStream.Create(HInstance, 'firstnames', RT_RCDATA);
    try
      slFirstNames.LoadFromStream(firstnamesStream, TEncoding.UTF8);
    finally
      firstnamesStream.Free;
    end;

    // Load Last Names from Resources
    var lastnamesStream := TResourceStream.Create(HInstance, 'lastnames', RT_RCDATA);
    try
      slLastNames.LoadFromStream(lastnamesStream, TEncoding.UTF8);
    finally
      lastnamesStream.Free;
    end;

    Randomize;

    var firstname := slFirstNames[Random(slFirstNames.Count - 1)];
    var lastname := '';
    if GenerateFullName then
    begin
      lastname := slLastNames[Random(slFirstNames.Count - 1)];

      Result := firstname + ' ' + lastname;
    end
    else
      Result := firstname;
  finally
    slLastNames.Free;
    slFirstNames.Free;
  end;
end;

end.

