// Look at the following for inspiration :
//
// https://loremipsum.io/generator/
// https://lipsum.com/
// https://loremipsumgenerator.org/
// https://www.webfx.com/tools/lorem-ipsum-generator/
// https://loremgenerator.io/

unit Roselt.LoremIpsum;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TLoremIpsumType = (Paragraphs, Sentences, Words, Lists);
  TLoremIpsumCase = (Regular, Lower, Upper, Title);

function GenerateLoremIpsum(tType: TLoremIpsumType; tCase: TLoremIpsumCase; iCount: UInt64): String;


implementation

function GenerateLoremIpsum(tType: TLoremIpsumType; tCase: TLoremIpsumCase; iCount: UInt64): String;
const
  LoremIpsumWord: array[0..513] of string = ('lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur',
    'adipiscing', 'elit', 'curabitur', 'vel', 'hendrerit', 'libero',
    'eleifend', 'blandit', 'nunc', 'ornare', 'odio', 'ut',
    'orci', 'gravida', 'imperdiet', 'nullam', 'purus', 'lacinia',
    'a', 'pretium', 'quis', 'congue', 'praesent', 'sagittis',
    'laoreet', 'auctor', 'mauris', 'non', 'velit', 'eros',
    'dictum', 'proin', 'accumsan', 'sapien', 'nec', 'massa',
    'volutpat', 'venenatis', 'sed', 'eu', 'molestie', 'lacus',
    'quisque', 'porttitor', 'ligula', 'dui', 'mollis', 'tempus',
    'at', 'magna', 'vestibulum', 'turpis', 'ac', 'diam',
    'tincidunt', 'id', 'condimentum', 'enim', 'sodales', 'in',
    'hac', 'habitasse', 'platea', 'dictumst', 'aenean', 'neque',
    'fusce', 'augue', 'leo', 'eget', 'semper', 'mattis',
    'tortor', 'scelerisque', 'nulla', 'interdum', 'tellus', 'malesuada',
    'rhoncus', 'porta', 'sem', 'aliquet', 'et', 'nam',
    'suspendisse', 'potenti', 'vivamus', 'luctus', 'fringilla', 'erat',
    'donec', 'justo', 'vehicula', 'ultricies', 'varius', 'ante',
    'primis', 'faucibus', 'ultrices', 'posuere', 'cubilia', 'curae',
    'etiam', 'cursus', 'aliquam', 'quam', 'dapibus', 'nisl',
    'feugiat', 'egestas', 'class', 'aptent', 'taciti', 'sociosqu',
    'ad', 'litora', 'torquent', 'per', 'conubia', 'nostra',
    'inceptos', 'himenaeos', 'phasellus', 'nibh', 'pulvinar', 'vitae',
    'urna', 'iaculis', 'lobortis', 'nisi', 'viverra', 'arcu',
    'morbi', 'pellentesque', 'metus', 'commodo', 'ut', 'facilisis',
    'felis', 'tristique', 'ullamcorper', 'placerat', 'aenean', 'convallis',
    'sollicitudin', 'integer', 'rutrum', 'duis', 'est', 'etiam',
    'bibendum', 'donec', 'pharetra', 'vulputate', 'maecenas', 'mi',
    'fermentum', 'consequat', 'suscipit', 'aliquam', 'habitant', 'senectus',
    'netus', 'fames', 'quisque', 'euismod', 'curabitur', 'lectus',
    'elementum', 'tempor', 'risus', 'cras', 'idiculus', 'utrum',
    'get', 't', 't', 'unc', 'itae', 'iam',
    'gestas', 'nim', 'c', 'uis', 'u', 'ellentesque',
    'incidunt', 'rcu', 'auris', 'on', 'ellus', 'liquam',
    'assa', 'ulla', 'olutpat', 'aucibus', 'ortor', 'iverra',
    'ibh', 'dipiscing', 'i', 'urpis', 'eque', 'urus',
    'isus', 'el', 'acus', 'ectus', 'rna', 'ec',
    'orbi', 'isl', '', 'rnare', 'ltrices', 'liquet',
    'ursus', 'lementum', 'eugiat', 'lit', 'dio', 'llamcorper',
    'uam', 'alesuada', 'psum', 'olor', 'attis', 'ravida',
    'rci', 'celerisque', 'estibulum', 'onsectetur', 'onsequat', 'ui',
    'haretra', 'ristique', 'roin', 'st', 'ulputate', 'onec',
    'uis', 'orem', 'retium', 'agittis', 'empor', 'ras',
    'ulvinar', 'apien', 'ltricies', 'ommodo', 'uspendisse', 'enean',
    'acilisis', 'orttitor', 'ugue', 'osuere', 'elit', 'enenatis',
    'ibendum', 'ermentum', 'emper', 'eo', 'agna', 'landit',
    'ed', 'n', 'it', 'd', 'ociis', 'arius',
    'uisque', 'ollicitudin', 'ibero', 'ignissim', 'nteger', 'mperdiet',
    'arius', 'ictum', 'elis', 'ondimentum', 'onvallis', 'aecenas',
    'isi', 'uismod', 'obortis', 'empus', 'nterdum', 'olestie',
    'tiam', 'n', 'aoreet', 'hasellus', 'em', 'uctor',
    'lacerat', 'honcus', 'ccumsan', 'ed', 'ongue', 'usto',
    'etus', 'ullam', 'met', 'leifend', 'aculis', 'etus',
    'orta', 'ringilla', 'assa', 'rat', 'raesent', 'get',
    'nim', 'am', 'liquam', 'd', 'unc', 'ames',
    'isus', 'utrum', 'odales', 'c', 'endrerit', 'enectus',
    't', 't', 'iam', 'abitant', 'rcu', 't',
    'acilisi', 'aucibus', 'acinia', 'auris', 'urus', 'urabitur',
    'ros', 'orbi', 'ellentesque', 'latea', 'it', 'rna',
    'ivamus', 'ictumst', 'u', 'ac', 'igula', 'urpis',
    'itae', 'ignissim', 'gestas', 'abitasse', 'ectus', 'on',
    'eo', 'attis', 'haretra', 'ellus', 'ulputate', '',
    'eque', 'ortor', 'ltrices', 'iverra', 'usce', 'ravida',
    'uctus', 'ollis', 'ulla', 'uscipit', 'nte', 'ondimentum',
    'um', 'st', 'ibero', 'i', 'us', 'ec',
    'dio', 'uis', 'honcus', 'incidunt', 'elit', 'enean',
    'liquet', 'ursus', 'onec', 'acilisis', 'psum', 'acus',
    'alesuada', 'rci', 'idiculus', 'apien', 'estibulum', 'onsectetur',
    'onsequat', 'ui', 'rat', 'mperdiet', 'nterdum', 'atoque',
    'ibh', 'isl', 'rnare', 'enatibus', 'otenti', 'emper',
    'ristique', 'llamcorper', 'ltricies', 'el', 'dipiscing', 'uctor',
    'landit', 'olor', 'uis', 'lementum', 'lit', 'nteger',
    'aoreet', 'ascetur', 'retium', 'uam', 'met', 't',
    'olutpat', 'ibendum', 'ongue', 'ictum', 'leifend', 'ermentum',
    'eugiat', 'orem', 'aecenas', 'agnis', 'celerisque', 'enectus',
    'ugue', 'ommodo', 'ras', 'apibus', 'ames', 'ringilla',
    'isi', 'lacerat', 'osuere', 'ulvinar', 'em', 'uspendisse',
    'is', 'acilisi', 'abitasse', 'usto', 'igula', 'olestie',
    'arturient', 'hasellus', 'uisque', 'ollicitudin', 'empor', 'enenatis',
    'uismod', 'elis', 'aculis', 'obortis', 'agna', 'ontes',
    'ontes', 'ascetur', 'ullam', 'roin', 'agittis', 'uscipit',
    'empus', 'ehicula', 'ccumsan', 'ictumst', 'tiam', 'abitant',
    'uctus', 'etus', 'orttitor', 'otenti', 'ivamus', 'nte',
    'urabitur', 'usce', 'latea', 'ociis', 'odales', 'liqua',
    'onvallis', 'is', 'o', 'olore', 'iusmod', 'ac',
    'endrerit', 'ncididunt', 'abore', 'ollis', 'am', 'atoque',
    'etus', 'enatibus', 'orta', 'raesent');
