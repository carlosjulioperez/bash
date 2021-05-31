#cp /home/carper/local/fullstack/code/code_original /home/carper/local/fullstack/code/VSCode-linux-x64/code
#cp /home/carper/local/fullstack/sleek-todo/sleek_original /home/carper/local/fullstack/sleek-todo/sleek/opt/sleek/sleek

# #https://lotoftech.com/the-faster-and-safer-way-to-copy-files-in-linux-than-cp/
# cd Downloads/test
# #tar cf - . | pv | (cd /output/directory && tar xvf -)

# ORIGEN=/home/carper/local/fullstack/sleek-todo/copiar
# DESTINO=/home/carper/local/fullstack/sleek-todo/sleek/opt/sleek
# cd $ORIGEN
# tar cf - . | pv | (cd $DESTINO && tar xvf -)

ORIGEN=/home/carper/local/fullstack/code/copiar
DESTINO=/home/carper/local/fullstack/code/VSCode-linux-x64
cd $ORIGEN
tar cf - . | pv | (cd $DESTINO && tar xvf -)
