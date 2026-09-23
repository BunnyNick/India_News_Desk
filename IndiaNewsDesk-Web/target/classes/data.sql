-- Seed data — only inserts if the table is empty
INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT * FROM (SELECT
  'The Hindu','English','Tamil Nadu','Tamil Nadu,Karnataka,Andhra Pradesh,Telangana,Kerala,Delhi,Maharashtra',
  'https://www.thehindu.com','https://epaper.thehindu.com','1878',true,'SOUTH') AS tmp
WHERE NOT EXISTS (SELECT 1 FROM newspapers LIMIT 1);

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Times of India','English','Delhi','Delhi,Maharashtra,Uttar Pradesh,Gujarat,Karnataka,West Bengal,Rajasthan,Tamil Nadu',
  'https://timesofindia.indiatimes.com','https://epaper.timesgroup.com','1838',true,'NORTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Times of India');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Hindustan Times','English','Delhi','Delhi,Uttar Pradesh,Punjab,Haryana,Bihar,Uttarakhand,Chandigarh',
  'https://www.hindustantimes.com','https://epaper.hindustantimes.com','1924',true,'NORTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Hindustan Times');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'The Indian Express','English','Delhi','Delhi,Maharashtra,Gujarat,Punjab,Karnataka,Uttar Pradesh,Tamil Nadu',
  'https://indianexpress.com','https://epaper.indianexpress.com','1932',true,'NORTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='The Indian Express');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Deccan Herald','English','Karnataka','Karnataka',
  'https://www.deccanherald.com','https://epaper.deccanherald.com','1948',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Deccan Herald');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Deccan Chronicle','English','Telangana','Telangana,Andhra Pradesh,Tamil Nadu',
  'https://www.deccanchronicle.com','https://epaper.deccanchronicle.com','1938',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Deccan Chronicle');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'The Telegraph','English','West Bengal','West Bengal,Jharkhand,Odisha,Assam',
  'https://www.telegraphindia.com','https://epaper.telegraphindia.com','1982',true,'EAST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='The Telegraph');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'The Tribune','English','Punjab','Punjab,Haryana,Himachal Pradesh,Jammu & Kashmir,Chandigarh,Delhi',
  'https://www.tribuneindia.com','https://epaper.tribuneindia.com','1881',true,'NORTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='The Tribune');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'The New Indian Express','English','Tamil Nadu','Tamil Nadu,Karnataka,Kerala,Andhra Pradesh,Telangana,Odisha',
  'https://www.newindianexpress.com','https://epaper.newindianexpress.com','1932',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='The New Indian Express');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Assam Tribune','English','Assam','Assam,Meghalaya,Arunachal Pradesh,Manipur,Mizoram,Nagaland,Tripura,Sikkim',
  'https://www.assamtribune.com','https://epaper.assamtribune.com','1939',true,'NORTHEAST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Assam Tribune');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Dainik Jagran','Hindi','Uttar Pradesh','Uttar Pradesh,Delhi,Bihar,Jharkhand,Uttarakhand,Madhya Pradesh,Chhattisgarh,Punjab,Haryana',
  'https://www.jagran.com','https://epaper.jagran.com','1942',true,'NORTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Dainik Jagran');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Dainik Bhaskar','Hindi','Madhya Pradesh','Madhya Pradesh,Rajasthan,Uttar Pradesh,Bihar,Jharkhand,Haryana,Delhi,Gujarat,Chhattisgarh',
  'https://www.bhaskar.com','https://epaper.bhaskar.com','1958',true,'CENTRAL'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Dainik Bhaskar');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Amar Ujala','Hindi','Uttar Pradesh','Uttar Pradesh,Uttarakhand,Delhi,Punjab,Haryana,Himachal Pradesh,Jammu & Kashmir,Rajasthan',
  'https://www.amarujala.com','https://epaper.amarujala.com','1948',true,'NORTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Amar Ujala');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Hindustan (Hindi)','Hindi','Delhi','Delhi,Uttar Pradesh,Bihar,Jharkhand,Uttarakhand',
  'https://www.livehindustan.com','https://epaper.livehindustan.com','1936',true,'NORTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Hindustan (Hindi)');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Rajasthan Patrika','Hindi','Rajasthan','Rajasthan,Madhya Pradesh,Gujarat,Delhi,Uttar Pradesh',
  'https://www.patrika.com','https://epaper.patrika.com','1956',true,'NORTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Rajasthan Patrika');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Punjab Kesari','Hindi','Delhi','Delhi,Punjab,Haryana,Himachal Pradesh,Jammu & Kashmir',
  'https://www.punjabkesari.in','https://epaper.punjabkesari.in','1965',true,'NORTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Punjab Kesari');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Prabhat Khabar','Hindi','Jharkhand','Jharkhand,Bihar,West Bengal',
  'https://www.prabhatkhabar.com','https://epaper.prabhatkhabar.com','1984',true,'EAST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Prabhat Khabar');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Dinamalar','Tamil','Tamil Nadu','Tamil Nadu,Puducherry',
  'https://www.dinamalar.com','https://epaper.dinamalar.com','1951',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Dinamalar');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Dinamani','Tamil','Tamil Nadu','Tamil Nadu,Puducherry',
  'https://www.dinamani.com','https://epaper.dinamani.com','1933',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Dinamani');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Daily Thanthi','Tamil','Tamil Nadu','Tamil Nadu,Puducherry',
  'https://www.dailythanthi.com','https://epaper.dailythanthi.com','1942',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Daily Thanthi');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Eenadu','Telugu','Andhra Pradesh','Andhra Pradesh,Telangana',
  'https://www.eenadu.net','https://epaper.eenadu.net','1974',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Eenadu');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Sakshi','Telugu','Telangana','Andhra Pradesh,Telangana',
  'https://www.sakshi.com','https://epaper.sakshi.com','2008',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Sakshi');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Andhra Jyothy','Telugu','Andhra Pradesh','Andhra Pradesh,Telangana',
  'https://www.andhrajyothy.com','https://epaper.andhrajyothy.com','1960',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Andhra Jyothy');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Vijaya Karnataka','Kannada','Karnataka','Karnataka',
  'https://vijaykarnataka.com','https://epaper.vijaykarnataka.com','1999',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Vijaya Karnataka');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Prajavani','Kannada','Karnataka','Karnataka',
  'https://www.prajavani.net','https://epaper.prajavani.net','1948',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Prajavani');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Udayavani','Kannada','Karnataka','Karnataka',
  'https://www.udayavani.com','https://epaper.udayavani.com','1971',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Udayavani');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Malayala Manorama','Malayalam','Kerala','Kerala',
  'https://www.manoramaonline.com','https://epaper.manoramaonline.com','1890',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Malayala Manorama');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Mathrubhumi','Malayalam','Kerala','Kerala',
  'https://www.mathrubhumi.com','https://epaper.mathrubhumi.com','1923',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Mathrubhumi');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Kerala Kaumudi','Malayalam','Kerala','Kerala',
  'https://www.keralakaumudi.com','https://epaper.keralakaumudi.com','1911',true,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Kerala Kaumudi');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Lokmat','Marathi','Maharashtra','Maharashtra',
  'https://www.lokmat.com','https://epaper.lokmat.com','1971',true,'WEST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Lokmat');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Maharashtra Times','Marathi','Maharashtra','Maharashtra',
  'https://maharashtratimes.com','https://epaper.maharashtratimes.com','1962',true,'WEST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Maharashtra Times');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Sakal','Marathi','Maharashtra','Maharashtra',
  'https://www.esakal.com','https://epaper.esakal.com','1932',true,'WEST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Sakal');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Ananda Bazar Patrika','Bengali','West Bengal','West Bengal',
  'https://www.anandabazar.com','https://epaper.anandabazar.com','1922',true,'EAST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Ananda Bazar Patrika');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Sangbad Pratidin','Bengali','West Bengal','West Bengal',
  'https://sangbadpratidin.in','https://epaper.sangbadpratidin.in','1991',true,'EAST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Sangbad Pratidin');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Gujarat Samachar','Gujarati','Gujarat','Gujarat',
  'https://www.gujaratsamachar.com','https://epaper.gujaratsamachar.com','1932',true,'WEST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Gujarat Samachar');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Divya Bhaskar','Gujarati','Gujarat','Gujarat',
  'https://www.divyabhaskar.co.in','https://epaper.divyabhaskar.co.in','2003',true,'WEST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Divya Bhaskar');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Ajit','Punjabi','Punjab','Punjab,Chandigarh',
  'https://www.ajitjalandhar.com','https://epaper.ajitjalandhar.com','1955',true,'NORTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Ajit');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Sambad','Odia','Odisha','Odisha',
  'https://sambad.in','https://epaper.sambad.in','1984',true,'EAST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Sambad');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Dharitri','Odia','Odisha','Odisha',
  'https://www.dharitri.com','https://epaper.dharitri.com','1974',true,'EAST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Dharitri');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Siasat Daily','Urdu','Telangana','Telangana,Andhra Pradesh',
  'https://www.siasat.com','https://epaper.siasat.com','1948',false,'SOUTH'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Siasat Daily');

INSERT INTO newspapers (name, language, state, all_states, website_url, epaper_url, founded, free_epaper, region)
SELECT 'Amar Asom','Assamese','Assam','Assam',
  'https://www.amarasom.com','https://epaper.amarasom.com','1983',false,'NORTHEAST'
WHERE NOT EXISTS (SELECT 1 FROM newspapers WHERE name='Amar Asom');
