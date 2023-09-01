# PRŮVODNÍ LISTINA

V první části listiny je zadání projektu spolu s popisem tvorby tabulek. Následuje popis vypracování výstupů, pro jednotlivé výzkumné otázky z vytvořených tabulek, kde najdete i slovní odpovědi na výzkumné otázky. Závěrem je problematika související s chybějícími daty.

## Zadání:
**Úvod do projektu**
Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.
Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.
Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

Datové sady, které je možné použít pro získání vhodného datového podkladu:

**Primární tabulky**

+ czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
+ czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
+ czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
+ czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
+ czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
+ czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
+ czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.

**Číselníky sdílených informací o ČR**

+ czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
+ czechia_district – Číselník okresů České republiky dle normy LAU.

**Dodatečné tabulky**

+ countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
+ economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

**Výzkumné otázky**

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

**Výstup projektu**

Pomozte kolegům s daným úkolem. Výstupem by měly být dvě tabulky v databázi, ze kterých se požadovaná data dají získat. Tabulky pojmenujte: *t_{jmeno}_{prijmeni}_project_SQL_primary_final* (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky) a *t_{jmeno}_{prijmeni}_project_SQL_secondary_final* (pro dodatečná data o dalších evropských státech).

Dále připravte sadu SQL, které z vámi připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky. Pozor, otázky/hypotézy mohou vaše výstupy podporovat i vyvracet! Záleží na tom, co říkají data.

Na svém GitHub účtu vytvořte repozitář (může být soukromý), kam uložíte všechny informace k projektu – hlavně SQL skript generující výslednou tabulku, popis mezivýsledků (průvodní listinu) a informace o výstupních datech (například kde chybí hodnoty apod.).

Neupravujte data v primárních tabulkách! Pokud bude potřeba transformovat hodnoty, dělejte tak až v tabulkách nebo pohledech, které si nově vytváříte.

## Tvorba tabulek:
Pro tvorbu robustních datových podkladů byly v projektu použity veškeré primární tabulky a číselníky. První spojení pro vytvoření pohledu v_anna_korbelova_sql_primary_final je mezi tabulkou czechia_price a czechia_payroll na základě fukce YEAR. Další spojení je s číselníkem czechia_price_category pro získání názvů kategorie potravin. Dále pokračuji s číselníky: czechia_payroll_calculation, czechia_payroll_industry_branch, czechia_payroll_unit, czechia_payroll_value_type. Všechny spojujeme podle kódu, který je dle ER diagramu spojem pro všechny číselníky i tabulky. Z číselníku czechia_payroll_value_type pomocí WHERE podmíníme výběr pouze kódu 5958, tedy průměrné hrubé mzdy na zaměstnance. Seskupíme dle let a týdnů měření, názvů odvětví a druhů potravin. Seřadíme opět dle let a týdnů. Selektujeme všechny sloupečky, které jsou žádoucí pro odpovědi na výzkumné otázky: měřené týdny (funkce WEEKOFYEAR), měřené roky, průměrné mzdy, kód a název odvětví, druhy potravin, průměrné ceny potravin a jednotku měření. Vytvořím pohled s názvem v_anna_korbelova_project_sql_primary_final, dle zadání. Číselníky czechia_region ani czechia_district neobsahují potřebná data, takže je nepoužiji. Pro tvorbu pohledu v_anna_korbelova_sql_secondary_final použiji pouze tabulku economies, protože druhá tabulka countries neposkytuje data, která potřebuji získat pro zodpovězení výzkumných otázek. Bylo by možné spojení těchto dvou tabulek pomocí sloupečku country, ale nedostali bychom požadovaná data viz. otázka č. 5. 

## Vypracování výzkumných otázek a odpovědí:

*1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?* 
Pro tuto otázku si vyselektuji roky, průměrné mzdy a názvy odvětví, které zároveň podmíním pomocí WHERE, že nesmí mít NULL hodnoty. Seskupím a seřadím dle let a názvu odvětví a vytvořím pohled                   v_anna_korbelova_sql_answer_1.