begin
  var LoremIpsumStringList := TStringList.Create();

  if (tType = TLoremIpsumType.Paragraphs) then
  begin
    for var J := 1 to iCount do
    begin
      var LoremIpsumString := '';
      for var I in LoremIpsumWord do
      begin
        var NewSentence := False;
        var Seperator := String(' ');
        var RandomPercent := Random(100);
        if (RandomPercent < 30) then
        begin
          Seperator := ', ';
          if (RandomPercent < 15) then
          begin
            Seperator := '. ';
            NewSentence := True;
          end;
        end;

        var FinalWord := I;

        if (LoremIpsumString.Length > 0) then
        begin
          if (CharInSet(LoremIpsumString[1], ['A'..'Z'])) OR (CharInSet(LoremIpsumString[1], ['a'..'z']))  then
            LoremIpsumString := LoremIpsumString + Seperator;
        end else
        begin
          if (FinalWord.Length > 1) then
            FinalWord := UpperCase(FinalWord[1]) + Copy(FinalWord, 2, FinalWord.Length)
          else
            FinalWord := FinalWord.ToUpper;
        end;

        if ((tCase = TLoremIpsumCase.Regular) AND (NewSentence = True)) OR (tCase = TLoremIpsumCase.Title) then
        begin
          if (FinalWord.Length > 1) then
            FinalWord := UpperCase(FinalWord[1]) + Copy(FinalWord, 2, FinalWord.Length)
          else
            FinalWord := FinalWord.ToUpper;
        end;

        LoremIpsumString := LoremIpsumString + FinalWord;
      end;
      LoremIpsumStringList.Add(LoremIpsumString);
      LoremIpsumStringList.Add('');
    end;
  end;


  if (tType = TLoremIpsumType.Sentences) then
  begin
    var LoremIpsumString := '';
    var SentenceCount := 0;
    while (SentenceCount < iCount) do
    begin
      var I := Random(Length(LoremIpsumWord));
      var NewSentence := False;
      var Seperator := String(' ');
      var RandomPercent := Random(100);
      if (RandomPercent < 30) then
      begin
        Seperator := ', ';
        if (RandomPercent < 15) then
        begin
          Seperator := '. ';
          NewSentence := True;
          inc(SentenceCount);
        end;
      end;

      var FinalWord := LoremIpsumWord[I];

      if (LoremIpsumString.Length > 0) then
      begin
        if (CharInSet(LoremIpsumString[1], ['A'..'Z'])) OR (CharInSet(LoremIpsumString[1], ['a'..'z']))  then
          LoremIpsumString := LoremIpsumString + Seperator;
      end else
      begin
        if (FinalWord.Length > 1) then
          FinalWord := UpperCase(FinalWord[1]) + Copy(FinalWord, 2, FinalWord.Length)
        else
          FinalWord := FinalWord.ToUpper;
      end;

      if ((tCase = TLoremIpsumCase.Regular) AND (NewSentence = True)) OR (tCase = TLoremIpsumCase.Title) then
      begin
        if (FinalWord.Length > 1) then
          FinalWord := UpperCase(FinalWord[1]) + Copy(FinalWord, 2, FinalWord.Length)
        else
          FinalWord := FinalWord.ToUpper;
      end;

      if (SentenceCount < iCount) then
        LoremIpsumString := LoremIpsumString + FinalWord;
    end;
    LoremIpsumStringList.Add(LoremIpsumString);
  end;

  if (tType = TLoremIpsumType.Lists) then
  begin
    var LoremIpsumString := '';
    var SentenceCount := 0;
    while (SentenceCount < iCount) do
    begin
      var I := Random(Length(LoremIpsumWord));
      var NewSentence := False;
      var Seperator := String(' ');
      var RandomPercent := Random(100);
      if (RandomPercent < 30) then
      begin
        Seperator := ', ';
        if (LoremIpsumString.Length > 0) then
          if (RandomPercent < 15) then
          begin
            Seperator := '. ';
            NewSentence := True;
            inc(SentenceCount);
          end;
      end;

      var FinalWord := LoremIpsumWord[I];

      if (LoremIpsumString.Length > 0) then
      begin
        if (CharInSet(LoremIpsumString[1], ['A'..'Z'])) OR (CharInSet(LoremIpsumString[1], ['a'..'z']))  then
        begin
          LoremIpsumString := LoremIpsumString + Seperator;
          if (NewSentence = True) then
          begin
            LoremIpsumStringList.Add(LoremIpsumString);
            LoremIpsumString := '';
          end;
        end;
      end else
      begin
        if (FinalWord.Length > 1) then
          FinalWord := UpperCase(FinalWord[1]) + Copy(FinalWord, 2, FinalWord.Length)
        else
          FinalWord := FinalWord.ToUpper;
      end;

      if ((tCase = TLoremIpsumCase.Regular) AND (NewSentence = True)) OR (tCase = TLoremIpsumCase.Title) then
      begin
        if (FinalWord.Length > 1) then
          FinalWord := UpperCase(FinalWord[1]) + Copy(FinalWord, 2, FinalWord.Length)
        else
          FinalWord := FinalWord.ToUpper;
      end;

      if (SentenceCount < iCount) then
        LoremIpsumString := LoremIpsumString + FinalWord;
    end;
  end;

  if (tType = TLoremIpsumType.Words) then
  begin
    for var J := 1 to iCount do
    begin
      var LoremIpsumString := '';
      var I := Random(Length(LoremIpsumWord));

      var FinalWord := LoremIpsumWord[I];

      if (tCase = TLoremIpsumCase.Regular) OR (tCase = TLoremIpsumCase.Title) then
      begin
        if (FinalWord.Length > 1) then
          FinalWord := UpperCase(FinalWord[1]) + Copy(FinalWord, 2, FinalWord.Length)
        else
          FinalWord := FinalWord.ToUpper;
      end;

      LoremIpsumString := LoremIpsumString + FinalWord;
      LoremIpsumStringList.Add(LoremIpsumString);
    end;
  end;

  if (tCase = TLoremIpsumCase.Lower) then LoremIpsumStringList.Text := LoremIpsumStringList.Text.ToLower;
  if (tCase = TLoremIpsumCase.Upper) then LoremIpsumStringList.Text := LoremIpsumStringList.Text.ToUpper;

  result := LoremIpsumStringList.Text;

  LoremIpsumStringList.Free;
end;


end.
