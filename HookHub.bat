@echo off && Title HookHub && chcp 65001 >nul && setlocal ENABLEDELAYEDEXPANSION
echo this script is more or less a proof of concept I will probably rewrite it once I finish my other scripts
echo feel free to take and rip my script up to make something of your own (I would love to see it if you want to show me)
echo I do NOT condone any malicious use
echo.
echo.
echo.
echo.

set /p webhook=Input your Discord Webhook:

set colorIF1=[4;37mColor.[0m Sets color for webhook's embed. It equals 0 (transparent) by default. Color requires number instead
set colorIF2=hex code, so you have to convert hexadecimal color code to decimal number. Color can be defined
set colorIF3=as number 65280 and as string "65280".
set colorIF4= [40m13421772, [41m12914463[0m, [42m1286414[0m, [43m12688384[0m, [44m14298[0m, [45m8918936[0m, [46m3839709[0m, [47m[30m13421772[0m
set colorIF5= [0;100m7763574[0m, [0;101m15157334[0m, [0;102m1490444[0m, [0;103m16380325[0m, [0;104m3897599[0m, [0;105m9438079[0m, [0;106m6411990[0m, [0;107m[30m15921906[0m
set AuthorIF1=[4;37mAuthor.[0m Adds Author block to embed. author is an object which includes three values: 
set AuthorIF2=•name- sets name
set AuthorIF3=•url - sets link. Requires name value. If used, transforms name into hyperlink.
set AuthorIF4=•icon_url - sets avatar. Requires name value.
set TitleIF=[4;37mTitle.[0m Sets title for webhook's embed.
set UrlIF=[4;37mURL.[0m Sets link for title in your webhook message. Requires title variable and turns it into hyperlink.
set DescriptionIF=[4;37mDescription.[0m Sets description for webhook's embed.
set FieldsIF1=[4;37mFields.[0m Allows you to use multiple title + description blocks in embed. fields is an array of field objects. Each object includes three values:
set FieldsIF2=•name - sets name for field object. Required;
set FieldsIF3=•value - sets description for field object. Required;
set FieldsIF4=•inline - if true then sets field objects in same line, but if you have more than 3 objects with
set FieldsIF5=enabled inline or just too long you will get rows with 3 fields in each one or with 2 fields if
set FieldsIF6=you used thumbnail object. false by default. Optional.
set ImageIF1=[4;37mImage.[0m Allows you to add image to the embed.
set ImageIF2=url value must be valid url that starts with http(s):// or attachment://
set ThumbnailIF1=[4;37mThumbnail.[0m Allows you to add thumbnail to the embed.
set ThumbnailIF2=url value must be valid url that starts with http(s):// or attachment://
set FooterIF1=[4;37mFooter.[0m Allows you to add footer to embed. footer is an object which includes two values:
set FooterIF2=•text - sets name for author object. Markdown is disabled here!!!
set FooterIF3=•icon_url - sets icon for author object. Requires text value.
set TimeStampIF1=[4;37mTimeStamp.[0m Allows you to add timestamp to embed.
set TimeStampIF2=Time stores as String in the next format: "YYYY-MM-DDTHH:MM:SS.MSSZ". If footer was used they will be separated with a bullet (•).

:HookHub 
Title HookHub && cls 
echo  _   _                _     _   _         _     
echo ^| ^| ^| ^|              ^| ^|   ^| ^| ^| ^|       ^| ^|    
echo ^| ^|_^| ^|  ___    ___  ^| ^| __^| ^|_^| ^| _   _ ^| ^|__  
echo ^|  _  ^| / _ \  / _ \ ^| ^|/ /^|  _  ^|^| ^| ^| ^|^| '_ \ 
echo ^| ^| ^| ^|^| (_) ^|^| (_) ^|^|   ^< ^| ^| ^| ^|^| ^|_^| ^|^| ^|_) ^|
echo \_^| ^|_/ \___/  \___/ ^|_^|\_\\_^| ^|_/ \__,_^|^|_.__/ 
echo.
echo 1.Content (send a normal discord message)
echo 2.Embeds (presets and semi customs)


set /p HookHub=Type option:
if "%HookHub%"=="1" goto Content
if "%HookHub%"=="2" goto Embed
goto HookHub

:Content
set /p userInput= Input Content:
set "jsonData={\"content\":\"%userInput%\"}"
powershell -Command "(Invoke-WebRequest -Uri '%webhook%' -Method Post -Body '%jsonData%' -ContentType 'application/json').Content"
pause
goto HookHub

:Embed
cls
echo  _   _                _     _   _         _     
echo ^| ^| ^| ^|              ^| ^|   ^| ^| ^| ^|       ^| ^|    
echo ^| ^|_^| ^|  ___    ___  ^| ^| __^| ^|_^| ^| _   _ ^| ^|__  
echo ^|  _  ^| / _ \  / _ \ ^| ^|/ /^|  _  ^|^| ^| ^| ^|^| '_ \ 
echo ^| ^| ^| ^|^| (_) ^|^| (_) ^|^|   ^< ^| ^| ^| ^|^| ^|_^| ^|^| ^|_) ^|
echo \_^| ^|_/ \___/  \___/ ^|_^|\_\\_^| ^|_/ \__,_^|^|_.__/ 
echo.
echo 1.Default (Title, Description, Color)
echo 2.URL (Title, URL, color)

set /p Embed=Type option:
if "%Embed%"=="1" goto Default
if "%Embed%"=="2" goto URL


:Default
cls
echo %TitleIF%
echo %DescriptionIF%
echo %colorIF1%
echo %colorIF2%
echo %colorIF3%
echo %colorIF4%
echo %colorIF5%
set /p embedTitle= Embed Title:
set /p embedDescription= Embed Description:
set /p embedColor= Embed Color:

set "jsonData={\"embeds\":[{\"title\":\"%embedTitle%\",\"description\":\"%embedDescription%\",\"color\":%embedColor%}]}"
powershell -Command "(Invoke-WebRequest -Uri '%webhook%' -Method Post -Body '%jsonData%' -ContentType 'application/json').Content"
echo Message sent to webhook.
pause
goto HookHub

:URL
cls
echo %TitleIF%
echo %UrlIF%
echo %colorIF1%
echo %colorIF2%
echo %colorIF3%
echo %colorIF4%
echo %colorIF5%
echo.
set /p embedTitle= Embed Title:
set /p embedURL= Embed URL:
set /p embedColor= Embed Color:

set "jsonData={\"embeds\":[{\"title\":\"%embedTitle%\",\"url\":\"%embedUrl%\",\"color\":\"%embedColor%\"}]}"
powershell -Command "(Invoke-WebRequest -Uri '%webhook%' -Method Post -Body '%jsonData%' -ContentType 'application/json').Content"
echo Message sent to webhook.
pause
goto HookHub


::Plans

:: Content (Sends Normal msgs)✓

:: features I want in the Embed
:: Author
:: Title ✓
:: Color. with pre and custom ✓
:: Description ✓
:: URL ✓
:: Fields. seems rather hard and not worth it
:: Image. a way to view it?
:: Footer. seems rather easy
:: Timestamps. might be able to auto do this