**Odpověď:** Pohled mi ukáže, že mzdy v průběhu let všechny rostou. Klesaly pouze v letech 2012-2013 v odvětvích: Admin. a podpůrné činnosti, Doprava a skladování, Informační a komunikační činnosti, Peněžnictví a pojišťovnictví, Těžba a dobývání, Veřejná správa a obrana, Vzdělávání, Zásob. vodou, Zdravotnictví. Dále v letech 2008-2009 klesaly v odvětvích: Činnosti v oblasti nemovitostí, Ostatní činnosti, Ubyt. stravování a pohostinství, Velkoobchod a maloobchod, Zeměděltví, lesnictví, rybářství. Pokles zaznamenaly také odvětví Profesní, vědecké a tech. čin. a Stavebnictví a to v letech 2009-2010 a Kulturní, zábavní a rekreační čin. a opět Veřejná správa v letech 2010-2011.

*2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?* 
Tentokrát jsem si nevybrala pohled, ale Common Table Expression, protože potřebuji zobrazit celkem 4 informace. Cenu kg/l chleba nebo mléka a průměrnou mzdu za první a poslední srovnatelné období, kde podílem získám    odpovědi. V SELECTU používám pro první        srovnatelné období funci MIN a pro poslední funkci MAX ve sloupečku let. V podmínce WHERE si vyhledám konkrétní druh potraviny a to buď Chléb konzumní kmínový a nebo Mléko polotučné pasterované. Seskupím a seřadím pomocí týdnů a let. Zaokrouhlím pomocí funce ROUND      ihned ve vnořeném SELECTu na dvě desetinná místa. Pro vyfiltrování pouze jednoho řádku s odpovědí jsem použila opět podmínku WHERE a to s číslem 1 pro první týden v prvním roce měření a číslem 50 pro poslední uvedený týden měření dle dostupných dat.

**Odpověď:**  Za první srovnatelné období, kterým je 1. týden roku 2006, si za průměrnou mzdu 18.270,- koupím 1.294,84 kg chleba nebo 1.292,99l mléka. Za poslední srovnatelné období, kterým je 50. týden v roce 2018 si za stejnou mzdu koupím 1.074,07kg chleba nebo 1.283,91l mléka.
   
*3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?* 
Vytvořím si pohled s názvem v_anna_korbelova_sql_answer_3, vyselektuji kategorii potravin, roky a pomocí funkce AVG zjistím průměrné ceny a seskupením a seřazením i jejich postupný vývoj.

**Odpověď:** Nejpomaleji zdražuje kategorie Pšeničná mouka hladká s meziročním percentuálním nárůstem 5,571%.

*4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?*
   Opět využiji Common Table Expression pro zobrazení dvou hodnot, v tomto případě let. V první vyselektuji název odvětví a zaokrouhlený průměr let s průměrnými mzdami, vnořeným SELECTem podmíním průměrné mzdy > 10. Stejně postupuji pro získání meziročního vývoje cen,     kde se stejnými podmínkami vyselektuji kategorii potravin s průměrnými zaokrouhlenými cenami.

**Odpověď:** Rok, ve kterém byl meziroční nárůst mezd větší než 10 % je rok 2010 a to v odvětví Administrativní a podpůrné činnosti. Pro stený rok 2010 platí i meziroční nárůst cen větší než 10% pro kategorii potravin Banány žluté.

*5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?*
   K této otázce je vypracován pohled v_anna_korbelova_sql_secondary_final, ale odpověď nedostaneme, jelikož není možné tabulku propojit s daty o půměrných mzdách ani cenách potravin. S pohledu zjistíme pouze HDP, gini koeficient (bohužel s NULL hodnotami) a populaci za stejné období jako jsme měli u primární tabulky pro Českou republiku 2006-2018. Data jsou zobrazená pro veškeré názvy lokalit, která obsahují slovo "Euro" jelikož se názvy oblastí měnily během let a v zadání není přesně uvedeno o které evropské země se jedná. 

**Odpověď:** Na otázku není možné odpovědět, chybí dostupná data.

 Vypracovala Anna Korbelová 
 1.9.2023
