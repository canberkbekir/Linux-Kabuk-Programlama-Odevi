#!/bin/bash

# sysinfo_page - A script to produce an HTML file

data=$(zenity --forms --text="CV Yaratma" --separator "," \
--add-entry "Ad:" \
--add-entry "Soyad:" \
--add-entry "Telefon numaranız:" \
--add-entry "Mail:" \
--add-entry "Hedefiniz:" \
--add-entry "Okulunuz:" \
--add-entry "Bölümünüz:" \
--add-entry "Ofis yetenekleriniz:" \
--add-entry "Bilgisayar bilginiz:" \
--add-entry "Çalıştığınız yer 1:" \
--add-entry "Yaptığınız iş:" \
--add-entry "Çalıştığınız yer 2:" \
--add-entry "Yaptığınız iş:" \
--add-entry "Hobileriniz:" \
--add-entry "Referanslarınız:" \
--add-entry "CV yazı rengi için renk kodu:" \

)


ad=$(echo $data | awk -F ',' '{print $1}' )
soyad=$(echo $data | awk -F ',' '{print $2}' )
telefon=$(echo $data | awk -F ',' '{print $3}' )
mail=$(echo $data | awk -F ',' '{print $4}' )
objective=$(echo $data | awk -F ',' '{print $5}' )
school=$(echo $data | awk -F ',' '{print $6}' )
major=$(echo $data | awk -F ',' '{print $7}' )
ofis=$(echo $data | awk -F ',' '{print $8}' )
bilgisayar=$(echo $data | awk -F ',' '{print $9}' )
is1=$(echo $data | awk -F ',' '{print $10}' )
des1=$(echo $data | awk -F ',' '{print $11}' )
is2=$(echo $data | awk -F ',' '{print $12}' )
des2=$(echo $data | awk -F ',' '{print $13}' )
hobby=$(echo $data | awk -F ',' '{print $14}' )
ref=$(echo $data | awk -F ',' '{print $15}' )
renk=$(echo $data | awk -F ',' '{print $16}' )





cat << EOF > ex-4.html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

     <title>One Page Resume</title>

     <style type="text/css">
        * { margin: 0; padding: 0; }
        body { font: 16px Helvetica, Sans-Serif; line-height: 24px; background: url(images/noise.jpg); }
        .clear { clear: both; }
        #page-wrap { width: 800px; margin: 40px auto 60px; }
        #pic { float: right; margin: -30px 0 0 0; }
        h1 { margin: 0 0 16px 0; padding: 0 0 16px 0; font-size: 42px; font-weight: bold; letter-spacing: -2px; border-bottom: 1px solid #$renk; }
        h2 { font-size: 20px; margin: 0 0 6px 0; position: relative; }
        h2 span { position: absolute; bottom: 0; right: 0; font-style: italic; font-family: Georgia, Serif; font-size: 16px; color: #$renk; font-weight: normal; }
        p { margin: 0 0 16px 0; }
        a { color: #$renk; text-decoration: none; border-bottom: 1px dotted #$renk; }
        a:hover { border-bottom-style: solid; color: black; }
        ul { margin: 0 0 32px 17px; }
        #objective { width: 500px; float: left; }
        #objective p { font-family: Georgia, Serif; font-style: italic; color: #$renk; }
        dt { font-style: italic; font-weight: bold; font-size: 18px; text-align: right; padding: 0 26px 0 0; width: 150px; float: left; height: 100px; border-right: 1px solid #$renk;  }
        dd { width: 600px; float: right; }
        dd.clear { float: none; margin: 0; height: 15px; }
     </style>
</head>

<body>

    <div id="page-wrap">



        <div id="contact-info" class="vcard">

            <!-- Microformats! -->

            <h1 class="fn"> $ad $soyad </h1>

            <p>
                Cell: <span class="tel">$telefon</span><br />
                Email: <a class="email" href="mailto:$mail">$mail</a>
            </p>
        </div>

        <div id="objective">
            <p>
                $objective
            </p>
        </div>

        <div class="clear"></div>

        <dl>
            <dd class="clear"></dd>

            <dt>Education</dt>
            <dd>
                <h2>$school</h2>
                <p><strong>Major:</strong> $major<br />

            </dd>

            <dd class="clear"></dd>

            <dt>Skills</dt>
            <dd>
                <h2>Office skills</h2>
                <p>$ofis</p>

                <h2>Computer skills</h2>
                <p>$bilgisayar</p>
            </dd>

            <dd class="clear"></dd>

            <dt>Experience</dt>
            <dd>
                <h2>$is1 </h2>
                <ul>
                    $des1
                </ul>

                <h2>$is2 </h2>
                <ul>
                    $des2
                </ul>
            </dd>

            <dd class="clear"></dd>

            <dt>Hobbies</dt>
            <dd>$hobby</dd>

            <dd class="clear"></dd>

            <dt>References</dt>
            <dd>$ref</dd>

            <dd class="clear"></dd>
        </dl>

        <div class="clear"></div>

    </div>

</body>

</html>
EOF
