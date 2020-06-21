#!/bin/bash

read -p "Digite um nome para o pacote: " nome
mkdir $nome
mkdir -p $nome/DEBIAN
cd $nome/DEBIAN
touch control postinst postrm preinst prerm
chmod +x postinst postrm preinst prerm

echo "Section: misc" >> control
echo "Priority: optional" >> control
echo "Package: $nome" >> control
echo "Version: 0.1" >> control
echo "Maintainer: luizcarlosteste<lcpcm@hotmail.com>" >> control
echo "Pre-Depends: libc6" >> control
echo "Depends: wget" >> control
echo "Architecture: all" >> control
echo "Description: Este pacote tem por finalidade somente besteira." >> control

echo '#!/bin/bash' >> postinst
echo 'echo -e "Executando o arquivo postinst"' >> postinst

echo '#!/bin/bash' >> postrm
echo 'echo -e "Executando o arquivo postrm"' >> postrm

echo '#!/bin/bash' >> preinst
echo 'echo -e "Executando o arquivo preinst"' >> preinst

echo '#!/bin/bash' >> prerm
echo 'echo -e "Executando o arquivo prerm"' >> prerm
