#base image
FROM alpine:3.5

#installa dipendenze py e pip
RUN apk add --update py2-pip

#installa py requiriments per avviare app Flask
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

#copia i file creati per la ricetta dentro l'immagine
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

#PORTA SU dove sarà esposta l'applicazione Flask
EXPOSE 5001

#ultimo passo: avviare l'applicazione. 
#Primo scopo di CMD -> comunicare al container quale comando deve essere avviato di default all'avvio
CMD ["python", "/usr/src/app/app.py"]

